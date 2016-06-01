function [SKEW,snapshot_time1]= get_realtime_skew();
 % [r_bma_ratio,r_bma_basis,r_bma,r_libor,libor_vol_matrix,libor_vol_interp,snapshot_time1,snapshot_time2] = get_realtime_data();

 %ddate = datenum(ddate);
%period_window = 2;

%end_date = datestr(ddate);
%begin_date = datestr(ddate-period_window);

% First establish the data connection to bloomberg;
connection = bloomberg;

c = clock;
snapshot_time1 = datestr(c);

%% Get LIBOR SKEW RAW DATA FROM BLOOMBERG
SK01Y01YN200 = fetch(connection,'USPAGS7C SMKO Curncy');
SK03M02YN200 = fetch(connection,'USP5H5U0 SMKO Curncy');
SK02Y02YN200 = fetch(connection,'USPAS72G SMKO Curncy');
SK01Y05YN200 = fetch(connection,'USPAJLC8 SMKO Curncy');
SK05Y05YN200 = fetch(connection,'USPFJE14 SMKO Curncy');
SK03M10YN200 = fetch(connection,'USP5JYYW SMKO Curncy');
SK01Y10YN200 = fetch(connection,'USPAJRNS SMKO Curncy');
SK02Y10YN200 = fetch(connection,'USPAV07C SMKO Curncy');
SK05Y10YN200 = fetch(connection,'USPFJKCO SMKO Curncy');
SK10Y10YN200 = fetch(connection,'USPFUSW8 SMKO Curncy');
SK15Y15YN200 = fetch(connection,'USPG67RC SMKO Curncy');
SK10Y20YN200 = fetch(connection,'USPFV5JC SMKO Curncy');
SK05Y30YN200 = fetch(connection,'USPFK9MW SMKO Curncy');

SK01Y01YN100 = fetch(connection,'USPAGS4K SMKO Curncy');
SK03M02YN100 = fetch(connection,'USP5H5R8 SMKO Curncy');
SK02Y02YN100 = fetch(connection,'USPAS6ZO SMKO Curncy');
SK01Y05YN100 = fetch(connection,'USPAJL9G SMKO Curncy');
SK05Y05YN100 = fetch(connection,'USPFJDYC SMKO Curncy');
SK03M10YN100 = fetch(connection,'USP5JYW4 SMKO Curncy');
SK01Y10YN100 = fetch(connection,'USPAJRL0 SMKO Curncy');
SK02Y10YN100 = fetch(connection,'USPAV04K SMKO Curncy');
SK05Y10YN100 = fetch(connection,'USPFJK9W SMKO Curncy');
SK10Y10YN100 = fetch(connection,'USPFUSTG SMKO Curncy');
SK15Y15YN100 = fetch(connection,'USPG67OK SMKO Curncy');
SK10Y20YN100 = fetch(connection,'USPFV5GK SMKO Curncy');
SK05Y30YN100 = fetch(connection,'USPFK9K4 SMKO Curncy');

SK01Y01YN050 = fetch(connection,'USPAGS36 SMKO Curncy');
SK03M02YN050 = fetch(connection,'USP5H5PU SMKO Curncy');
SK02Y02YN050 = fetch(connection,'USPAS6YA SMKO Curncy');
SK01Y05YN050 = fetch(connection,'USPAJL82 SMKO Curncy');
SK05Y05YN050 = fetch(connection,'USPFJDWY SMKO Curncy');
SK03M10YN050 = fetch(connection,'USP5JYUQ SMKO Curncy');
SK01Y10YN050 = fetch(connection,'USPAJRJM SMKO Curncy');
SK02Y10YN050 = fetch(connection,'USPAV036 SMKO Curncy');
SK05Y10YN050 = fetch(connection,'USPFJK8I SMKO Curncy');
SK10Y10YN050 = fetch(connection,'USPFUSS2 SMKO Curncy');
SK15Y15YN050 = fetch(connection,'USPG67N6 SMKO Curncy');
SK10Y20YN050 = fetch(connection,'USPFV5F6 SMKO Curncy');
SK05Y30YN050 = fetch(connection,'USPFK9IQ SMKO Curncy');

SK01Y01YN025 = fetch(connection,'USPAGS2H SMKO Curncy');
SK03M02YN025 = fetch(connection,'USP5H5P5 SMKO Curncy');
SK02Y02YN025 = fetch(connection,'USPAS6XL SMKO Curncy');
SK01Y05YN025 = fetch(connection,'USPAJL7D SMKO Curncy');
SK05Y05YN025 = fetch(connection,'USPFJDW9 SMKO Curncy');
SK03M10YN025 = fetch(connection,'USP5JYU1 SMKO Curncy');
SK01Y10YN025 = fetch(connection,'USPAJRIX SMKO Curncy');
SK02Y10YN025 = fetch(connection,'USPAV02H SMKO Curncy');
SK05Y10YN025 = fetch(connection,'USPFJK7T SMKO Curncy');
SK10Y10YN025 = fetch(connection,'USPFUSRD SMKO Curncy');
SK15Y15YN025 = fetch(connection,'USPG67MH SMKO Curncy');
SK10Y20YN025 = fetch(connection,'USPFV5EH SMKO Curncy');
SK05Y30YN025 = fetch(connection,'USPFK9I1 SMKO Curncy');

SK01Y01YN000 = fetch(connection,'USSV011 SMKO Curncy');
SK03M02YN000 = fetch(connection,'USSV0C2 SMKO Curncy');
SK02Y02YN000 = fetch(connection,'USSV022 SMKO Curncy');
SK01Y05YN000 = fetch(connection,'USSV015 SMKO Curncy');
SK05Y05YN000 = fetch(connection,'USSV055 SMKO Curncy');
SK03M10YN000 = fetch(connection,'USSV0C10 SMKO Curncy');
SK01Y10YN000 = fetch(connection,'USSV0110 SMKO Curncy');
SK02Y10YN000 = fetch(connection,'USSV0210 SMKO Curncy');
SK05Y10YN000 = fetch(connection,'USSV0510 SMKO Curncy');
SK10Y10YN000 = fetch(connection,'USSV1010 SMKO Curncy');
SK15Y15YN000 = fetch(connection,'USSV1515 SMKO Curncy');
SK10Y20YN000 = fetch(connection,'USSV1020 SMKO Curncy');
SK05Y30YN000 = fetch(connection,'USSV0530 SMKO Curncy');

SK01Y01YSTRK = fetch(connection,'USPAGPOG SMKO Curncy');
SK03M02YSTRK = fetch(connection,'USP5H3B4 SMKO Curncy');
SK02Y02YSTRK = fetch(connection,'USPAS4JK SMKO Curncy');
SK01Y05YSTRK = fetch(connection,'USPAJITC SMKO Curncy');
SK05Y05YSTRK = fetch(connection,'USPFJBI8 SMKO Curncy');
SK03M10YSTRK = fetch(connection,'USP5JWG0 SMKO Curncy');
SK01Y10YSTRK = fetch(connection,'USPAJP4W SMKO Curncy');
SK02Y10YSTRK = fetch(connection,'USPAUXOG SMKO Curncy');
SK05Y10YSTRK = fetch(connection,'USPFJHTS SMKO Curncy');
SK10Y10YSTRK = fetch(connection,'USPFUQDC SMKO Curncy');
SK15Y15YSTRK = fetch(connection,'USPG658G SMKO Curncy');
SK10Y20YSTRK = fetch(connection,'USPFV30G SMKO Curncy');
SK05Y30YSTRK = fetch(connection,'USPFK740 SMKO Curncy');

SK01Y01YP200 = fetch(connection,'USPAGRA1 SMKO Curncy');
SK03M02YP200 = fetch(connection,'USP5H4WP SMKO Curncy');
SK02Y02YP200 = fetch(connection,'USPAS655 SMKO Curncy');
SK01Y05YP200 = fetch(connection,'USPAJKEX SMKO Curncy');
SK05Y05YP200 = fetch(connection,'USPFJD3T SMKO Curncy');
SK03M10YP200 = fetch(connection,'USP5JY1L SMKO Curncy');
SK01Y10YP200 = fetch(connection,'USPAJQQH SMKO Curncy');
SK02Y10YP200 = fetch(connection,'USPAUZA1 SMKO Curncy');
SK05Y10YP200 = fetch(connection,'USPFJJFD SMKO Curncy');
SK10Y10YP200 = fetch(connection,'USPFURYX SMKO Curncy');
SK15Y15YP200 = fetch(connection,'USPG66U1 SMKO Curncy');
SK10Y20YP200 = fetch(connection,'USPFV4M1 SMKO Curncy');
SK05Y30YP200 = fetch(connection,'USPFK8PL SMKO Curncy');

SK01Y01YP100 = fetch(connection,'USPAGRAQ SMKO Curncy');
SK03M02YP100 = fetch(connection,'USP5H4XE SMKO Curncy');
SK02Y02YP100 = fetch(connection,'USPAS65U SMKO Curncy');
SK01Y05YP100 = fetch(connection,'USPAJKFM SMKO Curncy');
SK05Y05YP100 = fetch(connection,'USPFJD4I SMKO Curncy');
SK03M10YP100 = fetch(connection,'USP5JY2A SMKO Curncy');
SK01Y10YP100 = fetch(connection,'USPAJQR6 SMKO Curncy');
SK02Y10YP100 = fetch(connection,'USPAUZAQ SMKO Curncy');
SK05Y10YP100 = fetch(connection,'USPFJJG2 SMKO Curncy');
SK10Y10YP100 = fetch(connection,'USPFURZM SMKO Curncy');
SK15Y15YP100 = fetch(connection,'USPG66UQ SMKO Curncy');
SK10Y20YP100 = fetch(connection,'USPFV4MQ SMKO Curncy');
SK05Y30YP100 = fetch(connection,'USPFK8QA SMKO Curncy');

SK01Y01YP050 = fetch(connection,'USPAGRC4 SMKO Curncy');
SK03M02YP050 = fetch(connection,'USP5H4YS SMKO Curncy');
SK02Y02YP050 = fetch(connection,'USPAS678 SMKO Curncy');
SK01Y05YP050 = fetch(connection,'USPAJKH0 SMKO Curncy');
SK05Y05YP050 = fetch(connection,'USPFJD5W SMKO Curncy');
SK03M10YP050 = fetch(connection,'USP5JY3O SMKO Curncy');
SK01Y10YP050 = fetch(connection,'USPAJQSK SMKO Curncy');
SK02Y10YP050 = fetch(connection,'USPAUZC4 SMKO Curncy');
SK05Y10YP050 = fetch(connection,'USPFJJHG SMKO Curncy');
SK10Y10YP050 = fetch(connection,'USPFUS10 SMKO Curncy');
SK15Y15YP050 = fetch(connection,'USPG66W4 SMKO Curncy');
SK10Y20YP050 = fetch(connection,'USPFV4O4 SMKO Curncy');
SK05Y30YP050 = fetch(connection,'USPFK8RO SMKO Curncy');

SK01Y01YP025 = fetch(connection,'USPAGREW SMKO Curncy');
SK03M02YP025 = fetch(connection,'USP5H51K SMKO Curncy');
SK02Y02YP025 = fetch(connection,'USPAS6A0 SMKO Curncy');
SK01Y05YP025 = fetch(connection,'USPAJKJS SMKO Curncy');
SK05Y05YP025 = fetch(connection,'USPFJD8O SMKO Curncy');
SK03M10YP025 = fetch(connection,'USP5JY6G SMKO Curncy');
SK01Y10YP025 = fetch(connection,'USPAJQVC SMKO Curncy');
SK02Y10YP025 = fetch(connection,'USPAUZEW SMKO Curncy');
SK05Y10YP025 = fetch(connection,'USPFJJK8 SMKO Curncy');
SK10Y10YP025 = fetch(connection,'USPFUS3S SMKO Curncy');
SK15Y15YP025 = fetch(connection,'USPG66YW SMKO Curncy');
SK10Y20YP025 = fetch(connection,'USPFV4QW SMKO Curncy');
SK05Y30YP025 = fetch(connection,'USPFK8UG SMKO Curncy');

%% Get the skew matrix

SKEW01Y01Y = [SK01Y01YN200.LastPrice;SK01Y01YN100.LastPrice;SK01Y01YN050.LastPrice;SK01Y01YN025.LastPrice;SK01Y01YN000.LastPrice;...
              SK01Y01YP025.LastPrice;SK01Y01YP050.LastPrice;SK01Y01YP100.LastPrice;SK01Y01YP200.LastPrice;]';
          
SKEW03M02Y = [SK03M02YN200.LastPrice;SK03M02YN100.LastPrice;SK03M02YN050.LastPrice;SK03M02YN025.LastPrice;SK03M02YN000.LastPrice;...
              SK03M02YP025.LastPrice;SK03M02YP050.LastPrice;SK03M02YP100.LastPrice;SK03M02YP200.LastPrice;]';
          
SKEW02Y02Y = [SK02Y02YN200.LastPrice;SK02Y02YN100.LastPrice;SK02Y02YN050.LastPrice;SK02Y02YN025.LastPrice;SK02Y02YN000.LastPrice;...
              SK02Y02YP025.LastPrice;SK02Y02YP050.LastPrice;SK02Y02YP100.LastPrice;SK02Y02YP200.LastPrice;]';
          
SKEW01Y05Y = [SK01Y05YN200.LastPrice;SK01Y05YN100.LastPrice;SK01Y05YN050.LastPrice;SK01Y05YN025.LastPrice;SK01Y05YN000.LastPrice;...
              SK01Y05YP025.LastPrice;SK01Y05YP050.LastPrice;SK01Y05YP100.LastPrice;SK01Y05YP200.LastPrice;]';
          
SKEW05Y05Y = [SK05Y05YN200.LastPrice;SK05Y05YN100.LastPrice;SK05Y05YN050.LastPrice;SK05Y05YN025.LastPrice;SK05Y05YN000.LastPrice;...
              SK05Y05YP025.LastPrice;SK05Y05YP050.LastPrice;SK05Y05YP100.LastPrice;SK05Y05YP200.LastPrice;]';

SKEW03M10Y = [SK03M10YN200.LastPrice;SK03M10YN100.LastPrice;SK03M10YN050.LastPrice;SK03M10YN025.LastPrice;SK03M10YN000.LastPrice;...
              SK03M10YP025.LastPrice;SK03M10YP050.LastPrice;SK03M10YP100.LastPrice;SK03M10YP200.LastPrice;]';
          
SKEW01Y10Y = [SK01Y10YN200.LastPrice;SK01Y10YN100.LastPrice;SK01Y10YN050.LastPrice;SK01Y10YN025.LastPrice;SK01Y10YN000.LastPrice;...
              SK01Y10YP025.LastPrice;SK01Y10YP050.LastPrice;SK01Y10YP100.LastPrice;SK01Y10YP200.LastPrice;]';

SKEW02Y10Y = [SK02Y10YN200.LastPrice;SK02Y10YN100.LastPrice;SK02Y10YN050.LastPrice;SK02Y10YN025.LastPrice;SK02Y10YN000.LastPrice;...
              SK02Y10YP025.LastPrice;SK02Y10YP050.LastPrice;SK02Y10YP100.LastPrice;SK02Y10YP200.LastPrice;]';
          
SKEW05Y10Y = [SK05Y10YN200.LastPrice;SK05Y10YN100.LastPrice;SK05Y10YN050.LastPrice;SK05Y10YN025.LastPrice;SK05Y10YN000.LastPrice;...
              SK05Y10YP025.LastPrice;SK05Y10YP050.LastPrice;SK05Y10YP100.LastPrice;SK05Y10YP200.LastPrice;]';
          
SKEW10Y10Y = [SK10Y10YN200.LastPrice;SK10Y10YN100.LastPrice;SK10Y10YN050.LastPrice;SK10Y10YN025.LastPrice;SK10Y10YN000.LastPrice;...
              SK10Y10YP025.LastPrice;SK10Y10YP050.LastPrice;SK10Y10YP100.LastPrice;SK10Y10YP200.LastPrice;]';
          
SKEW15Y15Y = [SK15Y15YN200.LastPrice;SK15Y15YN100.LastPrice;SK15Y15YN050.LastPrice;SK15Y15YN025.LastPrice;SK15Y15YN000.LastPrice;...
              SK15Y15YP025.LastPrice;SK15Y15YP050.LastPrice;SK15Y15YP100.LastPrice;SK15Y15YP200.LastPrice;]';
          
SKEW10Y20Y = [SK10Y20YN200.LastPrice;SK10Y20YN100.LastPrice;SK10Y20YN050.LastPrice;SK10Y20YN025.LastPrice;SK10Y20YN000.LastPrice;...
              SK10Y20YP025.LastPrice;SK10Y20YP050.LastPrice;SK10Y20YP100.LastPrice;SK10Y20YP200.LastPrice;]';
          
SKEW05Y30Y = [SK05Y30YN200.LastPrice;SK05Y30YN100.LastPrice;SK05Y30YN050.LastPrice;SK05Y30YN025.LastPrice;SK05Y30YN000.LastPrice;...
              SK05Y30YP025.LastPrice;SK05Y30YP050.LastPrice;SK05Y30YP100.LastPrice;SK05Y30YP200.LastPrice;]';
          
          
SKEW = [SKEW01Y01Y;SKEW03M02Y;SKEW02Y02Y;SKEW01Y05Y;SKEW05Y05Y;SKEW03M10Y;SKEW01Y10Y;SKEW02Y10Y;SKEW05Y10Y;SKEW10Y10Y;SKEW15Y15Y;SKEW10Y20Y;SKEW05Y30Y];        

Rates = [SK01Y01YSTRK.LastPrice;SK03M02YSTRK.LastPrice;SK02Y02YSTRK.LastPrice;SK01Y05YSTRK.LastPrice;...
         SK05Y05YSTRK.LastPrice;SK03M10YSTRK.LastPrice;SK01Y10YSTRK.LastPrice;SK02Y10YSTRK.LastPrice;...
         SK05Y10YSTRK.LastPrice;SK10Y10YSTRK.LastPrice;SK15Y15YSTRK.LastPrice;SK10Y20YSTRK.LastPrice;...
         SK05Y30YSTRK.LastPrice];
     
close(connection);

term = {'01Y01Y','03M02Y','02Y02Y','01Y05Y','05Y05Y','03M10Y','01Y10Y','02Y10Y','05Y10Y','10Y10Y','15Y15Y','10Y20Y','05Y30Y'};
skew_term = {'-200 bps','-100 bps','-50 bps','-25 bps','ATM','25 bps','50 bps','100 bps','200 bps'};

ddate = snapshot_time1(1:11);
tabname = snapshot_time1(13:14);
tabname   = [tabname '00'];

filename = ['S:\Products\Research\market data\BMA Vol Hourly\LIBOR_SKEW_' ddate  '.xls'];

s = xlswrite(filename, term',tabname,'A2');
s = xlswrite(filename, skew_term,tabname,'B1');
s = xlswrite(filename, SKEW,tabname,'B2');
s = xlswrite(filename, {'ATM Rate'},tabname,'K1');
s = xlswrite(filename, Rates,tabname,'K2');










