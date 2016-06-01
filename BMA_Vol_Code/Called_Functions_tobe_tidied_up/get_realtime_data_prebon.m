function [r_bma_ratio,r_bma_basis,r_bma,r_libor,libor_vol_matrix,libor_vol_interp,snapshot_time1,snapshot_time2]= get_realtime_data_prebon(ddate);
 % [r_bma_ratio,r_bma_basis,r_bma,r_libor,libor_vol_matrix,libor_vol_interp,snapshot_time1,snapshot_time2] = get_realtime_data();

 ddate = datenum(ddate);
%period_window = 2;

end_date = datestr(ddate);
begin_date = datestr(ddate);

% First establish the data connection to bloomberg;
connection = bloomberg;

c = clock;
snapshot_time1 = datestr(c);

%% Get the USD SWAP MUNI % of LIBOR
USSML1= fetch(connection,'USSML1 PREB Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSML2= fetch(connection,'USSML2 PREB Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSML3= fetch(connection,'USSML3 PREB Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSML4= fetch(connection,'USSML4 PREB Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSML5= fetch(connection,'USSML5 PREB Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSML7= fetch(connection,'USSML7 PREB Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSML10 = fetch(connection,'USSML10 PREB Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSML12 = fetch(connection,'USSML12 PREB Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSML15 = fetch(connection,'USSML15 PREB Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSML20 = fetch(connection,'USSML20 PREB Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSML25 = fetch(connection,'USSML25 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSML30 = fetch(connection,'USSML30 PREB Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

%ddate_string = datestr(USSML1(:,1));
if numel(USSML25)==1;
USSML25 = USSML30;
end
r_bma_ratio = [USSML1(:,2)';USSML2(:,2)';USSML3(:,2)';USSML4(:,2)';USSML5(:,2)';USSML7(:,2)';...
               USSML10(:,2)';USSML12(:,2)';USSML15(:,2)';USSML20(:,2)';USSML25(:,2)';USSML30(:,2)';]';
US0003M = fetch(connection,'US0003M Index');
r_bma_basis = r_bma_ratio.*repmat(US0003M.LastPrice,1,12)./100;

%% Get the USD SWAP Quarterly 
USSMQ1= fetch(connection,'USSMQ1 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ2= fetch(connection,'USSMQ2 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ3= fetch(connection,'USSMQ3 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ4= fetch(connection,'USSMQ4 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ5= fetch(connection,'USSMQ5 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSMQ6= fetch(connection,'USSMQ6 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ7= fetch(connection,'USSMQ7 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSMQ8= fetch(connection,'USSMQ8 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSMQ9= fetch(connection,'USSMQ9 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ10 = fetch(connection,'USSMQ10 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSMQ11 = fetch(connection,'USSMQ11 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ12 = fetch(connection,'USSMQ12 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSMQ13 = fetch(connection,'USSMQ13 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSMQ14 = fetch(connection,'USSMQ14 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ15 = fetch(connection,'USSMQ15 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSMQ17 = fetch(connection,'USSMQ17 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ20 = fetch(connection,'USSMQ20 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSMQ22 = fetch(connection,'USSMQ22 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSMQ23 = fetch(connection,'USSMQ23 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ25 = fetch(connection,'USSMQ25 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ30 = fetch(connection,'USSMQ30 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

if numel(USSMQ25)==1;
USSMQ25 = USSMQ30;
end
r_bma = [USSMQ1(:,2)';USSMQ2(:,2)';USSMQ3(:,2)';USSMQ4(:,2)';USSMQ5(:,2)';USSMQ7(:,2)';...
         USSMQ10(:,2)';USSMQ12(:,2)';USSMQ15(:,2)';USSMQ20(:,2)';USSMQ25(:,2)';USSMQ30(:,2)';]';

%% Get the USD LIBOR 
USSWAP1= fetch(connection,'USSWAP1 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP2= fetch(connection,'USSWAP2 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP3= fetch(connection,'USSWAP3 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP4= fetch(connection,'USSWAP4 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP5= fetch(connection,'USSWAP5 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP6= fetch(connection,'USSWAP6 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP7= fetch(connection,'USSWAP7 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP8= fetch(connection,'USSWAP8 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP9= fetch(connection,'USSWAP9 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP10 = fetch(connection,'USSWAP10 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP12 = fetch(connection,'USSWAP12 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP15 = fetch(connection,'USSWAP15 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP20 = fetch(connection,'USSWAP20 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP25 = fetch(connection,'USSWAP25 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSWAP30 = fetch(connection,'USSWAP30 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

r_libor = [USSWAP1(:,2)';USSWAP2(:,2)';USSWAP3(:,2)';USSWAP4(:,2)';USSWAP5(:,2)';USSWAP7(:,2)';...
           USSWAP10(:,2)';USSWAP12(:,2)';USSWAP15(:,2)';USSWAP20(:,2)';USSWAP25(:,2)';USSWAP30(:,2)';]';

%% Get the ATM Swaption volatility
% 1M  expiry
USSV0A1= fetch(connection,'USSV0A1 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A2= fetch(connection,'USSV0A2 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A3= fetch(connection,'USSV0A3 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A4= fetch(connection,'USSV0A4 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A5= fetch(connection,'USSV0A5 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A6= fetch(connection,'USSV0A6 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A7= fetch(connection,'USSV0A7 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A8= fetch(connection,'USSV0A8 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A9= fetch(connection,'USSV0A9 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A10 = fetch(connection,'USSV0A10 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0A12 = fetch(connection,'USSV0A12 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A15 = fetch(connection,'USSV0A15 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A20 = fetch(connection,'USSV0A20 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A25 = fetch(connection,'USSV0A25 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0A30 = fetch(connection,'USSV0A30 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_01M = [USSV0A1(:,2)';USSV0A2(:,2)';USSV0A3(:,2)';USSV0A4(:,2)';USSV0A5(:,2)';USSV0A6(:,2)';USSV0A7(:,2)';...
                 USSV0A8(:,2)';USSV0A9(:,2)';USSV0A10(:,2)';NaN;USSV0A15(:,2)';USSV0A20(:,2)';USSV0A25(:,2)';USSV0A30(:,2)';]';
            
% 3M  expiry
USSV0C1= fetch(connection,'USSV0C1 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C2= fetch(connection,'USSV0C2 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C3= fetch(connection,'USSV0C3 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C4= fetch(connection,'USSV0C4 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C5= fetch(connection,'USSV0C5 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C6= fetch(connection,'USSV0C6 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C7= fetch(connection,'USSV0C7 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C8= fetch(connection,'USSV0C8 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C9= fetch(connection,'USSV0C9 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C10 = fetch(connection,'USSV0C10 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0C12 = fetch(connection,'USSV0C12 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C15 = fetch(connection,'USSV0C15 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C20 = fetch(connection,'USSV0C20 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C25 = fetch(connection,'USSV0C25 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0C30 = fetch(connection,'USSV0C30 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_03M = [USSV0C1(:,2)';USSV0C2(:,2)';USSV0C3(:,2)';USSV0C4(:,2)';USSV0C5(:,2)';USSV0C6(:,2)';USSV0C7(:,2)';...
                 USSV0C8(:,2)';USSV0C9(:,2)';USSV0C10(:,2)';NaN;USSV0C15(:,2)';USSV0C20(:,2)';USSV0C25(:,2)';USSV0C30(:,2)';]';

% 6M  expiry
USSV0F1= fetch(connection,'USSV0F1 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F2= fetch(connection,'USSV0F2 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F3= fetch(connection,'USSV0F3 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F4= fetch(connection,'USSV0F4 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F5= fetch(connection,'USSV0F5 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F6= fetch(connection,'USSV0F6 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F7= fetch(connection,'USSV0F7 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F8= fetch(connection,'USSV0F8 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F9= fetch(connection,'USSV0F9 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F10 = fetch(connection,'USSV0F10 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0F12 = fetch(connection,'USSV0F12 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F15 = fetch(connection,'USSV0F15 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F20 = fetch(connection,'USSV0F20 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F25 = fetch(connection,'USSV0F25 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0F30 = fetch(connection,'USSV0F30 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_06M = [USSV0F1(:,2)';USSV0F2(:,2)';USSV0F3(:,2)';USSV0F4(:,2)';USSV0F5(:,2)';USSV0F6(:,2)';USSV0F7(:,2)';...
                 USSV0F8(:,2)';USSV0F9(:,2)';USSV0F10(:,2)';NaN;USSV0F15(:,2)';USSV0F20(:,2)';USSV0F25(:,2)';USSV0F30(:,2)';]';

% 9M  expiry
USSV0I1= fetch(connection,'USSV0I1 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I2= fetch(connection,'USSV0I2 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I3= fetch(connection,'USSV0I3 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I4= fetch(connection,'USSV0I4 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I5= fetch(connection,'USSV0I5 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I6= fetch(connection,'USSV0I6 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I7= fetch(connection,'USSV0I7 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I8= fetch(connection,'USSV0I8 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I9= fetch(connection,'USSV0I9 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I10 = fetch(connection,'USSV0I10 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0I12 = fetch(connection,'USSV0I12 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I15 = fetch(connection,'USSV0I15 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I20 = fetch(connection,'USSV0I20 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I25 = fetch(connection,'USSV0I25 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0I30 = fetch(connection,'USSV0I30 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_09M = [USSV0I1(:,2)';USSV0I2(:,2)';USSV0I3(:,2)';USSV0I4(:,2)';USSV0I5(:,2)';USSV0I6(:,2)';USSV0I7(:,2)';...
                 USSV0I8(:,2)';USSV0I9(:,2)';USSV0I10(:,2)';NaN;USSV0I15(:,2)';USSV0I20(:,2)';USSV0I25(:,2)';USSV0I30(:,2)';]';


% 1Y  expiry
USSV011= fetch(connection,'USSV011 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV012= fetch(connection,'USSV012 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV013= fetch(connection,'USSV013 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV014= fetch(connection,'USSV014 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV015= fetch(connection,'USSV015 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV016= fetch(connection,'USSV016 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV017= fetch(connection,'USSV017 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV018= fetch(connection,'USSV018 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV019= fetch(connection,'USSV019 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0110 = fetch(connection,'USSV0110 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0112 = fetch(connection,'USSV0112 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0115 = fetch(connection,'USSV0115 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0120 = fetch(connection,'USSV0120 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0125 = fetch(connection,'USSV0125 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0130 = fetch(connection,'USSV0130 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_01Y = [USSV011(:,2)';USSV012(:,2)';USSV013(:,2)';USSV014(:,2)';USSV015(:,2)';USSV016(:,2)';USSV017(:,2)';...
                 USSV018(:,2)';USSV019(:,2)';USSV0110(:,2)';NaN;USSV0115(:,2)';USSV0120(:,2)';USSV0125(:,2)';USSV0130(:,2)';]';
             
% 2Y  expiry
USSV021= fetch(connection,'USSV021 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV022= fetch(connection,'USSV022 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV023= fetch(connection,'USSV023 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV024= fetch(connection,'USSV024 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV025= fetch(connection,'USSV025 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV026= fetch(connection,'USSV026 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV027= fetch(connection,'USSV027 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV028= fetch(connection,'USSV028 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV029= fetch(connection,'USSV029 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0210 = fetch(connection,'USSV0210 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0212 = fetch(connection,'USSV0212 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0215 = fetch(connection,'USSV0215 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0220 = fetch(connection,'USSV0220 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0225 = fetch(connection,'USSV0225 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0230 = fetch(connection,'USSV0230 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_02Y = [USSV021(:,2)';USSV022(:,2)';USSV023(:,2)';USSV024(:,2)';USSV025(:,2)';USSV026(:,2)';USSV027(:,2)';...
                 USSV028(:,2)';USSV029(:,2)';USSV0210(:,2)';NaN;USSV0215(:,2)';USSV0220(:,2)';USSV0225(:,2)';USSV0230(:,2)';]';

% 3Y  expiry
USSV031= fetch(connection,'USSV031 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV032= fetch(connection,'USSV032 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV033= fetch(connection,'USSV033 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV034= fetch(connection,'USSV034 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV035= fetch(connection,'USSV035 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV036= fetch(connection,'USSV036 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV037= fetch(connection,'USSV037 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV038= fetch(connection,'USSV038 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV039= fetch(connection,'USSV039 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0310 = fetch(connection,'USSV0310 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0312 = fetch(connection,'USSV0312 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0315 = fetch(connection,'USSV0315 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0320 = fetch(connection,'USSV0320 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0325 = fetch(connection,'USSV0325 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0330 = fetch(connection,'USSV0330 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_03Y = [USSV031(:,2)';USSV032(:,2)';USSV033(:,2)';USSV034(:,2)';USSV035(:,2)';USSV036(:,2)';USSV037(:,2)';...
                 USSV038(:,2)';USSV039(:,2)';USSV0310(:,2)';NaN;USSV0315(:,2)';USSV0320(:,2)';USSV0325(:,2)';USSV0330(:,2)';]';

% 4Y  expiry
USSV041= fetch(connection,'USSV041 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV042= fetch(connection,'USSV042 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV043= fetch(connection,'USSV043 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV044= fetch(connection,'USSV044 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV045= fetch(connection,'USSV045 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV046= fetch(connection,'USSV046 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV047= fetch(connection,'USSV047 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV048= fetch(connection,'USSV048 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV049= fetch(connection,'USSV049 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0410 = fetch(connection,'USSV0410 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0412 = fetch(connection,'USSV0412 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0415 = fetch(connection,'USSV0415 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0420 = fetch(connection,'USSV0420 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0425 = fetch(connection,'USSV0425 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0430 = fetch(connection,'USSV0430 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_04Y = [USSV041(:,2)';USSV042(:,2)';USSV043(:,2)';USSV044(:,2)';USSV045(:,2)';USSV046(:,2)';USSV047(:,2)';...
                 USSV048(:,2)';USSV049(:,2)';USSV0410(:,2)';NaN;USSV0415(:,2)';USSV0420(:,2)';USSV0425(:,2)';USSV0430(:,2)';]';

% 5Y  expiry
USSV051= fetch(connection,'USSV051 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV052= fetch(connection,'USSV052 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV053= fetch(connection,'USSV053 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV054= fetch(connection,'USSV054 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV055= fetch(connection,'USSV055 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV056= fetch(connection,'USSV056 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV057= fetch(connection,'USSV057 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV058= fetch(connection,'USSV058 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV059= fetch(connection,'USSV059 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0510 = fetch(connection,'USSV0510 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0512 = fetch(connection,'USSV0512 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0515 = fetch(connection,'USSV0515 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0520 = fetch(connection,'USSV0520 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0525 = fetch(connection,'USSV0525 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0530 = fetch(connection,'USSV0530 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_05Y = [USSV051(:,2)';USSV052(:,2)';USSV053(:,2)';USSV054(:,2)';USSV055(:,2)';USSV056(:,2)';USSV057(:,2)';...
                 USSV058(:,2)';USSV059(:,2)';USSV0510(:,2)';NaN;USSV0515(:,2)';USSV0520(:,2)';USSV0525(:,2)';USSV0530(:,2)';]';


% 6Y  expiry
USSV061= fetch(connection,'USSV061 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV062= fetch(connection,'USSV062 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV063= fetch(connection,'USSV063 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV064= fetch(connection,'USSV064 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV065= fetch(connection,'USSV065 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV066= fetch(connection,'USSV066 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV067= fetch(connection,'USSV067 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV068= fetch(connection,'USSV068 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV069= fetch(connection,'USSV069 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0610 = fetch(connection,'USSV0610 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0612 = fetch(connection,'USSV0612 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0615 = fetch(connection,'USSV0615 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0620 = fetch(connection,'USSV0620 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0625 = fetch(connection,'USSV0625 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0630 = fetch(connection,'USSV0630 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_06Y = [USSV061(:,2)';USSV062(:,2)';USSV063(:,2)';USSV064(:,2)';USSV065(:,2)';USSV066(:,2)';USSV067(:,2)';...
                 USSV068(:,2)';USSV069(:,2)';USSV0610(:,2)';NaN;USSV0615(:,2)';USSV0620(:,2)';USSV0625(:,2)';USSV0630(:,2)';]';

% 7Y  expiry
USSV071= fetch(connection,'USSV071 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV072= fetch(connection,'USSV072 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV073= fetch(connection,'USSV073 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV074= fetch(connection,'USSV074 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV075= fetch(connection,'USSV075 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV076= fetch(connection,'USSV076 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV077= fetch(connection,'USSV077 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV078= fetch(connection,'USSV078 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV079= fetch(connection,'USSV079 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0710 = fetch(connection,'USSV0710 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0712 = fetch(connection,'USSV0712 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0715 = fetch(connection,'USSV0715 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0720 = fetch(connection,'USSV0720 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0725 = fetch(connection,'USSV0725 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0730 = fetch(connection,'USSV0730 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_07Y = [USSV071(:,2)';USSV072(:,2)';USSV073(:,2)';USSV074(:,2)';USSV075(:,2)';USSV076(:,2)';USSV077(:,2)';...
                 USSV078(:,2)';USSV079(:,2)';USSV0710(:,2)';NaN;USSV0715(:,2)';USSV0720(:,2)';USSV0725(:,2)';USSV0730(:,2)';]';

% 8Y  expiry
USSV081= fetch(connection,'USSV081 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV082= fetch(connection,'USSV082 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV083= fetch(connection,'USSV083 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV084= fetch(connection,'USSV084 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV085= fetch(connection,'USSV085 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV086= fetch(connection,'USSV086 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV087= fetch(connection,'USSV087 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV088= fetch(connection,'USSV088 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV089= fetch(connection,'USSV089 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0810 = fetch(connection,'USSV0810 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0812 = fetch(connection,'USSV0812 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0815 = fetch(connection,'USSV0815 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0820 = fetch(connection,'USSV0820 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0825 = fetch(connection,'USSV0825 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0830 = fetch(connection,'USSV0830 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_08Y = [USSV081(:,2)';USSV082(:,2)';USSV083(:,2)';USSV084(:,2)';USSV085(:,2)';USSV086(:,2)';USSV087(:,2)';...
                 USSV088(:,2)';USSV089(:,2)';USSV0810(:,2)';NaN;USSV0815(:,2)';USSV0820(:,2)';USSV0825(:,2)';USSV0830(:,2)';]';


% 9Y  expiry
USSV091= fetch(connection,'USSV091 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV092= fetch(connection,'USSV092 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV093= fetch(connection,'USSV093 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV094= fetch(connection,'USSV094 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV095= fetch(connection,'USSV095 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV096= fetch(connection,'USSV096 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV097= fetch(connection,'USSV097 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV098= fetch(connection,'USSV098 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV099= fetch(connection,'USSV099 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0910 = fetch(connection,'USSV0910 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV0912 = fetch(connection,'USSV0912 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0915 = fetch(connection,'USSV0915 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0920 = fetch(connection,'USSV0920 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0925 = fetch(connection,'USSV0925 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV0930 = fetch(connection,'USSV0930 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_09Y = [USSV091(:,2)';USSV092(:,2)';USSV093(:,2)';USSV094(:,2)';USSV095(:,2)';USSV096(:,2)';USSV097(:,2)';...
                 USSV098(:,2)';USSV099(:,2)';USSV0910(:,2)';NaN;USSV0915(:,2)';USSV0920(:,2)';USSV0925(:,2)';USSV0930(:,2)';]';


% 10Y  expiry
USSV101= fetch(connection,'USSV101 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV102= fetch(connection,'USSV102 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV103= fetch(connection,'USSV103 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV104= fetch(connection,'USSV104 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV105= fetch(connection,'USSV105 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV106= fetch(connection,'USSV106 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV107= fetch(connection,'USSV107 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV108= fetch(connection,'USSV108 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV109= fetch(connection,'USSV109 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV1010 = fetch(connection,'USSV1010 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV1012 = fetch(connection,'USSV1012 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV1015 = fetch(connection,'USSV1015 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV1020 = fetch(connection,'USSV1020 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV1025 = fetch(connection,'USSV1025 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV1030 = fetch(connection,'USSV1030 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_10Y = [USSV101(:,2)';USSV102(:,2)';USSV103(:,2)';USSV104(:,2)';USSV105(:,2)';USSV106(:,2)';USSV107(:,2)';...
                 USSV108(:,2)';USSV109(:,2)';USSV1010(:,2)';NaN;USSV1015(:,2)';USSV1020(:,2)';USSV1025(:,2)';USSV1030(:,2)';]';

% 15Y  expiry
USSV151= fetch(connection,'USSV151 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV152= fetch(connection,'USSV152 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV153= fetch(connection,'USSV153 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV154= fetch(connection,'USSV154 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV155= fetch(connection,'USSV155 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV156= fetch(connection,'USSV156 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV157= fetch(connection,'USSV157 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV158= fetch(connection,'USSV158 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV159= fetch(connection,'USSV159 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV1510 = fetch(connection,'USSV1510 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV1512 = fetch(connection,'USSV1512 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV1515 = fetch(connection,'USSV1515 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV1520 = fetch(connection,'USSV1520 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV1525 = fetch(connection,'USSV1525 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV1530 = fetch(connection,'USSV1530 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_15Y = [USSV151(:,2)';USSV152(:,2)';USSV153(:,2)';USSV154(:,2)';USSV155(:,2)';USSV156(:,2)';USSV157(:,2)';...
                 USSV158(:,2)';USSV159(:,2)';USSV1510(:,2)';NaN;USSV1515(:,2)';USSV1520(:,2)';USSV1525(:,2)';USSV1530(:,2)';]';


% 20Y  expiry
USSV201= fetch(connection,'USSV201 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV202= fetch(connection,'USSV202 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV203= fetch(connection,'USSV203 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV204= fetch(connection,'USSV204 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV205= fetch(connection,'USSV205 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV206= fetch(connection,'USSV206 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV207= fetch(connection,'USSV207 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV208= fetch(connection,'USSV208 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV209= fetch(connection,'USSV209 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV2010 = fetch(connection,'USSV2010 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV2012 = fetch(connection,'USSV2012 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV2015 = fetch(connection,'USSV2015 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV2020 = fetch(connection,'USSV2020 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV2025 = fetch(connection,'USSV2025 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV2030 = fetch(connection,'USSV2030 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_20Y = [USSV201(:,2)';USSV202(:,2)';USSV203(:,2)';USSV204(:,2)';USSV205(:,2)';USSV206(:,2)';USSV207(:,2)';...
                 USSV208(:,2)';USSV209(:,2)';USSV2010(:,2)';NaN;USSV2015(:,2)';USSV2020(:,2)';USSV2025(:,2)';USSV2030(:,2)';]';

% 25Y  expiry
USSV251= fetch(connection,'USSV251 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV252= fetch(connection,'USSV252 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV253= fetch(connection,'USSV253 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV254= fetch(connection,'USSV254 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV255= fetch(connection,'USSV255 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV256= fetch(connection,'USSV256 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV257= fetch(connection,'USSV257 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV258= fetch(connection,'USSV258 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV259= fetch(connection,'USSV259 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV2510 = fetch(connection,'USSV2510 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV2512 = fetch(connection,'USSV2512 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV2515 = fetch(connection,'USSV2515 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV2520 = fetch(connection,'USSV2520 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV2525 = fetch(connection,'USSV2525 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV2530 = fetch(connection,'USSV2530 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

libor_vol_25Y = [USSV251(:,2)';USSV252(:,2)';USSV253(:,2)';USSV254(:,2)';USSV255(:,2)';USSV256(:,2)';USSV257(:,2)';...
                 USSV258(:,2)';USSV259(:,2)';USSV2510(:,2)';NaN;USSV2515(:,2)';USSV2520(:,2)';USSV2525(:,2)';USSV2530(:,2)';]';

% 30Y  expiry
USSV301= fetch(connection,'USSV301 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV302= fetch(connection,'USSV302 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV303= fetch(connection,'USSV303 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV304= fetch(connection,'USSV304 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV305= fetch(connection,'USSV305 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV306= fetch(connection,'USSV306 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV307= fetch(connection,'USSV307 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV308= fetch(connection,'USSV308 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV309= fetch(connection,'USSV309 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV3010 = fetch(connection,'USSV3010 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
%USSV3012 = fetch(connection,'USSV3012 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV3015 = fetch(connection,'USSV3015 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV3020 = fetch(connection,'USSV3020 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV3025 = fetch(connection,'USSV3025 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSV3030 = fetch(connection,'USSV3030 SMKT Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

c = clock;
snapshot_time2 = [datestr(ddate) ' 16:00:00'];

libor_vol_30Y = [USSV301(:,2)';USSV302(:,2)';USSV303(:,2)';USSV304(:,2)';USSV305(:,2)';USSV306(:,2)';USSV307(:,2)';...
                 USSV308(:,2)';USSV309(:,2)';USSV3010(:,2)';NaN;USSV3015(:,2)';USSV3020(:,2)';USSV3025(:,2)';USSV3030(:,2)';]';
             
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

libor_vol_matrix(:,11) = (libor_vol_matrix(:,10) + libor_vol_matrix(:,12))./2;

%subplot(2,2,1);
[X,Y] = meshgrid(expiry,tenor);
%surf(X,Y,libor_vol_matrix');
%view(65,15);

libor_vol_interp = interp2(X,Y,libor_vol_matrix',X,Y);
 close(connection);
 
 %save work.mat









