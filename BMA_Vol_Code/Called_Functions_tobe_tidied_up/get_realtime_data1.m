function [r_bma_ratio,r_bma_basis,r_bma,r_libor,libor_vol_matrix,libor_vol_interp,snapshot_time1,snapshot_time2]= get_realtime_data1(ddate);
 % [r_bma_ratio,r_bma_basis,r_bma,r_libor,libor_vol_matrix,libor_vol_interp,snapshot_time1,snapshot_time2] = get_realtime_data();

 ddate = datenum(ddate);
%period_window = 2;

end_date = datestr(ddate);
begin_date = datestr(ddate);

% First establish the data connection to bloomberg;
connection = blp;

c = clock;
snapshot_time1 = datestr(c);

%% Get the USD SWAP MUNI % of LIBOR
USSML1= history(connection,'USSML1 PREB Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSML2= history(connection,'USSML2 PREB Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSML3= history(connection,'USSML3 PREB Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSML4= history(connection,'USSML4 PREB Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSML5= history(connection,'USSML5 PREB Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSML7= history(connection,'USSML7 PREB Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSML10 = history(connection,'USSML10 PREB Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSML12 = history(connection,'USSML12 PREB Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSML15 = history(connection,'USSML15 PREB Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSML20 = history(connection,'USSML20 PREB Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSML25 = history(connection,'USSML25 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSML30 = history(connection,'USSML30 PREB Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});





%ddate_string = datestr(USSML1(:,1));
if numel(USSML25)==1;
USSML25 = USSML30;
end
r_bma_ratio = [USSML1(:,2)';USSML2(:,2)';USSML3(:,2)';USSML4(:,2)';USSML5(:,2)';USSML7(:,2)';...
               USSML10(:,2)';USSML12(:,2)';USSML15(:,2)';USSML20(:,2)';USSML25(:,2)';USSML30(:,2)';]';
%US0003M = realtime(connection,'US0003M Index','Last_Price');
US0003M = getdata(connection,'US0003M Index','last_price');

r_bma_basis = r_bma_ratio.*repmat(US0003M.last_price,1,12)./100;

%% Get the USD SWAP Quarterly 
USSMQ1= history(connection,'USSMQ1 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSMQ2= history(connection,'USSMQ2 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSMQ3= history(connection,'USSMQ3 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSMQ4= history(connection,'USSMQ4 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSMQ5= history(connection,'USSMQ5 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSMQ6= history(connection,'USSMQ6 Curncy','Last_Price',begin_date, end_date);
USSMQ7= history(connection,'USSMQ7 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSMQ8= history(connection,'USSMQ8 Curncy','Last_Price',begin_date, end_date, {'daily','active_days_only','previous_value'});
%USSMQ9= history(connection,'USSMQ9 Curncy','Last_Price',begin_date, end_date);
USSMQ10 = history(connection,'USSMQ10 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSMQ11 = history(connection,'USSMQ11 Curncy','Last_Price',begin_date, end_date);
USSMQ12 = history(connection,'USSMQ12 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSMQ13 = history(connection,'USSMQ13 Curncy','Last_Price',begin_date, end_date);
%USSMQ14 = history(connection,'USSMQ14 Curncy','Last_Price',begin_date, end_date);
USSMQ15 = history(connection,'USSMQ15 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSMQ17 = history(connection,'USSMQ17 Curncy','Last_Price',begin_date, end_date);
USSMQ20 = history(connection,'USSMQ20 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSMQ22 = history(connection,'USSMQ22 Curncy','Last_Price',begin_date, end_date);
%USSMQ23 = history(connection,'USSMQ23 Curncy','Last_Price',begin_date, end_date);
USSMQ25 = history(connection,'USSMQ25 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSMQ30 = history(connection,'USSMQ30 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

















if numel(USSMQ25)==1;
USSMQ25 = USSMQ30;
end
r_bma = [USSMQ1(:,2)';USSMQ2(:,2)';USSMQ3(:,2)';USSMQ4(:,2)';USSMQ5(:,2)';USSMQ7(:,2)';...
         USSMQ10(:,2)';USSMQ12(:,2)';USSMQ15(:,2)';USSMQ20(:,2)';USSMQ25(:,2)';USSMQ30(:,2)';]';

%% Get the USD LIBOR 

USSWAP1= history(connection,'USSWAP1 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP2= history(connection,'USSWAP2 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP3= history(connection,'USSWAP3 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP4= history(connection,'USSWAP4 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP5= history(connection,'USSWAP5 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP6= history(connection,'USSWAP6 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP7= history(connection,'USSWAP7 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP8= history(connection,'USSWAP8 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP9= history(connection,'USSWAP9 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP10 = history(connection,'USSWAP10 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP12 = history(connection,'USSWAP12 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP15 = history(connection,'USSWAP15 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP20 = history(connection,'USSWAP20 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP25 = history(connection,'USSWAP25 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSWAP30 = history(connection,'USSWAP30 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});



r_libor = [USSWAP1(:,2)';USSWAP2(:,2)';USSWAP3(:,2)';USSWAP4(:,2)';USSWAP5(:,2)';USSWAP7(:,2)';...
           USSWAP10(:,2)';USSWAP12(:,2)';USSWAP15(:,2)';USSWAP20(:,2)';USSWAP25(:,2)';USSWAP30(:,2)';]';

%% Get the ATM Swaption volatility
% 1M  expiry

USSV0A1= history(connection,'USSV0A1 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A2= history(connection,'USSV0A2 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A3= history(connection,'USSV0A3 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A4= history(connection,'USSV0A4 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A5= history(connection,'USSV0A5 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A6= history(connection,'USSV0A6 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A7= history(connection,'USSV0A7 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A8= history(connection,'USSV0A8 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A9= history(connection,'USSV0A9 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A10 = history(connection,'USSV0A10 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0A12 = history(connection,'USSV0A12 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A15 = history(connection,'USSV0A15 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A20 = history(connection,'USSV0A20 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A25 = history(connection,'USSV0A25 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0A30 = history(connection,'USSV0A30 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_01M = [USSV0A1(:,2)';USSV0A2(:,2)';USSV0A3(:,2)';USSV0A4(:,2)';USSV0A5(:,2)';USSV0A6(:,2)';USSV0A7(:,2)';...
                 USSV0A8(:,2)';USSV0A9(:,2)';USSV0A10(:,2)';NaN;USSV0A15(:,2)';USSV0A20(:,2)';USSV0A25(:,2)';USSV0A30(:,2)';]';
            
% 3M  expiry
USSV0C1= history(connection,'USSV0C1 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C2= history(connection,'USSV0C2 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C3= history(connection,'USSV0C3 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C4= history(connection,'USSV0C4 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C5= history(connection,'USSV0C5 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C6= history(connection,'USSV0C6 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C7= history(connection,'USSV0C7 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C8= history(connection,'USSV0C8 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C9= history(connection,'USSV0C9 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C10 = history(connection,'USSV0C10 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0C12 = history(connection,'USSV0C12 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C15 = history(connection,'USSV0C15 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C20 = history(connection,'USSV0C20 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C25 = history(connection,'USSV0C25 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0C30 = history(connection,'USSV0C30 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_03M = [USSV0C1(:,2)';USSV0C2(:,2)';USSV0C3(:,2)';USSV0C4(:,2)';USSV0C5(:,2)';USSV0C6(:,2)';USSV0C7(:,2)';...
                 USSV0C8(:,2)';USSV0C9(:,2)';USSV0C10(:,2)';NaN;USSV0C15(:,2)';USSV0C20(:,2)';USSV0C25(:,2)';USSV0C30(:,2)';]';

% 6M  expiry
USSV0F1= history(connection,'USSV0F1 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F2= history(connection,'USSV0F2 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F3= history(connection,'USSV0F3 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F4= history(connection,'USSV0F4 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F5= history(connection,'USSV0F5 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F6= history(connection,'USSV0F6 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F7= history(connection,'USSV0F7 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F8= history(connection,'USSV0F8 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F9= history(connection,'USSV0F9 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F10 = history(connection,'USSV0F10 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0F12 = history(connection,'USSV0F12 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F15 = history(connection,'USSV0F15 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F20 = history(connection,'USSV0F20 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F25 = history(connection,'USSV0F25 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0F30 = history(connection,'USSV0F30 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_06M = [USSV0F1(:,2)';USSV0F2(:,2)';USSV0F3(:,2)';USSV0F4(:,2)';USSV0F5(:,2)';USSV0F6(:,2)';USSV0F7(:,2)';...
                 USSV0F8(:,2)';USSV0F9(:,2)';USSV0F10(:,2)';NaN;USSV0F15(:,2)';USSV0F20(:,2)';USSV0F25(:,2)';USSV0F30(:,2)';]';

% 9M  expiry
USSV0I1= history(connection,'USSV0I1 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I2= history(connection,'USSV0I2 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I3= history(connection,'USSV0I3 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I4= history(connection,'USSV0I4 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I5= history(connection,'USSV0I5 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I6= history(connection,'USSV0I6 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I7= history(connection,'USSV0I7 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I8= history(connection,'USSV0I8 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I9= history(connection,'USSV0I9 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I10 = history(connection,'USSV0I10 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0I12 = history(connection,'USSV0I12 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I15 = history(connection,'USSV0I15 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I20 = history(connection,'USSV0I20 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I25 = history(connection,'USSV0I25 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0I30 = history(connection,'USSV0I30 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_09M = [USSV0I1(:,2)';USSV0I2(:,2)';USSV0I3(:,2)';USSV0I4(:,2)';USSV0I5(:,2)';USSV0I6(:,2)';USSV0I7(:,2)';...
                 USSV0I8(:,2)';USSV0I9(:,2)';USSV0I10(:,2)';NaN;USSV0I15(:,2)';USSV0I20(:,2)';USSV0I25(:,2)';USSV0I30(:,2)';]';


% 1Y  expiry
USSV011= history(connection,'USSV011 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV012= history(connection,'USSV012 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV013= history(connection,'USSV013 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV014= history(connection,'USSV014 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV015= history(connection,'USSV015 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV016= history(connection,'USSV016 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV017= history(connection,'USSV017 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV018= history(connection,'USSV018 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV019= history(connection,'USSV019 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0110 = history(connection,'USSV0110 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0112 = history(connection,'USSV0112 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0115 = history(connection,'USSV0115 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0120 = history(connection,'USSV0120 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0125 = history(connection,'USSV0125 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0130 = history(connection,'USSV0130 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_01Y = [USSV011(:,2)';USSV012(:,2)';USSV013(:,2)';USSV014(:,2)';USSV015(:,2)';USSV016(:,2)';USSV017(:,2)';...
                 USSV018(:,2)';USSV019(:,2)';USSV0110(:,2)';NaN;USSV0115(:,2)';USSV0120(:,2)';USSV0125(:,2)';USSV0130(:,2)';]';
             
% 2Y  expiry
USSV021= history(connection,'USSV021 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV022= history(connection,'USSV022 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV023= history(connection,'USSV023 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV024= history(connection,'USSV024 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV025= history(connection,'USSV025 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV026= history(connection,'USSV026 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV027= history(connection,'USSV027 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV028= history(connection,'USSV028 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV029= history(connection,'USSV029 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0210 = history(connection,'USSV0210 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0212 = history(connection,'USSV0212 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0215 = history(connection,'USSV0215 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0220 = history(connection,'USSV0220 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0225 = history(connection,'USSV0225 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0230 = history(connection,'USSV0230 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_02Y = [USSV021(:,2)';USSV022(:,2)';USSV023(:,2)';USSV024(:,2)';USSV025(:,2)';USSV026(:,2)';USSV027(:,2)';...
                 USSV028(:,2)';USSV029(:,2)';USSV0210(:,2)';NaN;USSV0215(:,2)';USSV0220(:,2)';USSV0225(:,2)';USSV0230(:,2)';]';

% 3Y  expiry
USSV031= history(connection,'USSV031 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV032= history(connection,'USSV032 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV033= history(connection,'USSV033 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV034= history(connection,'USSV034 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV035= history(connection,'USSV035 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV036= history(connection,'USSV036 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV037= history(connection,'USSV037 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV038= history(connection,'USSV038 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV039= history(connection,'USSV039 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0310 = history(connection,'USSV0310 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0312 = history(connection,'USSV0312 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0315 = history(connection,'USSV0315 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0320 = history(connection,'USSV0320 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0325 = history(connection,'USSV0325 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0330 = history(connection,'USSV0330 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_03Y = [USSV031(:,2)';USSV032(:,2)';USSV033(:,2)';USSV034(:,2)';USSV035(:,2)';USSV036(:,2)';USSV037(:,2)';...
                 USSV038(:,2)';USSV039(:,2)';USSV0310(:,2)';NaN;USSV0315(:,2)';USSV0320(:,2)';USSV0325(:,2)';USSV0330(:,2)';]';

% 4Y  expiry
USSV041= history(connection,'USSV041 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV042= history(connection,'USSV042 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV043= history(connection,'USSV043 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV044= history(connection,'USSV044 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV045= history(connection,'USSV045 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV046= history(connection,'USSV046 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV047= history(connection,'USSV047 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV048= history(connection,'USSV048 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV049= history(connection,'USSV049 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0410 = history(connection,'USSV0410 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0412 = history(connection,'USSV0412 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0415 = history(connection,'USSV0415 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0420 = history(connection,'USSV0420 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0425 = history(connection,'USSV0425 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0430 = history(connection,'USSV0430 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_04Y = [USSV041(:,2)';USSV042(:,2)';USSV043(:,2)';USSV044(:,2)';USSV045(:,2)';USSV046(:,2)';USSV047(:,2)';...
                 USSV048(:,2)';USSV049(:,2)';USSV0410(:,2)';NaN;USSV0415(:,2)';USSV0420(:,2)';USSV0425(:,2)';USSV0430(:,2)';]';

% 5Y  expiry
USSV051= history(connection,'USSV051 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV052= history(connection,'USSV052 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV053= history(connection,'USSV053 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV054= history(connection,'USSV054 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV055= history(connection,'USSV055 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV056= history(connection,'USSV056 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV057= history(connection,'USSV057 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV058= history(connection,'USSV058 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV059= history(connection,'USSV059 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0510 = history(connection,'USSV0510 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0512 = history(connection,'USSV0512 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0515 = history(connection,'USSV0515 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0520 = history(connection,'USSV0520 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0525 = history(connection,'USSV0525 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0530 = history(connection,'USSV0530 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_05Y = [USSV051(:,2)';USSV052(:,2)';USSV053(:,2)';USSV054(:,2)';USSV055(:,2)';USSV056(:,2)';USSV057(:,2)';...
                 USSV058(:,2)';USSV059(:,2)';USSV0510(:,2)';NaN;USSV0515(:,2)';USSV0520(:,2)';USSV0525(:,2)';USSV0530(:,2)';]';


% 6Y  expiry
USSV061= history(connection,'USSV061 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV062= history(connection,'USSV062 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV063= history(connection,'USSV063 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV064= history(connection,'USSV064 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV065= history(connection,'USSV065 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV066= history(connection,'USSV066 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV067= history(connection,'USSV067 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV068= history(connection,'USSV068 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV069= history(connection,'USSV069 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0610 = history(connection,'USSV0610 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0612 = history(connection,'USSV0612 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0615 = history(connection,'USSV0615 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0620 = history(connection,'USSV0620 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0625 = history(connection,'USSV0625 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0630 = history(connection,'USSV0630 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_06Y = [USSV061(:,2)';USSV062(:,2)';USSV063(:,2)';USSV064(:,2)';USSV065(:,2)';USSV066(:,2)';USSV067(:,2)';...
                 USSV068(:,2)';USSV069(:,2)';USSV0610(:,2)';NaN;USSV0615(:,2)';USSV0620(:,2)';USSV0625(:,2)';USSV0630(:,2)';]';

% 7Y  expiry
USSV071= history(connection,'USSV071 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV072= history(connection,'USSV072 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV073= history(connection,'USSV073 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV074= history(connection,'USSV074 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV075= history(connection,'USSV075 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV076= history(connection,'USSV076 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV077= history(connection,'USSV077 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV078= history(connection,'USSV078 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV079= history(connection,'USSV079 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0710 = history(connection,'USSV0710 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0712 = history(connection,'USSV0712 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0715 = history(connection,'USSV0715 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0720 = history(connection,'USSV0720 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0725 = history(connection,'USSV0725 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0730 = history(connection,'USSV0730 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_07Y = [USSV071(:,2)';USSV072(:,2)';USSV073(:,2)';USSV074(:,2)';USSV075(:,2)';USSV076(:,2)';USSV077(:,2)';...
                 USSV078(:,2)';USSV079(:,2)';USSV0710(:,2)';NaN;USSV0715(:,2)';USSV0720(:,2)';USSV0725(:,2)';USSV0730(:,2)';]';

% 8Y  expiry
USSV081= history(connection,'USSV081 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV082= history(connection,'USSV082 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV083= history(connection,'USSV083 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV084= history(connection,'USSV084 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV085= history(connection,'USSV085 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV086= history(connection,'USSV086 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV087= history(connection,'USSV087 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV088= history(connection,'USSV088 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV089= history(connection,'USSV089 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0810 = history(connection,'USSV0810 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0812 = history(connection,'USSV0812 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0815 = history(connection,'USSV0815 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0820 = history(connection,'USSV0820 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0825 = history(connection,'USSV0825 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0830 = history(connection,'USSV0830 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_08Y = [USSV081(:,2)';USSV082(:,2)';USSV083(:,2)';USSV084(:,2)';USSV085(:,2)';USSV086(:,2)';USSV087(:,2)';...
                 USSV088(:,2)';USSV089(:,2)';USSV0810(:,2)';NaN;USSV0815(:,2)';USSV0820(:,2)';USSV0825(:,2)';USSV0830(:,2)';]';


% 9Y  expiry
USSV091= history(connection,'USSV091 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV092= history(connection,'USSV092 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV093= history(connection,'USSV093 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV094= history(connection,'USSV094 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV095= history(connection,'USSV095 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV096= history(connection,'USSV096 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV097= history(connection,'USSV097 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV098= history(connection,'USSV098 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV099= history(connection,'USSV099 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0910 = history(connection,'USSV0910 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV0912 = history(connection,'USSV0912 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0915 = history(connection,'USSV0915 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0920 = history(connection,'USSV0920 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0925 = history(connection,'USSV0925 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV0930 = history(connection,'USSV0930 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_09Y = [USSV091(:,2)';USSV092(:,2)';USSV093(:,2)';USSV094(:,2)';USSV095(:,2)';USSV096(:,2)';USSV097(:,2)';...
                 USSV098(:,2)';USSV099(:,2)';USSV0910(:,2)';NaN;USSV0915(:,2)';USSV0920(:,2)';USSV0925(:,2)';USSV0930(:,2)';]';


% 10Y  expiry
USSV101= history(connection,'USSV101 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV102= history(connection,'USSV102 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV103= history(connection,'USSV103 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV104= history(connection,'USSV104 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV105= history(connection,'USSV105 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV106= history(connection,'USSV106 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV107= history(connection,'USSV107 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV108= history(connection,'USSV108 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV109= history(connection,'USSV109 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV1010 = history(connection,'USSV1010 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV1012 = history(connection,'USSV1012 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV1015 = history(connection,'USSV1015 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV1020 = history(connection,'USSV1020 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV1025 = history(connection,'USSV1025 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV1030 = history(connection,'USSV1030 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_10Y = [USSV101(:,2)';USSV102(:,2)';USSV103(:,2)';USSV104(:,2)';USSV105(:,2)';USSV106(:,2)';USSV107(:,2)';...
                 USSV108(:,2)';USSV109(:,2)';USSV1010(:,2)';NaN;USSV1015(:,2)';USSV1020(:,2)';USSV1025(:,2)';USSV1030(:,2)';]';

% 15Y  expiry
USSV151= history(connection,'USSV151 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV152= history(connection,'USSV152 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV153= history(connection,'USSV153 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV154= history(connection,'USSV154 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV155= history(connection,'USSV155 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV156= history(connection,'USSV156 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV157= history(connection,'USSV157 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV158= history(connection,'USSV158 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV159= history(connection,'USSV159 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV1510 = history(connection,'USSV1510 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV1512 = history(connection,'USSV1512 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV1515 = history(connection,'USSV1515 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV1520 = history(connection,'USSV1520 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV1525 = history(connection,'USSV1525 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV1530 = history(connection,'USSV1530 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_15Y = [USSV151(:,2)';USSV152(:,2)';USSV153(:,2)';USSV154(:,2)';USSV155(:,2)';USSV156(:,2)';USSV157(:,2)';...
                 USSV158(:,2)';USSV159(:,2)';USSV1510(:,2)';NaN;USSV1515(:,2)';USSV1520(:,2)';USSV1525(:,2)';USSV1530(:,2)';]';


% 20Y  expiry
USSV201= history(connection,'USSV201 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV202= history(connection,'USSV202 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV203= history(connection,'USSV203 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV204= history(connection,'USSV204 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV205= history(connection,'USSV205 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV206= history(connection,'USSV206 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV207= history(connection,'USSV207 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV208= history(connection,'USSV208 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV209= history(connection,'USSV209 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV2010 = history(connection,'USSV2010 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV2012 = history(connection,'USSV2012 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV2015 = history(connection,'USSV2015 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV2020 = history(connection,'USSV2020 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV2025 = history(connection,'USSV2025 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV2030 = history(connection,'USSV2030 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_20Y = [USSV201(:,2)';USSV202(:,2)';USSV203(:,2)';USSV204(:,2)';USSV205(:,2)';USSV206(:,2)';USSV207(:,2)';...
                 USSV208(:,2)';USSV209(:,2)';USSV2010(:,2)';NaN;USSV2015(:,2)';USSV2020(:,2)';USSV2025(:,2)';USSV2030(:,2)';]';

% 25Y  expiry
USSV251= history(connection,'USSV251 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV252= history(connection,'USSV252 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV253= history(connection,'USSV253 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV254= history(connection,'USSV254 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV255= history(connection,'USSV255 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV256= history(connection,'USSV256 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV257= history(connection,'USSV257 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV258= history(connection,'USSV258 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV259= history(connection,'USSV259 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV2510 = history(connection,'USSV2510 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV2512 = history(connection,'USSV2512 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV2515 = history(connection,'USSV2515 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV2520 = history(connection,'USSV2520 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV2525 = history(connection,'USSV2525 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV2530 = history(connection,'USSV2530 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

libor_vol_25Y = [USSV251(:,2)';USSV252(:,2)';USSV253(:,2)';USSV254(:,2)';USSV255(:,2)';USSV256(:,2)';USSV257(:,2)';...
                 USSV258(:,2)';USSV259(:,2)';USSV2510(:,2)';NaN;USSV2515(:,2)';USSV2520(:,2)';USSV2525(:,2)';USSV2530(:,2)';]';

% 30Y  expiry
USSV301= history(connection,'USSV301 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV302= history(connection,'USSV302 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV303= history(connection,'USSV303 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV304= history(connection,'USSV304 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV305= history(connection,'USSV305 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV306= history(connection,'USSV306 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV307= history(connection,'USSV307 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV308= history(connection,'USSV308 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV309= history(connection,'USSV309 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV3010 = history(connection,'USSV3010 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
%USSV3012 = history(connection,'USSV3012 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV3015 = history(connection,'USSV3015 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV3020 = history(connection,'USSV3020 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV3025 = history(connection,'USSV3025 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});
USSV3030 = history(connection,'USSV3030 Curncy','Last_Price',begin_date, end_date, {'daily','non_trading_weekdays','previous_value'});

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









