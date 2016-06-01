%ddate1 = datenum(now)-365; % it is the Jan-01-2007
%ddate2 = datenum(now);

ddate1 = datenum('Feb-03-2006'); % it is the Feb-03-2007
ddate2 = datenum('Jan-01-2007');

num_dates = ddate2 - ddate1;

Hbma_vol = zeros(num_dates,18,12);
Hlibor_vol = zeros(num_dates,18,12);
Hratio_vol = zeros(num_dates,18,12);
j=1;
for i = ddate1:1:ddate2
    his_date = datestr(i);
    Busday = isbusday(his_date);
    
    if Busday == 1
    [vol_matrix_summit,bma_vol_matrix,libor_vol_matrix,bma_rates,ratio_vol,r_bma_ratio1,r_bma_basis1,r_bma1,r_libor1,ddate,snapshot_time] = bma_vol_history(his_date,90);
    his_date
    
    Hbma_vol(j,:,:) = bma_vol_matrix;
    Hlibor_vol(j,:,:) = libor_vol_matrix;
    Hratio_vol (j,:,:) = ratio_vol;
    j = j+1
    
    end
end;

vol_bma_7y20y = Hbma_vol(:,11,10);
vol_bma_9y20y = Hbma_vol(:,13,10);
vol_bma_10y15y = Hbma_vol(:,14,9);
vol_bma_10y20y = Hbma_vol(:,14,10);
vol_bma_15y10y = Hbma_vol(:,15,7);
vol_bma_15y15y = Hbma_vol(:,15,9);

vol_libor_7y20y = Hlibor_vol(:,11,10);
vol_libor_9y20y = Hlibor_vol(:,13,10);
vol_libor_10y15y = Hlibor_vol(:,14,9);
vol_libor_10y20y = Hlibor_vol(:,14,10);
vol_libor_15y10y = Hlibor_vol(:,15,7);
vol_libor_15y15y = Hlibor_vol(:,15,9);

vol_ratio_7y20y = Hratio_vol(:,11,10);
vol_ratio_9y20y = Hratio_vol(:,13,10);
vol_ratio_10y15y = Hratio_vol(:,14,9);
vol_ratio_10y20y = Hratio_vol(:,14,10);
vol_ratio_15y10y = Hratio_vol(:,15,7);
vol_ratio_15y15y = Hratio_vol(:,15,9);


