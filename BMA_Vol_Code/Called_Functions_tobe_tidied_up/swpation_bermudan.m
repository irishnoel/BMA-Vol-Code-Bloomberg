ddate = 'Feb-01-2007';
yyyy = str2num(ddate(8:11));
ddmm = ddate(1:7);
matu1 = [ddmm num2str(yyyy+1)];
matu2 = [ddmm num2str(yyyy+2)];
matu3 = [ddmm num2str(yyyy+3)];
matu4 = [ddmm num2str(yyyy+4)];
matu5 = [ddmm num2str(yyyy+5)];
matu6 = [ddmm num2str(yyyy+6)];
matu7 = [ddmm num2str(yyyy+7)];
matu8 = [ddmm num2str(yyyy+8)];
matu9 = [ddmm num2str(yyyy+9)];
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

factor = 2; 
Compounding = 4;
ValuationDate = ddate;
StartDate = ddate;
EndDates = [matu1;matu2;matu3;matu4;matu5;matu7;matu10;matu12;matu15;matu20;matu25;matu30];

%using forward curve 9 year from now
Rates = fwd_bma(3,:)'./100;   
%Rates = (r_bma1(3,:)')./100;
%Rates = r_libor1(1,:)'./100;

Rates_disc = fwd_libor(3,:)'./100; % discount curve by LIBOR
%Rates_disc = (r_libor1(1,:)'+1)./100;

ParRates = Rates;
CurveDates = datenum(EndDates);
Settle = ddate;
Compouding = 4;
Basis = 2;
OutputCompounding = 4;
[ZeroRates, CurveDates] = pyld2zero(ParRates,CurveDates,Settle, Compounding, Basis, OutputCompounding);

RateSpec_bma = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates);

RateSpec_libor = intenvset('Compounding', Compounding,'ValuationDate', ValuationDate,'StartDates', StartDate,...
					 'EndDates', EndDates,'Rates', Rates_disc);

%RateSpec_bma.Disc = RateSpec_libor.Disc;
%RateSpec_bma.Rates = RateSpec_libor.Rates;

%Volatility = r_bma1'.*bma_vol_matrix(3,:)'./10000   ;   % it is to assign the 10Y forward BMA vol to the BDT tree
Volatility = bma_vol_matrix(9,:)'./100 ;   % it is to assign the 10Y forward BMA vol to the BDT tree
 

%BDTTree_bma.RateSpec.Disc = RateSpec_libor.Disc;

Volatility = Volatility./factor;
VolSpec = bdtvolspec(ValuationDate, EndDates, Volatility);
TimeSpec = bdttimespec(ValuationDate, EndDates, Compounding);
BDTTree_bma = bdttree(VolSpec, RateSpec_bma, TimeSpec);

SwapSettlement = 'Feb-01-2013';
SwapMaturity   = 'Feb-01-2023'; 
Spread = 0;
SwapReset = 2; 
Principal = 100;
OptSpec = 'call';
Strike=0.04039244855;
%ExerciseDates = [matu1;matu2;matu3;matu4;matu5;matu6;matu7;matu8;matu9;matu10;matu11;matu12;matu13;matu14;matu15;matu16;matu17;matu18;matu19;];  
ExerciseDates = [matu5;matu10];  

Basis=1;

[Price, PriceTree] = swaptionbybdt(BDTTree_bma, OptSpec, Strike, ExerciseDates,...
                     Spread, SwapSettlement, SwapMaturity, 'SwapReset', SwapReset, ...
                    'Basis', Basis, 'Principal', Principal)

Price






