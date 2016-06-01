function vol_matrix_summit = using_cap_vol(r_bma_ratio1,vol_matrix_summit);
%% Starting the over-ride for 3M column
[vol_cap_libor_SMKR,vol_cap_libor_BBIR,snapshot_time1] = get_realtime_capvol();

vol_cap_bma = vol_cap_libor_BBIR.*r_bma_ratio1./100;

%need to do a linear interpreation
cap_expiry = [1,2,3,4,5,7,10,12,15,20,25,30];
swaption_expiry = [1;1.5;2;3;4;5;6;7;8;9;10;15;20;25;30]';

vol_cap_bma_new = interp1(cap_expiry,vol_cap_bma,swaption_expiry);

vol_matrix_summit(7:21,1) = vol_cap_bma_new;