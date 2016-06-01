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
Rates_bma  = r_bma1(end,:)'./100;
ParRates = Rates_bma;
CurveDates = datenum(EndDates);
Settle = ddate;
Compouding = 2;
Basis = 2;
OutputCompounding =1;
[ZeroRates_bma, CurveDates] = pyld2zero(ParRates,CurveDates,Settle, Compounding, Basis, OutputCompounding);
RateSpec_bma = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', ZeroRates_bma);

% to get the BDT pricing tree set up                 
Volatility = r_bma1'.*bma_vol_matrix(1,:)'./10000 ;   % it is to assign the 10Y forward BMA vol to the BDT tree
VolSpec = bdtvolspec(ValuationDate, EndDates, Volatility);
TimeSpec = bdttimespec(ValuationDate, EndDates, Compounding);
BDTTree_bma = bdttree(VolSpec, RateSpec_bma, TimeSpec); 

% End of Initial Setup Step II - BMA rates loaded and pricing tree

CouponRate = 0.0475 - 14.23/10000 - 22/10000;
Settle = '06-Dec-2004';
Maturity = '15-Jun-2036';
Period = 2;

Price_bond = bondbybdt(BDTTree_bma, CouponRate, Settle, Maturity, Period);

%Price_bond_zero = bondbyzero(RateSpec_bma, CouponRate, Settle,Maturity, Period, Basis)

OptSpec = 'Call';
Strike = 100;
ExerciseDates = ['15-Dec-2014';'15-Dec-2015';'15-Dec-2016';'15-Dec-2017';'15-Dec-2018';'15-Dec-2019';...
                 '15-Dec-2020';'15-Dec-2021';'15-Dec-2022';'15-Dec-2023';'15-Dec-2024';'15-Dec-2025';...
                 '15-Dec-2026';'15-Dec-2027';'15-Dec-2028';'15-Dec-2029';'15-Dec-2030';'15-Dec-2031';...
                 '15-Dec-2032';'15-Dec-2033';'15-Dec-2034';'15-Dec-2035';];
AmericanOpt = 0; % it is a Bermuda

CouponRate =  0.0475 ; 
Basis = 2; % Actual/360;

EndMonthRule = 0;
IssueDate = Settle;

[Price_call, PriceTree] = optbndbybdt(BDTTree_bma, OptSpec,...
Strike,  ExerciseDates, AmericanOpt, CouponRate, Settle,...
Maturity, Period,  Basis) ;

call_price = max(Price_call);

Price_final = Price_bond - call_price





