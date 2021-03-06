function [r_bma_ratio,r_bma_basis,r_bma,r_libor,libor_vol_matrix,libor_vol_interp,snapshot_time1,snapshot_time2]= get_realtime_data2();
 % [r_bma_ratio,r_bma_basis,r_bma,r_libor,libor_vol_matrix,libor_vol_interp,snapshot_time1,snapshot_time2] = get_realtime_data();

 %ddate = datenum(ddate);
%period_window = 2;

%end_date = datestr(ddate);
%begin_date = datestr(ddate-period_window);

% First establish the data connection to bloomberg;
connection = blp;

c = clock;
snapshot_time1 = datestr(c);

%% Get the USD SWAP MUNI % of LIBOR
USSML1= fetch(connection,'USSML1 PREB Curncy');
USSML2= fetch(connection,'USSML2 PREB Curncy');
USSML3= fetch(connection,'USSML3 PREB Curncy');
USSML4= fetch(connection,'USSML4 PREB Curncy');
USSML5= fetch(connection,'USSML5 PREB Curncy');
USSML7= fetch(connection,'USSML7 PREB Curncy');
USSML10 = fetch(connection,'USSML10 PREB Curncy');
USSML12 = fetch(connection,'USSML12 PREB Curncy');
USSML15 = fetch(connection,'USSML15 PREB Curncy');
USSML20 = fetch(connection,'USSML20 PREB Curncy');
USSML25 = fetch(connection,'USSML25 Curncy');
USSML30 = fetch(connection,'USSML30 PREB Curncy');

%ddate_string = datestr(USSML1(:,1));

r_bma_ratio = [USSML1.LastPrice;USSML2.LastPrice;USSML3.LastPrice;USSML4.LastPrice;USSML5.LastPrice;USSML7.LastPrice;...
               USSML10.LastPrice;USSML12.LastPrice;USSML15.LastPrice;USSML20.LastPrice;USSML25.LastPrice;USSML30.LastPrice;]';
US0003M = fetch(connection,'US0003M Index');
r_bma_basis = r_bma_ratio.*repmat(US0003M.LastPrice,1,12)./100;

%% Get the USD SWAP Quarterly 
USSMQ1= fetch(connection,'USSMQ1 Curncy');
USSMQ2= fetch(connection,'USSMQ2 Curncy');
USSMQ3= fetch(connection,'USSMQ3 Curncy');
USSMQ4= fetch(connection,'USSMQ4 Curncy');
USSMQ5= fetch(connection,'USSMQ5 Curncy');
%USSMQ6= fetch(connection,'USSMQ6 Curncy');
USSMQ7= fetch(connection,'USSMQ7 Curncy');
%USSMQ8= fetch(connection,'USSMQ8 Curncy');
%USSMQ9= fetch(connection,'USSMQ9 Curncy');
USSMQ10 = fetch(connection,'USSMQ10 Curncy');
%USSMQ11 = fetch(connection,'USSMQ11 Curncy');
USSMQ12 = fetch(connection,'USSMQ12 Curncy');
%USSMQ13 = fetch(connection,'USSMQ13 Curncy');
%USSMQ14 = fetch(connection,'USSMQ14 Curncy');
USSMQ15 = fetch(connection,'USSMQ15 Curncy');
%USSMQ17 = fetch(connection,'USSMQ17 Curncy');
USSMQ20 = fetch(connection,'USSMQ20 Curncy');
%USSMQ22 = fetch(connection,'USSMQ22 Curncy');
%USSMQ23 = fetch(connection,'USSMQ23 Curncy');
USSMQ25 = fetch(connection,'USSMQ25 Curncy');
USSMQ30 = fetch(connection,'USSMQ30 Curncy');

r_bma = [USSMQ1.LastPrice;USSMQ2.LastPrice;USSMQ3.LastPrice;USSMQ4.LastPrice;USSMQ5.LastPrice;USSMQ7.LastPrice;...
         USSMQ10.LastPrice;USSMQ12.LastPrice;USSMQ15.LastPrice;USSMQ20.LastPrice;USSMQ25.LastPrice;USSMQ30.LastPrice;]';

%% Get the USD LIBOR 
USSWAP1= fetch(connection,'USSWAP1 Curncy');
USSWAP2= fetch(connection,'USSWAP2 Curncy');
USSWAP3= fetch(connection,'USSWAP3 Curncy');
USSWAP4= fetch(connection,'USSWAP4 Curncy');
USSWAP5= fetch(connection,'USSWAP5 Curncy');
USSWAP6= fetch(connection,'USSWAP6 Curncy');
USSWAP7= fetch(connection,'USSWAP7 Curncy');
USSWAP8= fetch(connection,'USSWAP8 Curncy');
USSWAP9= fetch(connection,'USSWAP9 Curncy');
USSWAP10 = fetch(connection,'USSWAP10 Curncy');
USSWAP12 = fetch(connection,'USSWAP12 Curncy');
USSWAP15 = fetch(connection,'USSWAP15 Curncy');
USSWAP20 = fetch(connection,'USSWAP20 Curncy');
USSWAP25 = fetch(connection,'USSWAP25 Curncy');
USSWAP30 = fetch(connection,'USSWAP30 Curncy');

r_libor = [USSWAP1.LastPrice;USSWAP2.LastPrice;USSWAP3.LastPrice;USSWAP4.LastPrice;USSWAP5.LastPrice;USSWAP7.LastPrice;...
           USSWAP10.LastPrice;USSWAP12.LastPrice;USSWAP15.LastPrice;USSWAP20.LastPrice;USSWAP25.LastPrice;USSWAP30.LastPrice;]';

%% Get the ATM Swaption volatility
% 1M  expiry
USSV0A1= fetch(connection,'USSV0A1 Curncy');
USSV0A2= fetch(connection,'USSV0A2 Curncy');
USSV0A3= fetch(connection,'USSV0A3 Curncy');
USSV0A4= fetch(connection,'USSV0A4 Curncy');
USSV0A5= fetch(connection,'USSV0A5 Curncy');
USSV0A6= fetch(connection,'USSV0A6 Curncy');
USSV0A7= fetch(connection,'USSV0A7 Curncy');
USSV0A8= fetch(connection,'USSV0A8 Curncy');
USSV0A9= fetch(connection,'USSV0A9 Curncy');
USSV0A10 = fetch(connection,'USSV0A10 Curncy');
USSV0A12 = fetch(connection,'USSV0A12 Curncy');
USSV0A15 = fetch(connection,'USSV0A15 Curncy');
USSV0A20 = fetch(connection,'USSV0A20 Curncy');
USSV0A25 = fetch(connection,'USSV0A25 Curncy');
USSV0A30 = fetch(connection,'USSV0A30 Curncy');

libor_vol_01M = [USSV0A1.LastPrice;USSV0A2.LastPrice;USSV0A3.LastPrice;USSV0A4.LastPrice;USSV0A5.LastPrice;USSV0A6.LastPrice;USSV0A7.LastPrice;...
                 USSV0A8.LastPrice;USSV0A9.LastPrice;USSV0A10.LastPrice;USSV0A12.LastPrice;USSV0A15.LastPrice;USSV0A20.LastPrice;USSV0A25.LastPrice;USSV0A30.LastPrice;]';
            
% 3M  expiry
USSV0C1= fetch(connection,'USSV0C1 Curncy');
USSV0C2= fetch(connection,'USSV0C2 Curncy');
USSV0C3= fetch(connection,'USSV0C3 Curncy');
USSV0C4= fetch(connection,'USSV0C4 Curncy');
USSV0C5= fetch(connection,'USSV0C5 Curncy');
USSV0C6= fetch(connection,'USSV0C6 Curncy');
USSV0C7= fetch(connection,'USSV0C7 Curncy');
USSV0C8= fetch(connection,'USSV0C8 Curncy');
USSV0C9= fetch(connection,'USSV0C9 Curncy');
USSV0C10 = fetch(connection,'USSV0C10 Curncy');
USSV0C12 = fetch(connection,'USSV0C12 Curncy');
USSV0C15 = fetch(connection,'USSV0C15 Curncy');
USSV0C20 = fetch(connection,'USSV0C20 Curncy');
USSV0C25 = fetch(connection,'USSV0C25 Curncy');
USSV0C30 = fetch(connection,'USSV0C30 Curncy');

libor_vol_03M = [USSV0C1.LastPrice;USSV0C2.LastPrice;USSV0C3.LastPrice;USSV0C4.LastPrice;USSV0C5.LastPrice;USSV0C6.LastPrice;USSV0C7.LastPrice;...
                 USSV0C8.LastPrice;USSV0C9.LastPrice;USSV0C10.LastPrice;USSV0C12.LastPrice;USSV0C15.LastPrice;USSV0C20.LastPrice;USSV0C25.LastPrice;USSV0C30.LastPrice;]';

% 6M  expiry
USSV0F1= fetch(connection,'USSV0F1 Curncy');
USSV0F2= fetch(connection,'USSV0F2 Curncy');
USSV0F3= fetch(connection,'USSV0F3 Curncy');
USSV0F4= fetch(connection,'USSV0F4 Curncy');
USSV0F5= fetch(connection,'USSV0F5 Curncy');
USSV0F6= fetch(connection,'USSV0F6 Curncy');
USSV0F7= fetch(connection,'USSV0F7 Curncy');
USSV0F8= fetch(connection,'USSV0F8 Curncy');
USSV0F9= fetch(connection,'USSV0F9 Curncy');
USSV0F10 = fetch(connection,'USSV0F10 Curncy');
USSV0F12 = fetch(connection,'USSV0F12 Curncy');
USSV0F15 = fetch(connection,'USSV0F15 Curncy');
USSV0F20 = fetch(connection,'USSV0F20 Curncy');
USSV0F25 = fetch(connection,'USSV0F25 Curncy');
USSV0F30 = fetch(connection,'USSV0F30 Curncy');

libor_vol_06M = [USSV0F1.LastPrice;USSV0F2.LastPrice;USSV0F3.LastPrice;USSV0F4.LastPrice;USSV0F5.LastPrice;USSV0F6.LastPrice;USSV0F7.LastPrice;...
                 USSV0F8.LastPrice;USSV0F9.LastPrice;USSV0F10.LastPrice;USSV0F12.LastPrice;USSV0F15.LastPrice;USSV0F20.LastPrice;USSV0F25.LastPrice;USSV0F30.LastPrice;]';

% 9M  expiry
USSV0I1= fetch(connection,'USSV0I1 Curncy');
USSV0I2= fetch(connection,'USSV0I2 Curncy');
USSV0I3= fetch(connection,'USSV0I3 Curncy');
USSV0I4= fetch(connection,'USSV0I4 Curncy');
USSV0I5= fetch(connection,'USSV0I5 Curncy');
USSV0I6= fetch(connection,'USSV0I6 Curncy');
USSV0I7= fetch(connection,'USSV0I7 Curncy');
USSV0I8= fetch(connection,'USSV0I8 Curncy');
USSV0I9= fetch(connection,'USSV0I9 Curncy');
USSV0I10 = fetch(connection,'USSV0I10 Curncy');
%USSV0I12 = fetch(connection,'USSV0I12 Curncy');
USSV0I15 = fetch(connection,'USSV0I15 Curncy');
USSV0I20 = fetch(connection,'USSV0I20 Curncy');
USSV0I25 = fetch(connection,'USSV0I25 Curncy');
USSV0I30 = fetch(connection,'USSV0I30 Curncy');

libor_vol_09M = [USSV0I1.LastPrice;USSV0I2.LastPrice;USSV0I3.LastPrice;USSV0I4.LastPrice;USSV0I5.LastPrice;USSV0I6.LastPrice;USSV0I7.LastPrice;...
                 USSV0I8.LastPrice;USSV0I9.LastPrice;USSV0I10.LastPrice;NaN;USSV0I15.LastPrice;USSV0I20.LastPrice;USSV0I25.LastPrice;USSV0I30.LastPrice;]';


% 1Y  expiry
USSV011= fetch(connection,'USSV011 Curncy');
USSV012= fetch(connection,'USSV012 Curncy');
USSV013= fetch(connection,'USSV013 Curncy');
USSV014= fetch(connection,'USSV014 Curncy');
USSV015= fetch(connection,'USSV015 Curncy');
USSV016= fetch(connection,'USSV016 Curncy');
USSV017= fetch(connection,'USSV017 Curncy');
USSV018= fetch(connection,'USSV018 Curncy');
USSV019= fetch(connection,'USSV019 Curncy');
USSV0110 = fetch(connection,'USSV0110 Curncy');
USSV0112 = fetch(connection,'USSV0112 Curncy');
USSV0115 = fetch(connection,'USSV0115 Curncy');
USSV0120 = fetch(connection,'USSV0120 Curncy');
USSV0125 = fetch(connection,'USSV0125 Curncy');
USSV0130 = fetch(connection,'USSV0130 Curncy');

libor_vol_01Y = [USSV011.LastPrice;USSV012.LastPrice;USSV013.LastPrice;USSV014.LastPrice;USSV015.LastPrice;USSV016.LastPrice;USSV017.LastPrice;...
                 USSV018.LastPrice;USSV019.LastPrice;USSV0110.LastPrice;USSV0112.LastPrice;USSV0115.LastPrice;USSV0120.LastPrice;USSV0125.LastPrice;USSV0130.LastPrice;]';
             
% 2Y  expiry
USSV021= fetch(connection,'USSV021 Curncy');
USSV022= fetch(connection,'USSV022 Curncy');
USSV023= fetch(connection,'USSV023 Curncy');
USSV024= fetch(connection,'USSV024 Curncy');
USSV025= fetch(connection,'USSV025 Curncy');
USSV026= fetch(connection,'USSV026 Curncy');
USSV027= fetch(connection,'USSV027 Curncy');
USSV028= fetch(connection,'USSV028 Curncy');
USSV029= fetch(connection,'USSV029 Curncy');
USSV0210 = fetch(connection,'USSV0210 Curncy');
USSV0212 = fetch(connection,'USSV0212 Curncy');
USSV0215 = fetch(connection,'USSV0215 Curncy');
USSV0220 = fetch(connection,'USSV0220 Curncy');
USSV0225 = fetch(connection,'USSV0225 Curncy');
USSV0230 = fetch(connection,'USSV0230 Curncy');

libor_vol_02Y = [USSV021.LastPrice;USSV022.LastPrice;USSV023.LastPrice;USSV024.LastPrice;USSV025.LastPrice;USSV026.LastPrice;USSV027.LastPrice;...
                 USSV028.LastPrice;USSV029.LastPrice;USSV0210.LastPrice;USSV0212.LastPrice;USSV0215.LastPrice;USSV0220.LastPrice;USSV0225.LastPrice;USSV0230.LastPrice;]';

% 3Y  expiry
USSV031= fetch(connection,'USSV031 Curncy');
USSV032= fetch(connection,'USSV032 Curncy');
USSV033= fetch(connection,'USSV033 Curncy');
USSV034= fetch(connection,'USSV034 Curncy');
USSV035= fetch(connection,'USSV035 Curncy');
USSV036= fetch(connection,'USSV036 Curncy');
USSV037= fetch(connection,'USSV037 Curncy');
USSV038= fetch(connection,'USSV038 Curncy');
USSV039= fetch(connection,'USSV039 Curncy');
USSV0310 = fetch(connection,'USSV0310 Curncy');
USSV0312 = fetch(connection,'USSV0312 Curncy');
USSV0315 = fetch(connection,'USSV0315 Curncy');
USSV0320 = fetch(connection,'USSV0320 Curncy');
USSV0325 = fetch(connection,'USSV0325 Curncy');
USSV0330 = fetch(connection,'USSV0330 Curncy');

libor_vol_03Y = [USSV031.LastPrice;USSV032.LastPrice;USSV033.LastPrice;USSV034.LastPrice;USSV035.LastPrice;USSV036.LastPrice;USSV037.LastPrice;...
                 USSV038.LastPrice;USSV039.LastPrice;USSV0310.LastPrice;USSV0312.LastPrice;USSV0315.LastPrice;USSV0320.LastPrice;USSV0325.LastPrice;USSV0330.LastPrice;]';

% 4Y  expiry
USSV041= fetch(connection,'USSV041 Curncy');
USSV042= fetch(connection,'USSV042 Curncy');
USSV043= fetch(connection,'USSV043 Curncy');
USSV044= fetch(connection,'USSV044 Curncy');
USSV045= fetch(connection,'USSV045 Curncy');
USSV046= fetch(connection,'USSV046 Curncy');
USSV047= fetch(connection,'USSV047 Curncy');
USSV048= fetch(connection,'USSV048 Curncy');
USSV049= fetch(connection,'USSV049 Curncy');
USSV0410 = fetch(connection,'USSV0410 Curncy');
USSV0412 = fetch(connection,'USSV0412 Curncy');
USSV0415 = fetch(connection,'USSV0415 Curncy');
USSV0420 = fetch(connection,'USSV0420 Curncy');
USSV0425 = fetch(connection,'USSV0425 Curncy');
USSV0430 = fetch(connection,'USSV0430 Curncy');

libor_vol_04Y = [USSV041.LastPrice;USSV042.LastPrice;USSV043.LastPrice;USSV044.LastPrice;USSV045.LastPrice;USSV046.LastPrice;USSV047.LastPrice;...
                 USSV048.LastPrice;USSV049.LastPrice;USSV0410.LastPrice;USSV0412.LastPrice;USSV0415.LastPrice;USSV0420.LastPrice;USSV0425.LastPrice;USSV0430.LastPrice;]';

% 5Y  expiry
USSV051= fetch(connection,'USSV051 Curncy');
USSV052= fetch(connection,'USSV052 Curncy');
USSV053= fetch(connection,'USSV053 Curncy');
USSV054= fetch(connection,'USSV054 Curncy');
USSV055= fetch(connection,'USSV055 Curncy');
USSV056= fetch(connection,'USSV056 Curncy');
USSV057= fetch(connection,'USSV057 Curncy');
USSV058= fetch(connection,'USSV058 Curncy');
USSV059= fetch(connection,'USSV059 Curncy');
USSV0510 = fetch(connection,'USSV0510 Curncy');
USSV0512 = fetch(connection,'USSV0512 Curncy');
USSV0515 = fetch(connection,'USSV0515 Curncy');
USSV0520 = fetch(connection,'USSV0520 Curncy');
USSV0525 = fetch(connection,'USSV0525 Curncy');
USSV0530 = fetch(connection,'USSV0530 Curncy');

libor_vol_05Y = [USSV051.LastPrice;USSV052.LastPrice;USSV053.LastPrice;USSV054.LastPrice;USSV055.LastPrice;USSV056.LastPrice;USSV057.LastPrice;...
                 USSV058.LastPrice;USSV059.LastPrice;USSV0510.LastPrice;USSV0512.LastPrice;USSV0515.LastPrice;USSV0520.LastPrice;USSV0525.LastPrice;USSV0530.LastPrice;]';


% 6Y  expiry
USSV061= fetch(connection,'USSV061 Curncy');
USSV062= fetch(connection,'USSV062 Curncy');
USSV063= fetch(connection,'USSV063 Curncy');
USSV064= fetch(connection,'USSV064 Curncy');
USSV065= fetch(connection,'USSV065 Curncy');
USSV066= fetch(connection,'USSV066 Curncy');
USSV067= fetch(connection,'USSV067 Curncy');
USSV068= fetch(connection,'USSV068 Curncy');
USSV069= fetch(connection,'USSV069 Curncy');
USSV0610 = fetch(connection,'USSV0610 Curncy');
%USSV0612 = fetch(connection,'USSV0612 Curncy');
USSV0615 = fetch(connection,'USSV0615 Curncy');
USSV0620 = fetch(connection,'USSV0620 Curncy');
USSV0625 = fetch(connection,'USSV0625 Curncy');
USSV0630 = fetch(connection,'USSV0630 Curncy');

libor_vol_06Y = [USSV061.LastPrice;USSV062.LastPrice;USSV063.LastPrice;USSV064.LastPrice;USSV065.LastPrice;USSV066.LastPrice;USSV067.LastPrice;...
                 USSV068.LastPrice;USSV069.LastPrice;USSV0610.LastPrice;NaN;USSV0615.LastPrice;USSV0620.LastPrice;USSV0625.LastPrice;USSV0630.LastPrice;]';

% 7Y  expiry
USSV071= fetch(connection,'USSV071 Curncy');
USSV072= fetch(connection,'USSV072 Curncy');
USSV073= fetch(connection,'USSV073 Curncy');
USSV074= fetch(connection,'USSV074 Curncy');
USSV075= fetch(connection,'USSV075 Curncy');
USSV076= fetch(connection,'USSV076 Curncy');
USSV077= fetch(connection,'USSV077 Curncy');
USSV078= fetch(connection,'USSV078 Curncy');
USSV079= fetch(connection,'USSV079 Curncy');
USSV0710 = fetch(connection,'USSV0710 Curncy');
USSV0712 = fetch(connection,'USSV0712 Curncy');
USSV0715 = fetch(connection,'USSV0715 Curncy');
USSV0720 = fetch(connection,'USSV0720 Curncy');
USSV0725 = fetch(connection,'USSV0725 Curncy');
USSV0730 = fetch(connection,'USSV0730 Curncy');

libor_vol_07Y = [USSV071.LastPrice;USSV072.LastPrice;USSV073.LastPrice;USSV074.LastPrice;USSV075.LastPrice;USSV076.LastPrice;USSV077.LastPrice;...
                 USSV078.LastPrice;USSV079.LastPrice;USSV0710.LastPrice;USSV0712.LastPrice;USSV0715.LastPrice;USSV0720.LastPrice;USSV0725.LastPrice;USSV0730.LastPrice;]';

% 8Y  expiry
USSV081= fetch(connection,'USSV081 Curncy');
USSV082= fetch(connection,'USSV082 Curncy');
USSV083= fetch(connection,'USSV083 Curncy');
USSV084= fetch(connection,'USSV084 Curncy');
USSV085= fetch(connection,'USSV085 Curncy');
USSV086= fetch(connection,'USSV086 Curncy');
USSV087= fetch(connection,'USSV087 Curncy');
USSV088= fetch(connection,'USSV088 Curncy');
USSV089= fetch(connection,'USSV089 Curncy');
USSV0810 = fetch(connection,'USSV0810 Curncy');
%USSV0812 = fetch(connection,'USSV0812 Curncy');
USSV0815 = fetch(connection,'USSV0815 Curncy');
USSV0820 = fetch(connection,'USSV0820 Curncy');
USSV0825 = fetch(connection,'USSV0825 Curncy');
USSV0830 = fetch(connection,'USSV0830 Curncy');

libor_vol_08Y = [USSV081.LastPrice;USSV082.LastPrice;USSV083.LastPrice;USSV084.LastPrice;USSV085.LastPrice;USSV086.LastPrice;USSV087.LastPrice;...
                 USSV088.LastPrice;USSV089.LastPrice;USSV0810.LastPrice;NaN;USSV0815.LastPrice;USSV0820.LastPrice;USSV0825.LastPrice;USSV0830.LastPrice;]';


% 9Y  expiry
USSV091= fetch(connection,'USSV091 Curncy');
USSV092= fetch(connection,'USSV092 Curncy');
USSV093= fetch(connection,'USSV093 Curncy');
USSV094= fetch(connection,'USSV094 Curncy');
USSV095= fetch(connection,'USSV095 Curncy');
USSV096= fetch(connection,'USSV096 Curncy');
USSV097= fetch(connection,'USSV097 Curncy');
USSV098= fetch(connection,'USSV098 Curncy');
USSV099= fetch(connection,'USSV099 Curncy');
USSV0910 = fetch(connection,'USSV0910 Curncy');
%USSV0912 = fetch(connection,'USSV0912 Curncy');
USSV0915 = fetch(connection,'USSV0915 Curncy');
USSV0920 = fetch(connection,'USSV0920 Curncy');
USSV0925 = fetch(connection,'USSV0925 Curncy');
USSV0930 = fetch(connection,'USSV0930 Curncy');

libor_vol_09Y = [USSV091.LastPrice;USSV092.LastPrice;USSV093.LastPrice;USSV094.LastPrice;USSV095.LastPrice;USSV096.LastPrice;USSV097.LastPrice;...
                 USSV098.LastPrice;USSV099.LastPrice;USSV0910.LastPrice;NaN;USSV0915.LastPrice;USSV0920.LastPrice;USSV0925.LastPrice;USSV0930.LastPrice;]';


% 10Y  expiry
USSV101= fetch(connection,'USSV101 Curncy');
USSV102= fetch(connection,'USSV102 Curncy');
USSV103= fetch(connection,'USSV103 Curncy');
USSV104= fetch(connection,'USSV104 Curncy');
USSV105= fetch(connection,'USSV105 Curncy');
USSV106= fetch(connection,'USSV106 Curncy');
USSV107= fetch(connection,'USSV107 Curncy');
USSV108= fetch(connection,'USSV108 Curncy');
USSV109= fetch(connection,'USSV109 Curncy');
USSV1010 = fetch(connection,'USSV1010 Curncy');
USSV1012 = fetch(connection,'USSV1012 Curncy');
USSV1015 = fetch(connection,'USSV1015 Curncy');
USSV1020 = fetch(connection,'USSV1020 Curncy');
USSV1025 = fetch(connection,'USSV1025 Curncy');
USSV1030 = fetch(connection,'USSV1030 Curncy');

libor_vol_10Y = [USSV101.LastPrice;USSV102.LastPrice;USSV103.LastPrice;USSV104.LastPrice;USSV105.LastPrice;USSV106.LastPrice;USSV107.LastPrice;...
                 USSV108.LastPrice;USSV109.LastPrice;USSV1010.LastPrice;USSV1012.LastPrice;USSV1015.LastPrice;USSV1020.LastPrice;USSV1025.LastPrice;USSV1030.LastPrice;]';

% 15Y  expiry
USSV151= fetch(connection,'USSV151 Curncy');
USSV152= fetch(connection,'USSV152 Curncy');
USSV153= fetch(connection,'USSV153 Curncy');
USSV154= fetch(connection,'USSV154 Curncy');
USSV155= fetch(connection,'USSV155 Curncy');
USSV156= fetch(connection,'USSV156 Curncy');
USSV157= fetch(connection,'USSV157 Curncy');
USSV158= fetch(connection,'USSV158 Curncy');
USSV159= fetch(connection,'USSV159 Curncy');
USSV1510 = fetch(connection,'USSV1510 Curncy');
%USSV1512 = fetch(connection,'USSV1512 Curncy');
USSV1515 = fetch(connection,'USSV1515 Curncy');
USSV1520 = fetch(connection,'USSV1520 Curncy');
USSV1525 = fetch(connection,'USSV1525 Curncy');
USSV1530 = fetch(connection,'USSV1530 Curncy');

libor_vol_15Y = [USSV151.LastPrice;USSV152.LastPrice;USSV153.LastPrice;USSV154.LastPrice;USSV155.LastPrice;USSV156.LastPrice;USSV157.LastPrice;...
                 USSV158.LastPrice;USSV159.LastPrice;USSV1510.LastPrice;NaN;USSV1515.LastPrice;USSV1520.LastPrice;USSV1525.LastPrice;USSV1530.LastPrice;]';


% 20Y  expiry
USSV201= fetch(connection,'USSV201 Curncy');
USSV202= fetch(connection,'USSV202 Curncy');
USSV203= fetch(connection,'USSV203 Curncy');
USSV204= fetch(connection,'USSV204 Curncy');
USSV205= fetch(connection,'USSV205 Curncy');
USSV206= fetch(connection,'USSV206 Curncy');
USSV207= fetch(connection,'USSV207 Curncy');
USSV208= fetch(connection,'USSV208 Curncy');
USSV209= fetch(connection,'USSV209 Curncy');
USSV2010 = fetch(connection,'USSV2010 Curncy');
%USSV2012 = fetch(connection,'USSV2012 Curncy');
USSV2015 = fetch(connection,'USSV2015 Curncy');
USSV2020 = fetch(connection,'USSV2020 Curncy');
USSV2025 = fetch(connection,'USSV2025 Curncy');
USSV2030 = fetch(connection,'USSV2030 Curncy');

libor_vol_20Y = [USSV201.LastPrice;USSV202.LastPrice;USSV203.LastPrice;USSV204.LastPrice;USSV205.LastPrice;USSV206.LastPrice;USSV207.LastPrice;...
                 USSV208.LastPrice;USSV209.LastPrice;USSV2010.LastPrice;NaN;USSV2015.LastPrice;USSV2020.LastPrice;USSV2025.LastPrice;USSV2030.LastPrice;]';

% 25Y  expiry
USSV251= fetch(connection,'USSV251 Curncy');
USSV252= fetch(connection,'USSV252 Curncy');
USSV253= fetch(connection,'USSV253 Curncy');
USSV254= fetch(connection,'USSV254 Curncy');
USSV255= fetch(connection,'USSV255 Curncy');
USSV256= fetch(connection,'USSV256 Curncy');
USSV257= fetch(connection,'USSV257 Curncy');
USSV258= fetch(connection,'USSV258 Curncy');
USSV259= fetch(connection,'USSV259 Curncy');
USSV2510 = fetch(connection,'USSV2510 Curncy');
%USSV2512 = fetch(connection,'USSV2512 Curncy');
USSV2515 = fetch(connection,'USSV2515 Curncy');
USSV2520 = fetch(connection,'USSV2520 Curncy');
USSV2525 = fetch(connection,'USSV2525 Curncy');
USSV2530 = fetch(connection,'USSV2530 Curncy');

libor_vol_25Y = [USSV251.LastPrice;USSV252.LastPrice;USSV253.LastPrice;USSV254.LastPrice;USSV255.LastPrice;USSV256.LastPrice;USSV257.LastPrice;...
                 USSV258.LastPrice;USSV259.LastPrice;USSV2510.LastPrice;NaN;USSV2515.LastPrice;USSV2520.LastPrice;USSV2525.LastPrice;USSV2530.LastPrice;]';

% 30Y  expiry
USSV301= fetch(connection,'USSV301 Curncy');
USSV302= fetch(connection,'USSV302 Curncy');
USSV303= fetch(connection,'USSV303 Curncy');
USSV304= fetch(connection,'USSV304 Curncy');
USSV305= fetch(connection,'USSV305 Curncy');
USSV306= fetch(connection,'USSV306 Curncy');
USSV307= fetch(connection,'USSV307 Curncy');
USSV308= fetch(connection,'USSV308 Curncy');
USSV309= fetch(connection,'USSV309 Curncy');
USSV3010 = fetch(connection,'USSV3010 Curncy');
%USSV3012 = fetch(connection,'USSV3012 Curncy');
USSV3015 = fetch(connection,'USSV3015 Curncy');
USSV3020 = fetch(connection,'USSV3020 Curncy');
USSV3025 = fetch(connection,'USSV3025 Curncy');
USSV3030 = fetch(connection,'USSV3030 Curncy');

c = clock;
snapshot_time2 = datestr(c);

libor_vol_30Y = [USSV301.LastPrice;USSV302.LastPrice;USSV303.LastPrice;USSV304.LastPrice;USSV305.LastPrice;USSV306.LastPrice;USSV307.LastPrice;...
                 USSV308.LastPrice;USSV309.LastPrice;USSV3010.LastPrice;NaN;USSV3015.LastPrice;USSV3020.LastPrice;USSV3025.LastPrice;USSV3030.LastPrice;]';
             
expiry = [1/12;2/12;3/12;6/12;9/12;1;2;3;4;5;6;7;8;9;10;15;20;25;30];
tenor = [1;2;3;4;5;6;7;8;9;10;12;15;20;25;30];
[expiry_size,dummy] = size(expiry);
[tenor_size,dummy] = size(tenor);
[nobs,dummy] = size(libor_vol_30Y);

libor_vol = zeros(nobs,expiry_size,tenor_size);

libor_vol(:,1,:) = libor_vol_01M;
libor_vol(:,2,:) = NaN;
libor_vol(:,3,:) = libor_vol_03M;
libor_vol(:,4,:) = libor_vol_06M;
libor_vol(:,5,:) = libor_vol_09M;
libor_vol(:,6,:) = libor_vol_01Y;
libor_vol(:,7,:) = libor_vol_02Y;
libor_vol(:,8,:) = libor_vol_03Y;
libor_vol(:,9,:) = libor_vol_04Y;
libor_vol(:,10,:) = libor_vol_05Y;
libor_vol(:,11,:) = libor_vol_06Y;
libor_vol(:,12,:) = libor_vol_07Y;
libor_vol(:,13,:) = libor_vol_08Y;
libor_vol(:,14,:) = libor_vol_09Y;
libor_vol(:,15,:) = libor_vol_10Y;
libor_vol(:,16,:) = libor_vol_15Y;
libor_vol(:,17,:) = libor_vol_20Y;
libor_vol(:,18,:) = libor_vol_25Y;
libor_vol(:,19,:) = libor_vol_30Y;

% 2M expiry returns NaN
libor_vol(:,2,:) = [];
expiry(2) = [];

libor_vol_matrix = zeros(expiry_size-1,tenor_size);
for j=1:1:expiry_size-1
     for k =1:1:tenor_size
         libor_vol_matrix(j,k) = libor_vol(nobs,j,k);
     end;
end;

index_zero = find(libor_vol_matrix == 0);
libor_vol_matrix(index_zero) = NaN;


%subplot(2,2,1);
[X,Y] = meshgrid(expiry,tenor);
%surf(X,Y,libor_vol_matrix');
%view(65,15);

libor_vol_interp = interp2(X,Y,libor_vol_matrix',X,Y);
 close(connection);
 
 save work.mat









