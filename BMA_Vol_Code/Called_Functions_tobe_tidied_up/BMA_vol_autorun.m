stat=true;
while(stat==true)
  t1 = datestr(now);
  [vol_matrix_summit,bma_vol_matrix,libor_vol_matrix,bma_rates,ratio_vol,r_bma_ratio1,r_bma_basis1,r_bma1,r_libor1,ddate,snapshot_time] = bma_vol_realtime(90);
  display(snapshot_time);
  t2 = datestr(now);
  calculation_time = (datenum(t2) - datenum(t1))*24*3600 
  % run every hour
  pause(3600-calculation_time)
end