function [fwd_bma,fwd_libor,fwd_ratio] = produce_bma_fwd_new1(ddate,r_bma_basis,r_libor);
%% This is a function to construct a HJM tree using the initial interest
%  term structure and the bma volatility surface 
%ddate = 'Sep-28-2007';
%rates = [ 0.05;0.05;0.05;0.05]; 
%vol_matrix : this is the implied vol for BMA surface
% [bma_hjm_tree,BDTTree,RateSpec,PriceTreeBDT] = produce_bma_tree(ddate,r_bma_basis,bma_vol_matrix);

%% Specify the Interest Rate initial term structure
%bma_rates = ((1+bma_rates./400).^2 -1).*200; 
yyyy = str2num(ddate(8:11));
ddmm = ddate(1:7);
matu1 = [ddmm num2str(yyyy+1)];
matu2 = [ddmm num2str(yyyy+2)];
matu3 = [ddmm num2str(yyyy+3)];
matu4 = [ddmm num2str(yyyy+4)];
matu5 = [ddmm num2str(yyyy+5)];
matu7 = [ddmm num2str(yyyy+7)];
matu10 = [ddmm num2str(yyyy+10)];
matu12 = [ddmm num2str(yyyy+12)];
matu15 = [ddmm num2str(yyyy+15)];
matu20 = [ddmm num2str(yyyy+20)];
matu25 = [ddmm num2str(yyyy+25)];
matu30 = [ddmm num2str(yyyy+30)];

%some interprate points in between
matu31 = [ddmm num2str(yyyy+31)];
matu35 = [ddmm num2str(yyyy+32)];
matu40 = [ddmm num2str(yyyy+35)];
matu50 = [ddmm num2str(yyyy+50)];
matu60 = [ddmm num2str(yyyy+60)];
Compounding = 2;
ValuationDate = ddate;
StartDate = ValuationDate;
%EndDates = [ddate;matu1;matu2;matu3;matu4;matu5;matu7;matu10;matu12;matu15;matu20;matu25;matu30];
EndDates = [matu1;matu2;matu3;matu4;matu5;matu7;matu10;matu12;matu15;matu20;matu25;matu30;matu35;matu40;];
%Rates  = [(bma_rates(1)-0.25)./100;bma_rates'./100;];

fwd_bma = zeros(18,12);
fwd_libor = zeros(18,12);
fwd_ratio = zeros(18,12);

%% for BMA

%bma_ratio = r_bma_basis(end,:)./r_libor(end,:);
%Rates  = r_libor(end,:)'./100;
%Rates = Rates.*bma_ratio';


Rates  = r_bma_basis(end,:)'./100;
Rates = ((1 + Rates./4).^2 - 1)*2 ; 
%Rates = ((1 + Rates./2).^0.5 - 1)*4 ; 

%% adjustment to reconsile with SUMMIT and BB
%  adjustment for the 12Y, 15Y and  20Y points

factor1 = 0.10;
factor2 = 0.40;

%Rates(11) = Rates(10)./2 + Rates(12)./2;

spread_35y = (Rates(12) - Rates(11))*factor1;
spread_40y = (Rates(12) - Rates(11))*factor2;

Rates(13) = Rates(12) + spread_35y;
Rates(14) = Rates(12) + spread_40y;
%Rates(15) = Rates(14) + spread_40y;
%Rates(16) = Rates(15) + spread_40y;

ParRates = Rates;
CurveDates = datenum(EndDates);
Settle = ddate;
Compouding = 2;
Basis = 1;
OutputCompounding = 4;
[ZeroRates, CurveDates] = pyld2zero(ParRates,CurveDates,Settle, Compounding, Basis, OutputCompounding);



RateSpec = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', ZeroRates);

mat_step = [1;2;3;4;5;6;7;8;9;10;15;20;25;30];
for i = 1:1:14  
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
fmatu12 = [ddmm num2str(fyyyy+12)];
fmatu15 = [ddmm num2str(fyyyy+15)];
fmatu20 = [ddmm num2str(fyyyy+20)];
fmatu25 = [ddmm num2str(fyyyy+25)];
fmatu30 = [ddmm num2str(fyyyy+30)];
Maturity = [fmatu1;fmatu2;fmatu3;fmatu4;fmatu5;fmatu7;fmatu10;fmatu12;fmatu15;fmatu20;fmatu25;fmatu30];
Basis = 2; 
Principal = 100;
LegType = [1 0]; % [Fixed Float] 
LegReset = [4 4]; % Payments frequency per year 
LegRate = [NaN 0]; 

[size_maturity,dummy] = size(Maturity);

[Price, SwapRate] = swapbyzero(RateSpec, LegRate,...
                  Settle, Maturity, LegReset, Basis, Principal,LegType);
SwapRate = SwapRate'.*100;
fwd_bma(i+4,:) = SwapRate;
end;

fwd_bma_diff = fwd_bma(5,:) - r_bma_basis(end,:);
fwd_bma(4,:) = r_bma_basis(end,:) + 9/12.*fwd_bma_diff;
fwd_bma(3,:) = r_bma_basis(end,:) + 6/12.*fwd_bma_diff;
fwd_bma(2,:) = r_bma_basis(end,:) + 3/12.*fwd_bma_diff;
fwd_bma(1,:) = r_bma_basis(end,:) + 1/12.*fwd_bma_diff;

%% for LIBOR
Rates  = r_libor(end,:)'./100;

%factor1 = 0;
%factor2 = 0;
%spread_35y = (Rates(12) - Rates(11))*factor1;
%spread_40y = (Rates(12) - Rates(11))*factor2;
matu35 = [ddmm num2str(yyyy+32)];
matu40 = [ddmm num2str(yyyy+40)];
matu50 = [ddmm num2str(yyyy+50)];
%matu60 = [ddmm num2str(yyyy+60)];
%EndDatesL = [matu1;matu2;matu3;matu4;matu5;matu7;matu10;matu12;matu15;matu20;matu25;matu30;matu35;matu40;];
EndDatesL = [matu1;matu2;matu3;matu4;matu5;matu7;matu10;matu12;matu15;matu20;matu25;matu30;matu35;matu40;matu50;];

spread_40y = 0.60./10000;
spread_35y = spread_40y./2;

Rates(12) = Rates(12) ;%+ 5./10000;  % 30y point
Rates(13) = Rates(12) + spread_35y;  % 32y point
Rates(14) = Rates(12) + spread_40y;  % 40y point
Rates(15) = Rates(14) + spread_40y;  % 50y point
%Rates(14) = Rates(12) - 5.5./10000;
%Rates(15) = Rates(12) -6.8./10000 ;%+ spread_40y;
%Rates(16) = Rates(15) -6.8/10000;%+ spread_40y;

ParRates = Rates;
CurveDates = datenum(EndDatesL);
Settle = ddate;
Compouding = 2;
Basis = 1;
OutputCompounding = 2;

[ZeroRates, CurveDates] = pyld2zero(ParRates,CurveDates,Settle, Compounding, Basis, OutputCompounding);



RateSpec = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDatesL,'Rates', ZeroRates);

mat_step = [1;2;3;4;5;6;7;8;9;10;15;20;25;30];

for i = 1:1:14  
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
fmatu12 = [ddmm num2str(fyyyy+12)];
fmatu15 = [ddmm num2str(fyyyy+15)];
fmatu20 = [ddmm num2str(fyyyy+20)];
fmatu25 = [ddmm num2str(fyyyy+25)];
fmatu30 = [ddmm num2str(fyyyy+30)];
Maturity = [fmatu1;fmatu2;fmatu3;fmatu4;fmatu5;fmatu7;fmatu10;fmatu12;fmatu15;fmatu20;fmatu25;fmatu30];
Basis = 1; 
Principal = 100;
LegType = [1 0]; % [Fixed Float] 
%LegReset = [2 4]; % Payments frequency per year 
LegReset = [4 4]; % Payments frequency per year
LegRate = [NaN 0]; 

[size_maturity,dummy] = size(Maturity);

[Price, SwapRate] = swapbyzero(RateSpec, LegRate,...
                  Settle, Maturity, LegReset, Basis, Principal,LegType);
%SwapRate = ((1+SwapRate./2).^0.5 -1).*4;              
SwapRate = SwapRate'.*100;
fwd_libor(i+4,:) = SwapRate;
end;

fwd_libor_diff = fwd_libor(5,:) - r_libor(end,:);
fwd_libor(4,:) = r_libor(end,:) + 9/12.*fwd_libor_diff;
fwd_libor(3,:) = r_libor(end,:) + 6/12.*fwd_libor_diff;
fwd_libor(2,:) = r_libor(end,:) + 3/12.*fwd_libor_diff;
fwd_libor(1,:) = r_libor(end,:) + 1/12.*fwd_libor_diff;

fwd_ratio = fwd_bma./fwd_libor;

expiry = [1/12;3/12;6/12;9/12;1;2;3;4;5;6;7;8;9;10;15;20;25;30];
tenor = [1;2;3;4;5;7;10;12;15;20;25;30];

[X,Y] = meshgrid(tenor,expiry);
surf(X,Y,fwd_ratio);
view(65,15);


