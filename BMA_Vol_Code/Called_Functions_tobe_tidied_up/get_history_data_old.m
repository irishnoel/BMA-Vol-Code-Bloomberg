function [r_bma_ratio,r_bma_basis,r_bma,r_libor]= get_history_data(ddate,period_window);

%[r_bma_ratio,r_bma_basis,r_bma,r_libor]= get_history_data('Oct-04-2007',30);
%ddate = datenum('Oct-02-2007');

ddate = datenum(ddate);
%period_window = 2;

end_date = datestr(ddate);
begin_date = datestr(ddate-period_window);

% First establish the data connection to bloomberg;
connection = blp;

%% Get the USD SWAP MUNI % of LIBOR
USSML1= history(connection,'USSML1 PREB Curncy','Last_Price',begin_date, end_date, {'daily','nil_value'});
USSML2= history(connection,'USSML2 PREB Curncy','Last_Price',begin_date, end_date);
USSML3= history(connection,'USSML3 PREB Curncy','Last_Price',begin_date, end_date);
USSML4= history(connection,'USSML4 PREB Curncy','Last_Price',begin_date, end_date);
USSML5= history(connection,'USSML5 PREB Curncy','Last_Price',begin_date, end_date);
USSML7= history(connection,'USSML7 PREB Curncy','Last_Price',begin_date, end_date);
USSML10 = history(connection,'USSML10 PREB Curncy','Last_Price',begin_date, end_date);
USSML12 = history(connection,'USSML12 PREB Curncy','Last_Price',begin_date, end_date);
USSML15 = history(connection,'USSML15 PREB Curncy','Last_Price',begin_date, end_date);
USSML20 = history(connection,'USSML20 PREB Curncy','Last_Price',begin_date, end_date);
USSML25 = history(connection,'USSML25 Curncy','Last_Price',begin_date, end_date);
USSML30 = history(connection,'USSML30 PREB Curncy','Last_Price',begin_date, end_date);

ddate_string = datestr(USSML1(:,1));


USSML1(isnan(USSML1)) = nanmean(USSML1(:,2))
USSML2(isnan(USSML2)) = nanmean(USSML2(:,2))
USSML3(isnan(USSML3)) = nanmean(USSML3(:,2))
USSML4(isnan(USSML4)) = nanmean(USSML4(:,2))
USSML5(isnan(USSML5)) = nanmean(USSML5(:,2))
USSML7(isnan(USSML7)) = nanmean(USSML7(:,2))
USSML10(isnan(USSML10)) = nanmean(USSML10(:,2))
USSML12(isnan(USSML12)) = nanmean(USSML12(:,2))
USSML15(isnan(USSML15)) = nanmean(USSML15(:,2))
USSML20(isnan(USSML20)) = nanmean(USSML20(:,2))
USSML25(isnan(USSML25)) = nanmean(USSML25(:,2))
USSML30(isnan(USSML30)) = nanmean(USSML30(:,2))


r_bma_ratio = [USSML1(:,2)';USSML2(:,2)';USSML3(:,2)';USSML4(:,2)';USSML5(:,2)';USSML7(:,2)';...
               USSML10(:,2)';USSML12(:,2)';USSML15(:,2)';USSML20(:,2)';USSML25(:,2)';USSML30(:,2)';]';
US0003M = history(connection,'US0003M Index','Last_Price',begin_date, end_date);
%r_bma_basis = r_bma_ratio.*repmat(US0003M(:,2),1,12)./100;

%% Get the USD SWAP Quarterly 
USSMQ1= history(connection,'USSMQ1 Curncy','Last_Price',begin_date, end_date);
USSMQ2= history(connection,'USSMQ2 Curncy','Last_Price',begin_date, end_date);
USSMQ3= history(connection,'USSMQ3 Curncy','Last_Price',begin_date, end_date);
USSMQ4= history(connection,'USSMQ4 Curncy','Last_Price',begin_date, end_date);
USSMQ5= history(connection,'USSMQ5 Curncy','Last_Price',begin_date, end_date);
%USSMQ6= history(connection,'USSMQ6 Curncy','Last_Price',begin_date, end_date);
USSMQ7= history(connection,'USSMQ7 Curncy','Last_Price',begin_date, end_date);
%USSMQ8= history(connection,'USSMQ8 Curncy','Last_Price',begin_date, end_date, {'daily','active_days_only','previous_value'});
%USSMQ9= history(connection,'USSMQ9 Curncy','Last_Price',begin_date, end_date);
USSMQ10 = history(connection,'USSMQ10 Curncy','Last_Price',begin_date, end_date);
%USSMQ11 = history(connection,'USSMQ11 Curncy','Last_Price',begin_date, end_date);
USSMQ12 = history(connection,'USSMQ12 Curncy','Last_Price',begin_date, end_date);
%USSMQ13 = history(connection,'USSMQ13 Curncy','Last_Price',begin_date, end_date);
%USSMQ14 = history(connection,'USSMQ14 Curncy','Last_Price',begin_date, end_date);
USSMQ15 = history(connection,'USSMQ15 Curncy','Last_Price',begin_date, end_date);
%USSMQ17 = history(connection,'USSMQ17 Curncy','Last_Price',begin_date, end_date);
USSMQ20 = history(connection,'USSMQ20 Curncy','Last_Price',begin_date, end_date);
%USSMQ22 = history(connection,'USSMQ22 Curncy','Last_Price',begin_date, end_date);
%USSMQ23 = history(connection,'USSMQ23 Curncy','Last_Price',begin_date, end_date);
USSMQ25 = history(connection,'USSMQ25 Curncy','Last_Price',begin_date, end_date, {'daily','previous_value'});
USSMQ30 = history(connection,'USSMQ30 Curncy','Last_Price',begin_date, end_date, {'daily','all_calendar_days','previous_value'});

USSMQ1(isnan(USSMQ1)) = nanmean(USSMQ1(:,2))
USSMQ2(isnan(USSMQ2)) = nanmean(USSMQ2(:,2))
USSMQ3(isnan(USSMQ3)) = nanmean(USSMQ3(:,2))
USSMQ4(isnan(USSMQ4)) = nanmean(USSMQ4(:,2))
USSMQ5(isnan(USSMQ5)) = nanmean(USSMQ5(:,2))
%USSMQ6(isnan(USSMQ6)) = nanmean(USSMQ6(:,2))
USSMQ7(isnan(USSMQ7)) = nanmean(USSMQ7(:,2))

%USSMQ8(isnan(USSMQ8)) = nanmean(USSMQ8(:,2))
%USSMQ9(isnan(USSMQ9)) = nanmean(USSMQ9(:,2))
USSMQ10(isnan(USSMQ10)) = nanmean(USSMQ10(:,2))
%USSMQ11(isnan(USSMQ11)) = nanmean(USSMQ11(:,2))
USSMQ12(isnan(USSMQ12)) = nanmean(USSMQ12(:,2))
%USSMQ13(isnan(USSMQ13)) = nanmean(USSMQ13(:,2))
%USSMQ14(isnan(USSMQ14)) = nanmean(USSMQ14(:,2))
USSMQ15(isnan(USSMQ15)) = nanmean(USSMQ15(:,2))
%USSMQ17(isnan(USSMQ17)) = nanmean(USSMQ17(:,2))
USSMQ20(isnan(USSMQ20)) = nanmean(USSMQ20(:,2))
%USSMQ22(isnan(USSMQ22)) = nanmean(USSMQ22(:,2))
%USSMQ23(isnan(USSMQ23)) = nanmean(USSMQ23(:,2))
USSMQ25(isnan(USSMQ25)) = nanmean(USSMQ25(:,2))
USSMQ30(isnan(USSMQ30)) = nanmean(USSMQ30(:,2))

r_bma = [USSMQ1(:,2)';USSMQ2(:,2)';USSMQ3(:,2)';USSMQ4(:,2)';USSMQ5(:,2)';USSMQ7(:,2)';...
         USSMQ10(:,2)';USSMQ12(:,2)';USSMQ15(:,2)';USSMQ20(:,2)';USSMQ25(:,2)';USSMQ30(:,2)';]';

%% Get the USD LIBOR 
USSWAP1= history(connection,'USSWAP1 Curncy','Last_Price',begin_date, end_date);
USSWAP2= history(connection,'USSWAP2 Curncy','Last_Price',begin_date, end_date);
USSWAP3= history(connection,'USSWAP3 Curncy','Last_Price',begin_date, end_date);
USSWAP4= history(connection,'USSWAP4 Curncy','Last_Price',begin_date, end_date);
USSWAP5= history(connection,'USSWAP5 Curncy','Last_Price',begin_date, end_date);
USSWAP6= history(connection,'USSWAP6 Curncy','Last_Price',begin_date, end_date);
USSWAP7= history(connection,'USSWAP7 Curncy','Last_Price',begin_date, end_date);
USSWAP8= history(connection,'USSWAP8 Curncy','Last_Price',begin_date, end_date);
USSWAP9= history(connection,'USSWAP9 Curncy','Last_Price',begin_date, end_date);
USSWAP10 = history(connection,'USSWAP10 Curncy','Last_Price',begin_date, end_date);
USSWAP12 = history(connection,'USSWAP12 Curncy','Last_Price',begin_date, end_date);
USSWAP15 = history(connection,'USSWAP15 Curncy','Last_Price',begin_date, end_date);
USSWAP20 = history(connection,'USSWAP20 Curncy','Last_Price',begin_date, end_date);
USSWAP25 = history(connection,'USSWAP25 Curncy','Last_Price',begin_date, end_date);
USSWAP30 = history(connection,'USSWAP30 Curncy','Last_Price',begin_date, end_date);

USSWAP1(isnan(USSWAP1)) = nanmean(USSWAP1(:,2))
USSWAP2(isnan(USSWAP2)) = nanmean(USSWAP2(:,2))
USSWAP3(isnan(USSWAP3)) = nanmean(USSWAP3(:,2))
USSWAP4(isnan(USSWAP4)) = nanmean(USSWAP4(:,2))
USSWAP5(isnan(USSWAP5)) = nanmean(USSWAP5(:,2))
USSWAP6(isnan(USSWAP6)) = nanmean(USSWAP6(:,2))
USSWAP7(isnan(USSWAP7)) = nanmean(USSWAP7(:,2))
USSWAP8(isnan(USSWAP8)) = nanmean(USSWAP8(:,2))
USSWAP9(isnan(USSWAP9)) = nanmean(USSWAP9(:,2))
USSWAP10(isnan(USSWAP10)) = nanmean(USSWAP10(:,2))
USSWAP12(isnan(USSWAP12)) = nanmean(USSWAP12(:,2))
USSWAP15(isnan(USSWAP15)) = nanmean(USSWAP15(:,2))
USSWAP20(isnan(USSWAP20)) = nanmean(USSWAP20(:,2))
USSWAP25(isnan(USSWAP25)) = nanmean(USSWAP25(:,2))
USSWAP30(isnan(USSWAP30)) = nanmean(USSWAP30(:,2))







r_libor = [USSWAP1(:,2)';USSWAP2(:,2)';USSWAP3(:,2)';USSWAP4(:,2)';USSWAP5(:,2)';USSWAP7(:,2)';...
           USSWAP10(:,2)';USSWAP12(:,2)';USSWAP15(:,2)';USSWAP20(:,2)';USSWAP25(:,2)';USSWAP30(:,2)';]';

r_bma_basis = r_bma_ratio.*r_libor./100;       
 close(connection);











