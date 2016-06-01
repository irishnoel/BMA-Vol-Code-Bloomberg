function [r_mxn,fwd_mxn_90D,mxn_vol,vol_spot] = mxn(ddate,period_window);

%r_mxn = mxn('Oct-04-2007',30);
%ddate = datenum('Oct-02-2007');

ddate = datenum(ddate);
%period_window = 2;

end_date = datestr(ddate);
begin_date = datestr(ddate-period_window);

% First establish the data connection to bloomberg;
connection = bloomberg;

%% Get the USD SWAP MUNI % of LIBOR
MXN03M= fetch(connection,'MPSWC CMPL Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
MXN06M= fetch(connection,'MPSWF CMPL Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
MXN01Y= fetch(connection,'MPSW1A CMPL Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
MXN02Y= fetch(connection,'MPSW2B CMPL Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
MXN03Y= fetch(connection,'MPSW3C CMPL Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
MXN04Y= fetch(connection,'MPSW4D CMPL Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
MXN05Y = fetch(connection,'MPSW5E CMPL Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
MXN07Y = fetch(connection,'MPSW7G CMPL Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
MXN10Y = fetch(connection,'MPSW10K CMPL Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

mxnfx = fetch(connection,'MXN Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

ddate_string = datestr(MXN01Y(:,1));

r_mxn = [MXN03M(:,2)';MXN06M(:,2)';MXN01Y(:,2)';MXN02Y(:,2)';MXN03Y(:,2)';MXN04Y(:,2)';...
               MXN05Y(:,2)';MXN07Y(:,2)';MXN10Y(:,2)';]';

%r_bma_basis = r_bma_ratio.*repmat(US0003M(:,2),1,12)./100;    
 close(connection);

%% Specify the Interest Rate initial term structure
%bma_rates = ((1+bma_rates./400).^2 -1).*200; 
ddate = datestr(ddate);
yyyy = str2num(ddate(8:11));
ddmm = ddate(1:7);
matu1 = [ddmm num2str(yyyy+1)];
matu2 = [ddmm num2str(yyyy+2)];
matu3 = [ddmm num2str(yyyy+3)];
matu4 = [ddmm num2str(yyyy+4)];
matu5 = [ddmm num2str(yyyy+5)];
matu7 = [ddmm num2str(yyyy+7)];
matu10 = [ddmm num2str(yyyy+10)];

Compounding = 2;
ValuationDate = ddate;
StartDate = ValuationDate;
%EndDates = [ddate;matu1;matu2;matu3;matu4;matu5;matu7;matu10;matu12;matu15;matu20;matu25;matu30];
EndDates = [matu1;matu2;matu3;matu4;matu5;matu7;matu10;];
%Rates  = [(bma_rates(1)-0.25)./100;bma_rates'./100;];

[num_days,dummy] = size(MXN01Y);
fwd_mxn_90D = zeros(9,7,num_days);

for ii = 1:1:num_days
fwd_mxn = zeros(9,7);
Rates  = r_mxn(ii,3:9)'./100;
RateSpec = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates);
mat_step = [1;2;3;4;5;7;10];
for i = 1:1:7  
ddmm = ddate(1:7);    
Settle = [ddmm num2str(yyyy+mat_step(i))];
fyyyy = str2num(Settle(8:11));
fmatu1 = [ddmm num2str(fyyyy+1)];
fmatu2 = [ddmm num2str(fyyyy+2)];
fmatu3 = [ddmm num2str(fyyyy+3)];
fmatu4 = [ddmm num2str(fyyyy+4)];
fmatu5 = [ddmm num2str(fyyyy+5)];
fmatu7 = [ddmm num2str(fyyyy+7)];
fmatu10 = [ddmm num2str(fyyyy+10)];
Maturity = [fmatu1;fmatu2;fmatu3;fmatu4;fmatu5;fmatu7;fmatu10;];
Basis = 0; 
Principal = 100;
LegType = [1 0]; % [Fixed Float] 
LegReset = [12 12]; % Payments frequency per year 
LegRate = [NaN 0]; 

[size_maturity,dummy] = size(Maturity);

[Price, SwapRate] = swapbyzero(RateSpec, LegRate,...
                  Settle, Maturity, LegReset, Basis, Principal,LegType);
SwapRate = SwapRate'.*100;
fwd_mxn(i+2,:) = SwapRate;
end;

fwd_mxn_diff = fwd_mxn(3,:) - r_mxn(end,3:9);
fwd_mxn(2,:) = r_mxn(end,3:9) + 3/12.*fwd_mxn_diff;
fwd_mxn(1,:) = r_mxn(end,3:9) + 6/12.*fwd_mxn_diff;

fwd_mxn_90D(:,:,ii) = fwd_mxn;

ii
end;

mxn_vol = zeros(9,9);

for i =1:1:9
    for j = 1:1:7
        raw = fwd_mxn_90D(i,j,:);        
        mxn_vol(i,j+2) = std(diff(log(raw)))*sqrt(252);        
    end
end

vol_spot = std(diff(log(r_mxn)))*sqrt(252);
vol_spot = vol_spot';

mxn_vol(:,1) = vol_spot + (mxn_vol(:,3) - vol_spot)./3; 
mxn_vol(:,2) = (mxn_vol(:,1) + mxn_vol(:,3))./2; 
mxn_vol(2,:) = (mxn_vol(1,:) + mxn_vol(3,:))./2; 


        
        
        
        
        



