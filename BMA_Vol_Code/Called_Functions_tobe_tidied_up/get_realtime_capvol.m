function [vol_cap_libor_SMKR,vol_cap_libor_BBIR,snapshot_time1] = get_realtime_capvol();
%[vol_cap_libor_SMKR,vol_cap_libor_BBIR,snapshot_time1] = get_realtime_capvol(); 
% First establish the data connection to bloomberg;
connection = bloomberg;

c = clock;
snapshot_time1 = datestr(c);

%% Get the USD SWAP MUNI % of LIBOR
USSML1= fetch(connection,'USFV1 SMKT Curncy');
USSML2= fetch(connection,'USFV2 SMKT Curncy');
USSML3= fetch(connection,'USFV3 SMKT Curncy');
USSML4= fetch(connection,'USFV4 SMKT Curncy');
USSML5= fetch(connection,'USFV5 SMKT Curncy');
USSML7= fetch(connection,'USCV7 BBIR Index');
USSML10 = fetch(connection,'USFV10 SMKT Curncy');
USSML12 = fetch(connection,'USCFA12 BBIR Index');
USSML15 = fetch(connection,'USFV15 SMKT Curncy');
USSML20 = fetch(connection,'USFV20 SMKT Curncy');
USSML25 = fetch(connection,'USCV25 BBIR Index');
USSML30 = fetch(connection,'USFV30 SMKT Curncy');

%ddate_string = datestr(USSML1(:,1));

vol_cap_libor_SMKR = [USSML1.LastPrice;USSML2.LastPrice;USSML3.LastPrice;USSML4.LastPrice;USSML5.LastPrice;USSML7.LastPrice;...
               USSML10.LastPrice;USSML12.LastPrice;USSML15.LastPrice;USSML20.LastPrice;USSML25.LastPrice;USSML30.LastPrice;]';

USSML1= fetch(connection,'USCV1 BBIR Index');
USSML2= fetch(connection,'USCV2 BBIR Index');
USSML3= fetch(connection,'USCV3 BBIR Index');
USSML4= fetch(connection,'USCV4 BBIR Index');
USSML5= fetch(connection,'USCV5 BBIR Index');
USSML7= fetch(connection,'USCV7 BBIR Index');
USSML10 = fetch(connection,'USCV10 BBIR Index');
USSML12 = fetch(connection,'USCFA12 BBIR Index');
USSML15 = fetch(connection,'USCV15 BBIR Index');
USSML20 = fetch(connection,'USCV20 BBIR Index');
USSML25 = fetch(connection,'USCV25 BBIR Index');
USSML30 = fetch(connection,'USCV30 BBIR Index');      

vol_cap_libor_BBIR = [USSML1.LastPrice;USSML2.LastPrice;USSML3.LastPrice;USSML4.LastPrice;USSML5.LastPrice;USSML7.LastPrice;...
               USSML10.LastPrice;USSML12.LastPrice;USSML15.LastPrice;USSML20.LastPrice;USSML25.LastPrice;USSML30.LastPrice;]';

           
 close(connection);
 









