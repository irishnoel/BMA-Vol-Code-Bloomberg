
%BMA VOL    BMA VOL    BMA VOL    BMA VOL    BMA VOL    BMA VOL    BMA VOL    BMA VOL


% Ensure you have the blpapi3.jar path referenced below as matlab uses it
% to connect to bloomberg




javaaddpath('C:\blp\DAPI\blpapi3.jar');
addpath(fullfile(pwd, 'Called_Functions_tobe_tidied_up'));




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
 % Busday = isbusday(EoD_date);
 
  Busday = 1;
  
    if(Busday == 1)
  [vol_matrix_summit,bma_vol_matrix,libor_vol_matrix,bma_rates,ratio_vol,r_bma_ratio1,r_bma_basis1,r_bma1,r_libor1,ddate,snapshot_time] = bma_vol_history89(EoD_date,90);
  ddate3 = datestr(snapshot_time,'yyyymmdd');
  %sourcefile = ['\\depfa.loc\dfs_shares\001890_DP_USNY_RISK_IT_Market_Risk\AutoRun_Matlab_Queries\AutoRun_Matlab_BMA\BMA_Vol_EOD\Copies_of_EOD_Runs\swaptionvol.market_import_bma_' ddate3  '.dat'];
  %destinationfile = ['\\hre.loc\DFS_SHARES\001080_GE_DEMU_DEPFA_HRE_Transfer\BMAVolatility\BMAVol.BLANK.mkt'];
  % Keep Sending data to HRE for now
  %destinationfile = ['\\hre.loc\dfs_shares\002519_GE_USNY_DP_USNY_Market_Risk_Uploaded_Files\BMAVOLS\BMAVol.BLANK.mkt'];
  %copyfile(sourcefile, destinationfile);
  
  %sourcefile = ['\\depfa.loc\dfs_shares\001890_DP_USNY_RISK_IT_Market_Risk\AutoRun_Matlab_Queries\AutoRun_Matlab_BMA\BMA_Vol_EOD\Copies_of_EOD_Runs\swaptionvol.market_import_bma_' ddate3  '_LONDON.dat'];
  %destinationfile = ['\\hre.loc\DFS_SHARES\001080_GE_DEMU_DEPFA_HRE_Transfer\BMAVolatility\BMAVol.LONDON.mkt'];
  % Keep sending data to HRE for now
  %destinationfile = ['\\hre.loc\dfs_shares\002519_GE_USNY_DP_USNY_Market_Risk_Uploaded_Files\BMAVOLS\BMAVol.LONDON.mkt'];
  %copyfile(sourcefile, destinationfile);
  
  
  % Noel K - ammended code for DEPFA EOD Split
  % May 6th 2014
  sourcefile = ['\\depfa.loc\dfs_shares\001890_DP_USNY_RISK_IT_Market_Risk\AutoRun_Matlab_Queries\AutoRun_Matlab_BMA\BMA_Vol_EOD\Copies_of_EOD_Runs\swaptionvol.market_import_bma_' ddate3  '.dat'];
  %destinationfile = ['\\hre.loc\DFS_SHARES\001080_GE_DEMU_DEPFA_HRE_Transfer\BMAVolatility\BMAVol.BLANK.mkt'];
  destinationfile = ['\\depfa.loc\DFS_SHARES\002519_GE_USNY_DP_USNY_Market_Risk_Uploaded_Files\BMAVOLS\BMAVol.BLANK.mkt'];
  copyfile(sourcefile, destinationfile);
  
  sourcefile = ['\\depfa.loc\dfs_shares\001890_DP_USNY_RISK_IT_Market_Risk\AutoRun_Matlab_Queries\AutoRun_Matlab_BMA\BMA_Vol_EOD\Copies_of_EOD_Runs\swaptionvol.market_import_bma_' ddate3  '_LONDON.dat'];
  %destinationfile = ['\\hre.loc\DFS_SHARES\001080_GE_DEMU_DEPFA_HRE_Transfer\BMAVolatility\BMAVol.LONDON.mkt'];
  destinationfile = ['\\depfa.loc\DFS_SHARES\002519_GE_USNY_DP_USNY_Market_Risk_Uploaded_Files\BMAVOLS\BMAVol.LONDON.mkt'];
  copyfile(sourcefile, destinationfile);
  
  % END OF Noel K ammendment
  
  
  display(snapshot_time);
  t2 = datestr(now);
  calculation_time = (datenum(t2) - datenum(t1))*24*3600 
  % run every day except Sat/Sun 
  end;
  %pause(3600*24-calculation_time)
%endm
