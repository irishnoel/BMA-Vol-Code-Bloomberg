connection = bloomberg;

c = datestr(now);
begin_date = 'Jan-01-2000';
end_date = c(1:11);

%% Get the historical data
%cfc = fetch(connection,'CFC Equity','HISTORY','Last_Price',begin_date, end_date,'dis');
%gs = fetch(connection,'GS Equity','HISTORY','Last_Price',begin_date, end_date,'dis');
%bsc = fetch(connection,'BSC Equity','HISTORY','Last_Price',begin_date, end_date,'dis');
%intc = fetch(connection,'INTC Equity','HISTORY','Last_Price',begin_date, end_date,'dis');
%kbh = fetch(connection,'KBH Equity','HISTORY','Last_Price',begin_date, end_date,'dis');
%mrk = fetch(connection,'MRK Equity','HISTORY','Last_Price',begin_date, end_date,'dis');
%leh = fetch(connection,'LEH Equity','HISTORY','Last_Price',begin_date, end_date,'dis');
%goog = fetch(connection,'GOOG Equity','HISTORY','Last_Price',begin_date, end_date,'dis');
%mer = fetch(connection,'MER Equity','HISTORY','Last_Price',begin_date, end_date,'dis');

dia = fetch(connection,'DIA Equity','HISTORY','Last_Price',begin_date,end_date,'dis');

gold = fetch(connection,'GOLDS Comdty','HISTORY','Last_Price',begin_date,end_date,'dis');

USSML1= fetch(connection,'GOLDS Comdty');

close(connection);