function [r_bma_ratio,r_bma_basis,r_bma,r_libor]= get_history_data(ddate,period_window);

%[r_bma_ratio,r_bma_basis,r_bma,r_libor]= get_history_data('Oct-04-2007',30);
%ddate = datenum('Oct-02-2007');

ddate = datenum(ddate);
%period_window = 2;

end_date = datestr(ddate);
begin_date = datestr(ddate-period_window);

% First establish the data connection to bloomberg;
connection = bloomberg;

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
US0003M = fetch(connection,'US0003M Index','HISTORY','Last_Price',begin_date, end_date,'dis');
%r_bma_basis = r_bma_ratio.*repmat(US0003M(:,2),1,12)./100;

%% Get the USD SWAP Quarterly 
USSMQ1= fetch(connection,'USSMQ1 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ2= fetch(connection,'USSMQ2 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ3= fetch(connection,'USSMQ3 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ4= fetch(connection,'USSMQ4 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ5= fetch(connection,'USSMQ5 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ6= fetch(connection,'USSMQ6 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ7= fetch(connection,'USSMQ7 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ8= fetch(connection,'USSMQ8 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ9= fetch(connection,'USSMQ9 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ10 = fetch(connection,'USSMQ10 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ11 = fetch(connection,'USSMQ11 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ12 = fetch(connection,'USSMQ12 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ13 = fetch(connection,'USSMQ13 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ14 = fetch(connection,'USSMQ14 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ15 = fetch(connection,'USSMQ15 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ17 = fetch(connection,'USSMQ17 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ20 = fetch(connection,'USSMQ20 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ22 = fetch(connection,'USSMQ22 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ23 = fetch(connection,'USSMQ23 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ25 = fetch(connection,'USSMQ25 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');
USSMQ30 = fetch(connection,'USSMQ30 Curncy','HISTORY','Last_Price',begin_date, end_date,'dis');

USSMQ1(isnan(USSMQ1)) = nanmean(USSMQ1(:,2))
USSMQ2(isnan(USSMQ2)) = nanmean(USSMQ2(:,2))
USSMQ3(isnan(USSMQ3)) = nanmean(USSMQ3(:,2))
USSMQ4(isnan(USSMQ4)) = nanmean(USSMQ4(:,2))
USSMQ5(isnan(USSMQ5)) = nanmean(USSMQ5(:,2))
USSMQ6(isnan(USSMQ6)) = nanmean(USSMQ6(:,2))
USSMQ7(isnan(USSMQ7)) = nanmean(USSMQ7(:,2))
USSMQ8(isnan(USSMQ8)) = nanmean(USSMQ8(:,2))
USSMQ9(isnan(USSMQ9)) = nanmean(USSMQ9(:,2))
USSMQ10(isnan(USSMQ10)) = nanmean(USSMQ10(:,2))
USSMQ11(isnan(USSMQ11)) = nanmean(USSMQ11(:,2))
USSMQ12(isnan(USSMQ12)) = nanmean(USSMQ12(:,2))
USSMQ13(isnan(USSMQ13)) = nanmean(USSMQ13(:,2))
USSMQ14(isnan(USSMQ14)) = nanmean(USSMQ14(:,2))
USSMQ15(isnan(USSMQ15)) = nanmean(USSMQ15(:,2))
USSMQ17(isnan(USSMQ17)) = nanmean(USSMQ17(:,2))
USSMQ20(isnan(USSMQ20)) = nanmean(USSMQ20(:,2))
USSMQ22(isnan(USSMQ22)) = nanmean(USSMQ22(:,2))
USSMQ23(isnan(USSMQ23)) = nanmean(USSMQ23(:,2))
USSMQ25(isnan(USSMQ25)) = nanmean(USSMQ25(:,2))
USSMQ30(isnan(USSMQ30)) = nanmean(USSMQ30(:,2))

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











