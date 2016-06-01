function [fwd_bma,fwd_libor,fwd_ratio] = produce_bma_fwd(ddate,r_bma_basis,r_libor);
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

Compounding = 2;
ValuationDate = ddate;
StartDate = ValuationDate;
%EndDates = [ddate;matu1;matu2;matu3;matu4;matu5;matu7;matu10;matu12;matu15;matu20;matu25;matu30];
EndDates = [matu1;matu2;matu3;matu4;matu5;matu7;matu10;matu12;matu15;matu20;matu25;matu30];
%Rates  = [(bma_rates(1)-0.25)./100;bma_rates'./100;];

fwd_bma = zeros(14,12);
fwd_libor = zeros(14,12);
fwd_ratio = zeros(14,12);

%% for BMA
Rates  = r_bma_basis(end,:)'./100;
RateSpec = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates);

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
Basis = 0; 
Principal = 100;
LegType = [1 0]; % [Fixed Float] 
LegReset = [2 2]; % Payments frequency per year 
LegRate = [NaN 0]; 

[size_maturity,dummy] = size(Maturity);

[Price, SwapRate] = swapbyzero(RateSpec, LegRate,...
                  Settle, Maturity, LegReset, Basis, Principal,LegType);
SwapRate = SwapRate'.*100;
fwd_bma(i,:) = SwapRate;
end;

%% for LIBOR
Rates  = r_libor(end,:)'./100;
RateSpec = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates);

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
Basis = 0; 
Principal = 100;
LegType = [1 0]; % [Fixed Float] 
LegReset = [2 2]; % Payments frequency per year 
LegRate = [NaN 0]; 

[size_maturity,dummy] = size(Maturity);

[Price, SwapRate] = swapbyzero(RateSpec, LegRate,...
                  Settle, Maturity, LegReset, Basis, Principal,LegType);
SwapRate = SwapRate'.*100;
fwd_libor(i,:) = SwapRate;
end;

fwd_ratio = fwd_bma./fwd_libor;


