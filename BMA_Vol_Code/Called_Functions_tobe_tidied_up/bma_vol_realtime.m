function [vol_matrix_summit,bma_vol_matrix,libor_vol_matrix,bma_rates,ratio_vol,r_bma_ratio1,r_bma_basis1,r_bma1,r_libor1,ddate,snapshot_time] = bma_vol_realtime(time_frame);
% Input Parameter 
% ddate : the date
% time_frame : the time window to estimate the non-libor factors volatility

% Sample call: [vol_matrix_summit,bma_vol_matrix,libor_vol_matrix,bma_rates,ratio_vol,r_bma_ratio,r_bma_basis,r_bma,r_libor,ddate,snapshot_time] = bma_vol_realtime(60);

%%  Below is to load the LIBOR volatility surface real time
ddate_now = datestr(now);
ddate = ddate_now(1:11);

%%  Below is to load the historical data for BMA basis curve, BMA fixed
%%  given the time frame
[r_bma_ratio,r_bma_basis,r_bma,r_libor]= get_history_data(ddate,time_frame);

%% Below is to calculate the fwd BMA rate, LIBOR rate and fwd BMA/LIBOR
%% ratio
%[fwd_bma,fwd_libor,fwd_ratio] = produce_bma_fwd(ddate,r_bma_basis,r_libor);
[fwd_bma,fwd_libor,fwd_ratio] = produce_bma_fwd_new1(ddate,r_bma_basis,r_libor);

[nobs,nnodes] = size(r_bma);

%%  get the dynamics - the daily change
dr_libor = diff(r_libor);
dr_bma= diff(r_bma);
dr_bma_basis = diff(r_bma_basis);

%BMA-basis spread to BMA-fixed;
spread_to_bma_fixed = diff(r_bma_basis - r_bma);

%BMA-basis spread change to %LIBOR
%spread_to_libor = dr_bma_basis - dr_libor.*r_bma_basis(1:nobs-1,:);
spread_to_libor = dr_bma_basis - dr_libor.*r_bma_ratio(1:nobs-1,:)./100;

corr_libor = zeros(12,12); % alpha
corr_bma = zeros(12,12);   % beta
corr_bma_libor = zeros(12,12);    % rho

time_start = 1;
time_end = nobs-1;

% alpha -correlation to capture bma basis relative to the mean-reverting libor short rate 
for i = 1:1:12
    for j =1:1:12
        %R = corrcoef(spread_to_libor(time_start:time_end,i),r_libor(time_start:time_end,j));
        R = corrcoef(spread_to_libor(time_start:time_end,i),dr_libor(time_start:time_end,j));
        corr_libor(i,j) = R(1,2);
    end;
end;
% beta - correlation to capture the bma basis with bma short rate
for i = 1:1:12
    for j =1:1:12
        %    R = corrcoef(r_bma_basis(time_start:time_end,i),r_bma(time_start:time_end,j));
        %    R = corrcoef(spread_to_libor(time_start:time_end,i),r_bma(time_start:time_end,j));
             R = corrcoef(spread_to_libor(time_start:time_end,i),dr_bma(time_start:time_end,j));
        corr_bma(i,j) = R(1,2);
    end;
end;
% rho - correlation to capture the bma fixed and  libor correlation 
for i = 1:1:12
    for j =1:1:12
        %R = corrcoef(dr_bma(time_start:time_end,i),dr_libor(time_start:time_end,j));
        R = corrcoef(r_bma(time_start:time_end,i),r_libor(time_start:time_end,j));
        corr_bma_libor(i,j) = R(1,2);
    end;
end;

%  get the live LIBOR surface
%[r_bma_ratio1,r_bma_basis1,r_bma1,r_libor1,libor_vol_matrix,libor_vol_interp,snapshot_time1,snapshot_time2]= get_realtime_data();
%[r_bma_ratio1,r_bma_basis1,r_bma1,r_libor1,libor_vol_matrix,libor_vol_interp,snapshot_time1,snapshot_time2]= get_realtime_data1();
[r_bma_ratio1,r_bma_basis1,r_bma1,r_libor1,libor_vol_matrix,libor_vol_interp,snapshot_time1,snapshot_time2]= get_realtime_data2();


snapshot_time = snapshot_time2;
% Interpret libor_vol_matrix
libor_vol_matrix(:,8:9) = []; % 8Y9Y is missing;
libor_vol_matrix(:,6)  = [];   
for i=1:1:18
    if libor_vol_matrix(i,8) >0
        libor_vol_matrix(i,8) = libor_vol_matrix(i,8);
    else
       libor_vol_matrix(i,8) = (libor_vol_matrix(i,7).*3 + libor_vol_matrix(i,9).*2)./5;
    end;
end;

%controling factor based on calibration of the level of  ATM vol to the historical vol of LIBOR
cauthy_tuning_constant = 1;
libor_vol_avg = mean(mean(libor_vol_matrix));
libor_vol_ts = std(r_libor)./mean(r_libor).*100;
level = libor_vol_avg./libor_vol_ts.*cauthy_tuning_constant;

bma_vol_libor_base = libor_vol_matrix.*fwd_ratio;
bma_vol_libor = libor_vol_matrix.*repmat(diag(corr_libor),1,18)';
% annualized bma spread ts vol
bma_fixed_vol = repmat(std(r_bma(time_start:time_end,:)),18,1)*sqrt(260);
% translate that to the percentage vol
bma_vol_fixed = bma_fixed_vol.*repmat(diag(corr_bma),1,18)'.*repmat(level,18,1);
%bma_vol_fixed = bma_fixed_vol.*repmat(diag(corr_bma),1,18)'.*sqrt(260);
bma_vol_corr  = bma_vol_libor.*bma_vol_fixed.*repmat(diag(corr_bma_libor),1,18)';

%bma_vol_2factors = sqrt(bma_vol_libor_base.^2+bma_vol_libor.^2 + bma_vol_fixed.^2 + 2*bma_vol_corr);
%bma_vol_2factors = sqrt(bma_vol_libor_base.^2+bma_vol_libor.^2 + bma_vol_fixed.^2 + bma_vol_corr);
bma_vol_residual = sqrt(bma_vol_libor.^2 + bma_vol_fixed.^2 + bma_vol_corr);
bma_vol_2factors = sqrt(bma_vol_libor_base.^2+bma_vol_libor.^2 + bma_vol_fixed.^2 + bma_vol_corr);

% improvement can be made here to better tune the residual 

bma_vol_matrix = bma_vol_2factors;


%% Calibration to market quotes
% Method one: paparall shit based on the average quotes diference 
%bma_vol_matrix = bma_vol_matrix + 1.3; 

% Method two : paparall shit based on the average ratio 
% Calculate the calibration ratio 
% Market quote 5x5, 5x10,5x20 ; 10x5,  10x10,10x20 , using average ratio
% with the old vol output - the calibration ratio and constant are based
% onthe regression result. 

% default value is 1 and 0 
%calibration_ratio = 1; 
%calibration_constant = 0; 
calibration_ratio = 1.04;
calibration_constant = 0.4;
bma_vol_matrix = bma_vol_matrix .* calibration_ratio + calibration_constant ; 

% Method three : shit based on the shape of  the vol surface calibrated to
% the difference with market quotes
%bma_vol_matrix = bma_vol_matrix + 1.3; 

%figure;
subplot(2,2,1);
%expiry = [1/12;3/12;6/12;1;2;3;4;5;7;10]';
expiry = [1/12;3/12;6/12;9/12;1;2;3;4;5;6;7;8;9;10;15;20;25;30]';
tenor = [1;2;3;4;5;7;10;12;15;20;25;30]';
[X,Y] = meshgrid(tenor,expiry);
surf(X,Y,libor_vol_matrix);
view(65,15);

subplot(2,2,4);
%expiry = [1/12;3/12;6/12;1;2;3;4;5;7;10]';
expiry = [1/12;3/12;6/12;9/12;1;2;3;4;5;6;7;8;9;10;15;20;25;30]';
tenor = [1;2;3;4;5;7;10;12;15;20;25;30]';
[X,Y] = meshgrid(tenor,expiry);
%surf(X,Y,bma_vol_matrix);
surf(X,Y,bma_vol_matrix - libor_vol_matrix);
view(65,15);

ratio_vol =bma_vol_matrix./libor_vol_matrix;
ratio_r = r_bma_ratio(nobs,:);

expiry1 = [1/52;1/12;2/12;3/12;6/12;9/12;1;1.5;2;3;4;5;6;7;8;9;10;15;20;25;30]';
tenor1 = [3/12;6/12;1;2;3;4;5;6;7;8;9;10;15;20;25;30]';
[X1,Y1] = meshgrid(tenor1,expiry1);
vol_matrix_summit = interp2(X,Y,bma_vol_matrix,X1,Y1);

% the above will return valid value  for 2:17 , we need interplate 
vol_matrix_summit(1,:)= 2.*vol_matrix_summit(2,:)-vol_matrix_summit(3,:);
%vol_matrix_summit(18,:)= 2.*vol_matrix_summit(17,:)-vol_matrix_summit(16,:);
%vol_matrix_summit(19,:)= 2.*vol_matrix_summit(18,:)-vol_matrix_summit(17,:);
%vol_matrix_summit(20,:)= 2.*vol_matrix_summit(19,:)-vol_matrix_summit(18,:);
%vol_matrix_summit(21,:)= 2.*vol_matrix_summit(20,:)-vol_matrix_summit(19,:);

vol_matrix_summit(:,2)= vol_matrix_summit(:,3) - (vol_matrix_summit(:,3)-vol_matrix_summit(:,4)).*0.1;
vol_matrix_summit(:,1)= vol_matrix_summit(:,2) - (vol_matrix_summit(:,2)-vol_matrix_summit(:,3)).*0.1;
subplot(2,2,2);
surf(X1,Y1,vol_matrix_summit);
view(65,15);

subplot(2,2,3);
surf(X,Y,ratio_vol);
view(0,0);

r_bma_basis1 = r_bma_ratio1.*r_libor1./100;
bma_rates = r_bma_basis1;

%% override 3M using cap vol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vol_matrix_summit = using_cap_vol(r_bma_ratio1,vol_matrix_summit);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

export_SUMMI(vol_matrix_summit,snapshot_time);
%export_SUMMI_newyork(vol_matrix_summit,snapshot_time);
%export_SUMMI_libor(libor_vol_matrix,snapshot_time);

ddate3 = datestr(snapshot_time,'yyyymmdd_HHMM');
filename = ['S:\Products\Research\market data\BMA vol raw data\swaptionvol.market_import_bma_' ddate3 '.mat'];

[SKEW,snapshot_time3]= get_realtime_skew();
save(filename);

print_fwd(snapshot_time1,fwd_libor,fwd_bma,fwd_ratio);








