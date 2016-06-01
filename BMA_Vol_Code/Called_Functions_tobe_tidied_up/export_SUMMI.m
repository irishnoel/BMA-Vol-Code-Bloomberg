function export_SUMMI(vol_matrix_summit,snapshot_time);
%% translate the date and time information
ddate = snapshot_time(1:11);
ddate1 = datestr(ddate,'ddmmyyyy');
ddate2 = datestr(snapshot_time,'dd.mm.yyyy HH:MM');
ddate3 = datestr(snapshot_time,'yyyymmdd_HH');
ddatenum = int2str(datenum(ddate) - 693960);

dtime = snapshot_time(12:end);
dtime1 = datestr(dtime,'HHMMSS');
dtime2 = datestr(dtime,'HHMM');

tenor = {'3M','6M','1Y','2Y','3Y','4Y','5Y','6Y','7Y','8Y','9Y','10Y','15Y','20Y','25Y','30Y'};
expiry =  {'1W','1M','2M','3M','6M','9M','1Y','2Y','3Y','4Y','5Y','6Y','7Y','8Y','9Y','10Y','15Y','20Y','25Y','30Y'};
vol_matrix_summit(8,:) = [];

filename = ['S:\Products\Research\market data\BMA Vol Hourly\swaptionvol.market_import_bma_' ddate3  '.dat'];
fid = fopen(filename,'w');

fprintf(fid,'#\r\n');
fprintf(fid,'#   SWAPTION  VOLS\r\n');
fprintf(fid,'#   TODAY (DDMMCCYY)\t%s\r\n',ddate1);
fprintf(fid,'#   SNAPSHOT DATE\t%s\r\n',ddatenum);
fprintf(fid,'#   DD.MM.CCYY HH:MM\t%s\r\n',ddate2);
fprintf(fid,'# \r\n');

%% export the vol
for i=1:1:16 %%        
    fprintf(fid,'IRFWDVOL	USD	BMA	SWOPT\t%s\r\n',tenor{i});
    fprintf(fid,'DATE\t%s\r\n',ddatenum);
    fprintf(fid,'ID\r\n');
    for j = 1:1:20
        fprintf(fid,'%s\t%6.4f\r\n',expiry{j},vol_matrix_summit(j,i)./100);   
    end;
    fprintf(fid,'\r\n');
end;
fclose(fid); 






