function [vol_cap_libor_SMKR,vol_cap_libor_BBIR,snapshot_time1] = get_realtime_capvol();
%[vol_cap_libor_SMKR,vol_cap_libor_BBIR,snapshot_time1] = get_realtime_capvol(); 
% First establish the data connection to bloomberg;
connection = blp;

c = clock;
snapshot_time1 = datestr(c);

%% Get the USD SWAP MUNI % of LIBOR
USSML1= getdata(connection,'USFV1 Curncy','last_price');
%USSML1= getdata(connection,'USFV1 Curncy');
USSML2= getdata(connection,'USFV2 BBIR Index','last_price');
USSML3= getdata(connection,'USFV3 BBIR Index','last_price');
USSML4= getdata(connection,'USFV4 BBIR Index','last_price');
USSML5= getdata(connection,'USFV5 BBIR Index','last_price');
USSML7= getdata(connection,'USCV7 BBIR Index','last_price');
USSML10 = getdata(connection,'USFV10 BBIR Index','last_price');
USSML12 = getdata(connection,'USCFA12 BBIR Index','last_price');
USSML15 = getdata(connection,'USFV15 BBIR Index','last_price');
USSML20 = getdata(connection,'USFV20 BBIR Index','last_price');
USSML25 = getdata(connection,'USCV25 BBIR Index','last_price');
USSML30 = getdata(connection,'USFV30 BBIR Index','last_price');

%USSML1= getdata(connection,'USFV1 SMKT Curncy');
%USSML2= getdata(connection,'USFV2 SMKT Curncy');
%USSML3= getdata(connection,'USFV3 SMKT Curncy');
%USSML4= getdata(connection,'USFV4 SMKT Curncy');
%USSML5= getdata(connection,'USFV5 SMKT Curncy');
%USSML7= getdata(connection,'USCV7 BBIR Index');
%USSML10 = getdata(connection,'USFV10 SMKT Curncy');
%USSML12 = getdata(connection,'USCFA12 Index');
%USSML15 = getdata(connection,'USFV15 SMKT Curncy');
%USSML20 = getdata(connection,'USFV20 SMKT Curncy');
%USSML25 = getdata(connection,'USCV25 BBIR Index');
%USSML30 = getdata(connection,'USFV30 SMKT Curncy');

%ddate_string = datestr(USSML1(:,1));

vol_cap_libor_SMKR = [USSML1.last_price;USSML2.last_price;USSML3.last_price;USSML4.last_price;USSML5.last_price;USSML7.last_price;...
               USSML10.last_price;USSML12.last_price;USSML15.last_price;USSML20.last_price;USSML25.last_price;USSML30.last_price;]';

USSML1= getdata(connection,'USCV1 BBIR Index','last_price');
USSML2= getdata(connection,'USCV2 BBIR Index','last_price');
USSML3= getdata(connection,'USCV3 BBIR Index','last_price');
USSML4= getdata(connection,'USCV4 BBIR Index','last_price');
USSML5= getdata(connection,'USCV5 BBIR Index','last_price');
USSML7= getdata(connection,'USCV7 BBIR Index','last_price');
USSML10 = getdata(connection,'USCV10 BBIR Index','last_price');
USSML12 = getdata(connection,'USCFA12 BBIR Index','last_price');
USSML15 = getdata(connection,'USCV15 BBIR Index','last_price');
USSML20 = getdata(connection,'USCV20 BBIR Index','last_price');
USSML25 = getdata(connection,'USCV25 BBIR Index','last_price');
USSML30 = getdata(connection,'USCV30 BBIR Index','last_price');      

vol_cap_libor_BBIR = [USSML1.last_price;USSML2.last_price;USSML3.last_price;USSML4.last_price;USSML5.last_price;USSML7.last_price;...
               USSML10.last_price;USSML12.last_price;USSML15.last_price;USSML20.last_price;USSML25.last_price;USSML30.last_price;]';

           
 close(connection);
 









