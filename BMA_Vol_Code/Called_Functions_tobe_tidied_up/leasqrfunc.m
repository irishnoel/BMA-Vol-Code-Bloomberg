function y = leasqrfunc(x,p)
	global alpha;
	global beta;
	global rho;
	global nu;
	global T;
	global r;
	global S;
	alpha=p(1);
	beta=p(2);
	rho=p(3);
	nu=p(4);
	y=zeros(size(x,1),1);
	TimesVec=unique(x(:,1));
	for i=1:size(TimesVec),
		T=TimesVec(i);
		F=S*exp(r*T);
		idx=find(x==T);
		X=x(idx,2);
		y(idx)=SABRsigma(X,F);
	end