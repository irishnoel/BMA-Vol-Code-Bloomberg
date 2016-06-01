%% Credit Risk Analysis
% This model calculates the Credit value at risk. 

%% 1. Load data
% The input data is stored in spreadsheets.

clear
timeTemp = tic;
tic

% Constant values . Change Run Number for different runs.

RootDir = 'C:\Matlab_code\';
RunNumber = '';
filename = strcat(RootDir , RunNumber , 'CreditPortfolio1.xls');

mySeed = 100;		 % Set the seed
rng(mySeed);            

importanceSampllingShift = 1;

% Load original portfolio value. This is calculated within the excel
% spreadsheet.
OriginalPortfolioValue = xlsread( ...
    filename, ...
    'setup', ...
    'A1');