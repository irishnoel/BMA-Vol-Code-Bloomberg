%% Initial Setup Step I - Load the time information 
% The the raw data used in this script are taken from bloomberg datafeed
yyyy = str2num(ddate(8:11));
ddmm = ddate(1:7);
matu1 = [ddmm num2str(yyyy+1)];
matu2 = [ddmm num2str(yyyy+2)];
matu3 = [ddmm num2str(yyyy+3)];
matu4 = [ddmm num2str(yyyy+4)];
matu5 = [ddmm num2str(yyyy+5)];
matu7 = [ddmm num2str(yyyy+7)];
matu10 = [ddmm num2str(yyyy+10)];
matu11 = [ddmm num2str(yyyy+11)];
matu12 = [ddmm num2str(yyyy+12)];
matu13 = [ddmm num2str(yyyy+13)];
matu14 = [ddmm num2str(yyyy+14)];
matu15 = [ddmm num2str(yyyy+15)];
matu16 = [ddmm num2str(yyyy+16)];
matu17 = [ddmm num2str(yyyy+17)];
matu18 = [ddmm num2str(yyyy+18)];
matu19 = [ddmm num2str(yyyy+19)];
matu20 = [ddmm num2str(yyyy+20)];
matu21 = [ddmm num2str(yyyy+21)];
matu22 = [ddmm num2str(yyyy+22)];
matu23 = [ddmm num2str(yyyy+23)];
matu24 = [ddmm num2str(yyyy+24)];
matu25 = [ddmm num2str(yyyy+25)];
matu26 = [ddmm num2str(yyyy+26)];
matu27 = [ddmm num2str(yyyy+27)];
matu28 = [ddmm num2str(yyyy+28)];
matu29 = [ddmm num2str(yyyy+29)];
matu30 = [ddmm num2str(yyyy+30)];

Compounding = 2;
ValuationDate = ddate;
StartDate = ValuationDate;
EndDates = [matu1;matu2;matu3;matu4;matu5;matu7;matu10;matu12;matu15;matu20;matu25;matu30];

% End of the initial setup - Step I 

%% Initial Setup Step II - Load the BMA swap curve information and build up the BDT tree using the BMA vol 
%% for BMA

% the one we got is the par yield curve
Rates_bma  = r_bma(end,:)'./100;
ParRates = Rates_bma;
CurveDates = datenum(EndDates);
Settle = ddate;
Compouding = 2;
Basis = 2;
OutputCompounding = 2;
[ZeroRates_bma, CurveDates] = pyld2zero(ParRates,CurveDates,Settle, Compounding, Basis, OutputCompounding);
RateSpec_bma = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', ZeroRates_bma);

% to get the BDT pricing tree set up                 
Volatility = bma_vol_matrix(14,:)'./100;   % it is to assign the 10Y forward BMA vol to the BDT tree
VolSpec = bdtvolspec(ValuationDate, EndDates, Volatility);
TimeSpec = bdttimespec(ValuationDate, EndDates, Compounding);
BDTTree_bma = bdttree(VolSpec, RateSpec_bma, TimeSpec); 

% End of Initial Setup Step II - BMA rates loaded and pricing tree
                 
%% Initial Setup Step III - Load the LIBOR curve information and build up the BDT tree using the BMA vol 
% for LIBOR
Rates_libor  = r_libor(end,:)'./100;
ParRates = Rates_libor;
CurveDates = datenum(EndDates);
Settle = ddate;
Compouding = 4;
Basis = 2;
OutputCompounding = 2;
[ZeroRates_libor, CurveDates] = pyld2zero(ParRates,CurveDates,Settle, Compounding, Basis, OutputCompounding);
RateSpec_libor = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', ZeroRates_libor);
              
Volatility = bma_vol_matrix(14,:)'./100;   % it is to assign the 10Y forward BMA vol to the BDT tree
VolSpec = bdtvolspec(ValuationDate, EndDates, Volatility);
TimeSpec = bdttimespec(ValuationDate, EndDates, Compounding);
BDTTree_libor = bdttree(VolSpec, RateSpec_libor, TimeSpec); 
%HJMTree_libor = hjmtree(HJMVolSpec, RateSpec_libor, HJMTimeSpec);

% End of Initial Setup Step III - LIBOR rates loaded and pricing tree
% initialized

%% Pricing Step I - price 1) 20Y bullet bond  2) 20Y bond with call option starting from 10th year - call at par
%  discounted by either BMA curve or a LIBOR curve
CouponRate = 0.03;
Settle = ddate;
Maturity = matu30;

Price_bma = bondbyzero(RateSpec_bma, CouponRate, Settle, Maturity);
Price_bma_bdt = bondbybdt(BDTTree_bma, CouponRate, Settle, Maturity)

ExeriseDates = [matu10;matu11;matu12;matu13;matu14;matu15;matu16;matu17;matu18;matu19;matu20;matu21;...
               matu22;matu23;matu24;matu25;matu26;matu27;matu28;matu29;];
            
%ExeriseDates = [matu10;matu11;matu12;matu13;matu14;matu15;matu16;matu17;matu18;matu19;];
            
Price_bma_call = optbndbybdt(BDTTree_bma,'Call',100,ExeriseDates,... 
'0',CouponRate,Settle,Maturity,'1');
Price_bma_all = Price_bma - sum(Price_bma_call);

Price_libor = bondbyzero(RateSpec_libor, CouponRate, Settle, Maturity);
Price_libor_bdt = bondbybdt(BDTTree_libor, CouponRate, Settle, Maturity);
Price_libor_call = optbndbybdt(BDTTree_libor,'Call',100,ExeriseDates,... 
'0',CouponRate,Settle,Maturity,'1');
Price_libor_all = Price_libor - sum(Price_libor_call);

% End of pricing a bullet bond using either BMA or LIBOR as discounting
% curve. Also the Bermu call option

%%  Pricing Step II - get the BMA sensitivity
% sensitivity measured by durations 
Duration_bma = zeros(12,1);
Duration_bma_bdt = zeros(12,1);
Duration_bma_all = zeros(12,1);
for i=1:1:12
    dy = 1/200;
    Rates_bma_up = ZeroRates_bma;
    Rates_bma_down = ZeroRates_bma;
    
    Rates_bma_up(i) = Rates_bma_up(i)+dy;
    Rates_bma_down(i) = Rates_bma_down(i)-dy; 
    
    RateSpec_bma_up = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates_bma_up);
                 
    RateSpec_bma_down = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates_bma_down);
                 
    BDTTree_bma_up = bdttree(VolSpec, RateSpec_bma_up, TimeSpec); 
    BDTTree_bma_down = bdttree(VolSpec, RateSpec_bma_down, TimeSpec); 
                 
    Price_bma_up = bondbyzero(RateSpec_bma_up, CouponRate, Settle, Maturity);             
    Price_bma_down = bondbyzero(RateSpec_bma_down, CouponRate, Settle, Maturity);  
    
    Price_bma_up_bdt = bondbybdt(BDTTree_bma_up, CouponRate, Settle, Maturity);             
    Price_bma_down_bdt = bondbybdt(BDTTree_bma_down, CouponRate, Settle, Maturity);  
    
    Price_bma_call_up = optbndbybdt(BDTTree_bma_up,'Call',100,ExeriseDates,... 
                                  '0',CouponRate,Settle,Maturity,'1');
    Price_bma_call_down = optbndbybdt(BDTTree_bma_down,'Call',100,ExeriseDates,... 
                                  '0',CouponRate,Settle,Maturity,'1');
    
    dp  = Price_bma_up -Price_bma_down;
    dp_bdt = Price_bma_up_bdt -Price_bma_down_bdt;
 %  dp_all = (Price_bma_up -sum(Price_bma_call_up)) - (Price_bma_down - sum(Price_bma_call_down));
    dp_all = (Price_bma_up_bdt -sum(Price_bma_call_up)) - (Price_bma_down_bdt - sum(Price_bma_call_down));

    Duration_bma(i) = -dp./(2*dy*Price_bma);
    Duration_bma_bdt(i) = -dp_bdt./(2*dy*Price_bma_bdt);
    Duration_bma_all(i) = -dp_all./(2*dy*Price_bma_all);
end;

D_bma = sum(Duration_bma);

%  End of Pricing Step II - Bond discounted by BMA curve

%%  Pricing Step III - get the LIBOR sensitivity - SWAP fixed-coupon side
%%  using LIBOR to discount
Duration_libor = zeros(12,1);
Duration_libor_bdt = zeros(12,1);
Duration_libor_all = zeros(12,1);
for i=1:1:12
    dy = 1/200;
    Rates_libor_up = ZeroRates_libor;
    Rates_libor_down = ZeroRates_libor;
    
    Rates_libor_up(i) = Rates_libor_up(i)+dy;
    Rates_libor_down(i) = Rates_libor_down(i)-dy; 
    
    RateSpec_libor_up = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates_libor_up);
                 
    RateSpec_libor_down = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates_libor_down);
                 
    BDTTree_libor_up = bdttree(VolSpec, RateSpec_libor_up, TimeSpec); 
    BDTTree_libor_down = bdttree(VolSpec, RateSpec_libor_down, TimeSpec); 
                 
    Price_libor_up_bdt = bondbybdt(BDTTree_libor_up, CouponRate, Settle, Maturity);             
    Price_libor_down_bdt = bondbybdt(BDTTree_libor_down, CouponRate, Settle, Maturity);  
    
    Price_libor_call_up = optbndbybdt(BDTTree_libor_up,'Call',100,ExeriseDates,... 
                                  '0',CouponRate,Settle,Maturity,'1');
    Price_libor_call_down = optbndbybdt(BDTTree_libor_down,'Call',100,ExeriseDates,... 
                                  '0',CouponRate,Settle,Maturity,'1');
                 
    Price_libor_up = bondbyzero(RateSpec_libor_up, CouponRate, Settle, Maturity);             
    Price_libor_down = bondbyzero(RateSpec_libor_down, CouponRate, Settle, Maturity);  
    
    dp  = Price_libor_up -Price_libor_down;
    Duration_libor(i) = -dp./(2*dy*Price_libor);
    
    dp_bdt = Price_libor_up_bdt -Price_libor_down_bdt;
    %dp_all = (Price_libor_up -sum(Price_libor_call_up)) - (Price_libor_down - sum(Price_libor_call_down));
    dp_all = (Price_libor_up_bdt -sum(Price_libor_call_up)) - (Price_libor_down_bdt - sum(Price_libor_call_down));
    Duration_libor_bdt(i) = -dp_bdt./(2*dy*Price_libor_bdt);
    Duration_libor_all(i) = -dp_all./(2*dy*Price_libor_all);
end;

D_libor = sum(Duration_libor);
                 

%%  Pricing Step IV get the LIBOR sensitivity floating leg , forward curve
%%  is BMA, discounted by LIBOR
Duration_libor_f = zeros(12,1);
Duration_bma_f = zeros(12,1);
Spread = 0;
for i=1:1:12
    Rates_libor_up = ZeroRates_libor;
    Rates_libor_down = ZeroRates_libor;
    Rates_bma_up = ZeroRates_bma;
    Rates_bma_down = ZeroRates_bma;
    
    Rates_libor_up(i) = Rates_libor_up(i)+dy;
    Rates_libor_down(i) = Rates_libor_down(i)-dy; 
    
    ratio_BMA  = 0.67;
    Rates_bma_up(i) = Rates_bma_up(i)+dy*ratio_BMA;
    Rates_bma_down(i) = Rates_bma_down(i)-dy*ratio_BMA; 
    
    % by just zero curve to price the floater
    RateSpec_libor_up = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates_libor_up);                     
    RateSpec_libor_down = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates_libor_down);
    RateSpec_bma_up = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates_bma_up);                 
    RateSpec_bma_down = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates_bma_down);
    
    % by using the BDT tree to price the floater
    BDTTree_libor_up = bdttree(VolSpec, RateSpec_libor_up, TimeSpec); 
    BDTTree_libor_down = bdttree(VolSpec, RateSpec_libor_down, TimeSpec); 
    BDTTree_bma_up = bdttree(VolSpec, RateSpec_bma_up, TimeSpec); 
    BDTTree_bma_down = bdttree(VolSpec, RateSpec_bma_down, TimeSpec); 
                 
    %need to override the rate using bma
    RateSpec_libor_up.Rates = RateSpec_bma_up.Rates;
    RateSpec_libor_down.Rates = RateSpec_bma_down.Rates;
    
    RateSpec_bma_up.Disc = RateSpec_libor_up.Disc;
    RateSpec_bma_down.Disc = RateSpec_libor_down.Disc;
        
    Price_libor_up = floatbyzero(RateSpec_libor_up, Spread, Settle, Maturity,4,0);             
    Price_libor_down = floatbyzero(RateSpec_libor_down, Spread, Settle, Maturity,4,0);  
    Price_bma_up = floatbyzero(RateSpec_bma_up, Spread, Settle, Maturity,4,0);             
    Price_bma_down = floatbyzero(RateSpec_bma_down, Spread, Settle, Maturity,4,0);  
    
    dp  = Price_libor_up -Price_libor_down;
    p = (Price_libor_up + Price_libor_down)/2;
    Duration_libor_f(i) = -dp./(2*ratio_BMA*dy*p);
    dp  = Price_bma_up -Price_bma_down;
    p = (Price_bma_up + Price_bma_down)/2;
    Duration_bma_f(i) = -dp./(2*ratio_BMA*dy*p);
end;

D_libor_f = sum(Duration_libor_f); 


% to incooperate the call options 

                 
                 
                 
                 
                 
                 
                 
                 
                 
