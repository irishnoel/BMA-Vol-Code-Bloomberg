stat=true;
  %The below code to make sure the End of Day run will be started 16:05
  %p.m. or later
  t1 = datestr(now);
  HH = str2num(t1(13:14));
  MM = str2num(t1(16:17));
  SS = str2num(t1(19:20));
  Current_sec = HH*3600 + MM*60 + SS; 
  EoD_sec = 16*3600 +5*60;  % define the calculation time at 16:05 p.m. localtime
  
  if (Current_sec < EoD_sec)
      pause(EoD_sec - Current_sec)
  end;

while(stat==true)
  t1 = datestr(now);
  %[vol_matrix_summit,bma_vol_matrix,libor_vol_matrix,bma_rates,ratio_vol,r_bma_ratio1,r_bma_basis1,r_bma1,r_libor1,ddate,snapshot_time] = bma_vol_realtime(90);
  EoD_date = t1(1:11);
  % EoD_date = '06-Aug-2008'
  Busday = isbusday(EoD_date);
  
  if(Busday == 1)
  [vol_matrix_summit,bma_vol_matrix,libor_vol_matrix,bma_rates,ratio_vol,r_bma_ratio1,r_bma_basis1,r_bma1,r_libor1,ddate,snapshot_time] = bma_vol_history(EoD_date,90);
  display(snapshot_time);
  t2 = datestr(now);
  calculation_time = (datenum(t2) - datenum(t1))*24*3600 
  % run every day except Sat/Sun 
  end;
  pause(3600*24-calculation_time)
end