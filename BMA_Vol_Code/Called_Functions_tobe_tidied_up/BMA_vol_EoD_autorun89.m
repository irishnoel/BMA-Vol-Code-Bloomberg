rgstat=true;
  %The below code to make sure the End of Day run will be started 16:05
  %p.m. or later
  
  %if (Current_sec < EoD_sec)
  %    pause(EoD_sec - Current_sec)
  %end;
%t1 = datestr(now); 
  %HH = str2num(t1(13:14));
  %MM = str2num(t1(16:17));
  %SS = str2num(t1(19:20));
  %Current_sec = HH*3600 + MM*60 + SS; 
  %EoD_sec = 16*3600 +5*60;  % define the calculation time at 16:05 p.m. localtime
   
%while(stat==true) 
  t1 = datestr(now); 
  %[vol_matrix_summit,bma_vol_matrix,libor_vol_matrix,bma_rates,ratio_vol,r_bma_ratio1,r_bma_basis1,r_bma1,r_libor1,ddate,snapshot_time] = bma_vol_realtime(90);
  EoD_date = t1(1:11);
  
  % The Following line should be used if you are not running it for today
  %EoD_date = '21-Jun-2012'
  
  % Please enter the Date in the format dd-mon-yyyy. for single digit
  % dates add 0 in front. eg. 02-aug-2011 
  Busday = isbusday(EoD_date);
  
  if(Busday == 1)
  [vol_matrix_summit,bma_vol_matrix,libor_vol_matrix,bma_rates,ratio_vol,r_bma_ratio1,r_bma_basis1,r_bma1,r_libor1,ddate,snapshot_time] = bma_vol_history89(EoD_date,90);
  ddate3 = datestr(snapshot_time,'yyyymmdd');
  sourcefile = ['P:\001860_DP_USNY_Products_Research\market data\BMA Vol EoD\swaptionvol.market_import_bma_' ddate3  '.dat'];
  destinationfile = ['\\hre.loc\DFS_SHARES\001080_GE_DEMU_DEPFA_HRE_Transfer\BMAVolatility\BMAVol.BLANK.mkt'];
  %destinationfile = ['\\hre.loc\DFS_SHARES\001080_GE_DEMU_DEPFA_HRE_Transfer\bmavol_test\BMAVol.BLANK_new.mkt'];
  copyfile(sourcefile, destinationfile);
  
  sourcefile = ['P:\001860_DP_USNY_Products_Research\market data\BMA Vol EoD\swaptionvol.market_import_bma_' ddate3  '_LONDON.dat'];
  destinationfile = ['\\hre.loc\DFS_SHARES\001080_GE_DEMU_DEPFA_HRE_Transfer\BMAVolatility\BMAVol.LONDON.mkt'];
  %destinationfile = ['\\hre.loc\DFS_SHARES\001080_GE_DEMU_DEPFA_HRE_Transfer\bmavol_test\BMAVol.LONDON_new.mkt'];
  
  copyfile(sourcefile, destinationfile);
  
  display(snapshot_time);
  t2 = datestr(now);
  calculation_time = (datenum(t2) - datenum(t1))*24*3600 
  % run every day except Sat/Sun 
  end;
  %pause(3600*24-calculation_time)
%endm
