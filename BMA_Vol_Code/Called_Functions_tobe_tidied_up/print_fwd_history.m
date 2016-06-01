function print_fwd_history(snapshot_time1,fwd_libor,fwd_bma,fwd_ratio);
swap_expiry = {'1M','3M','6M','9M','1Y','2Y','3Y','4Y','5Y','6Y','7Y','8Y','9Y','10Y','15Y','20Y','25Y','30Y'};
swap_tenor = {'1Y','2Y','3Y','4Y','5Y','7Y','10Y','12Y','15Y','20Y','25Y','30Y'};

ddate = snapshot_time1(1:11);


tabname1 = 'BMA_FWD';
tabname2 = 'LIBOR_FWD';
tabname3 = 'RATIO_FWD';


filename = ['S:\Products\Research\market data\BMA Vol Hourly\FWD_' ddate  '_EoD.xls'];

s = xlswrite(filename, swap_expiry',tabname1,'A2');
s = xlswrite(filename, swap_tenor,tabname1,'B1');
s = xlswrite(filename,fwd_bma,tabname1,'B2');

s = xlswrite(filename, swap_expiry',tabname2,'A2');
s = xlswrite(filename, swap_tenor,tabname2,'B1');
s = xlswrite(filename,fwd_libor,tabname2,'B2');

s = xlswrite(filename, swap_expiry',tabname3,'A2');
s = xlswrite(filename, swap_tenor,tabname3,'B1');
s = xlswrite(filename,fwd_ratio,tabname3,'B2');

