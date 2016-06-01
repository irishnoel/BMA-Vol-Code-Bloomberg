%load bma_tree_year_data;
libor_daily_change = diff(r_libor);
bma_daily_change = diff(r_bma);
bma_daily_change_libor = libor_daily_change.*r_bma_ratio(1:end-1,:)./100;
bma_daily_change_unexplained = bma_daily_change - bma_daily_change_libor;

