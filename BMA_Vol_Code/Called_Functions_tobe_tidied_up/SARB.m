%Based on paper http://www.cam.wits.ac.za/mfinance/MIF2005/WestGraeme.pdf
%Calibrates alpha,beta,rho,nu parameters using input data of market volatilities 


global alpha;
global beta;
global rho;
global nu;
global T;
global S;
global r;

%Input structure is => Option Maturity in Years/ Strike/ Market Implied Volatility
%Can also be captured by copying data from the "FilteredVols" tab after running 
%the spreadsheet in 
%http://www.quantcode.com/modules/mydownloads/singlefile.php?cid=4&lid=21
MarketVols =[ 0.078159208	17.5	0.301583868
0.078159208	20	0.201447616
0.078159208	22.5	0.220948553
0.078159208	25	0.23549825
0.078159208	27.5	0.2486896
0.078159208	30	0.324493656
0.078159208	32.5	0.403817284
0.078159208	35	0.483435636
0.155936986	20	0.210161933
0.155936986	22.5	0.222087424
0.155936986	25	0.233066825
0.330936986	15	0.21180501
0.330936986	17.5	0.180375454
0.330936986	20	0.229704745
0.330936986	22.5	0.224653066
0.330936986	25	0.227730867
0.330936986	27.5	0.247948521
0.330936986	30	0.253125437
0.583714763	12	0.189364483
0.583714763	15	0.191274402
0.583714763	17	0.281503481
0.583714763	19.5	0.245027399
0.583714763	20	0.257848499
0.583714763	22	0.236848105
0.583714763	22.5	0.227914327
0.583714763	24.5	0.216856504
0.583714763	25	0.219983068
0.583714763	27	0.22837342
0.583714763	27.5	0.246474212
0.583714763	29.5	0.272338761
0.583714763	30	0.199876919
0.583714763	32	0.224147155
0.583714763	32.5	0.231541911
0.583714763	34.5	0.261338031
0.583714763	37	0.276211129
1.594825874	15	0.162305941
1.594825874	17.5	0.258846518
1.594825874	20	0.263133102
1.594825874	22.5	0.236210295
1.594825874	25	0.232628918
1.594825874	27.5	0.235588897
1.594825874	30	0.258063975
1.594825874	35	0.309336316
1.594825874	40	0.35279458
2.605936986	15	0.143015179
2.605936986	20	0.247611421
2.605936986	22.5	0.24800302
2.605936986	25	0.253382647
2.605936986	30	0.264097506];


t=MarketVols(:,1:2);
data=MarketVols(:,3);
wt1 = (1 + 0) ./ sqrt (data); 
F = @leasqrfunc;
dFdp = @dfdp;     % estimated derivative
dp = [0.001; 0.001; 0.001; 0.001];
pin = [alpha; beta; rho; nu]; 
stol=0.001; niter=50;
minstep = [0.01; 0.01; 0.01; 0.01];
maxstep = [0.8; 0.8; 0.8; 0.8];
options = [minstep, maxstep];
global verbose;
verbose=0;

 [f1, p1, kvg1, iter1, corp1, covp1, covr1, stdresid1, Z1, r21] = leasqr(t, data, pin, F, stol, niter, wt1, dp, dFdp, options);

%----------Check resulting surface

alpha=p1(1)
beta=p1(2)
rho=p1(3)
nu=p1(4)

X=S-10:S+10;
X=X';
Tvec=0.1:1.5;
Tvec=Tvec';
outmat=zeros(size(X),size(Tvec));
for i=1:size(Tvec),
	T=Tvec(i);
	F=exp(r*T)*S;
	outmat(:,i)=SABRsigma(X,F);
end
surf(outmat);

	