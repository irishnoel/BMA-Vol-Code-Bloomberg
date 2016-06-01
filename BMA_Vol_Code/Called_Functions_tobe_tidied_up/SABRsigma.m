%Based on eq. (13) in document
function ret=SABRsigma(X,F)
	global alpha;
	global beta;
	global rho;
	global nu;
	global T;
    
    %----------parameters setting
alpha=.5; %initial value for SABR parameter
beta=.8; %initial value for SABR parameter
rho=.5; %initial value for SABR parameter
nu=.2; %initial value for SABR parameter
S=22.2; %Spot price
r=0.04; %risk free rate
%------------------------

	z=(nu/alpha)*((F.*X).^(0.5*(1-beta))).*log(F./X);
	zhi=log(  (  ((1-2*rho*z+z.*z).^0.5) + z - rho)/(1-rho) );
	numer1= ( ((1-beta)^2)/24 )*((alpha*alpha)./((F.*X).^(1-beta)));
	numer2=.25*rho*beta*nu*alpha./((F*X).^((1-beta)/2));
	numer3=((2-3*rho*rho)/24)*nu*nu;
	numer=alpha*(1+(numer1+numer2+numer3)*T).*z;
	denom1=((1-beta)^2/24)*(log(F./X)).^2;
	denom2=(((1-beta)^4)/1920)*((log(F./X)).^4);
	denom=((F.*X).^((1-beta)/2)).*(1+denom1+denom2).*zhi;
	ret=numer./denom;
	idx=find(X==F);
	if idx>0,
		%use eqn(20) to avoid NaN problem
		numer1=(((1-beta)^2)/24)*alpha*alpha/(F^(2-2*beta));
		numer2=.25*rho*beta*nu*alpha/(F^(1-beta));
		numer3=((2-3*rho*rho)/24)*nu*nu;
		VolAtm=alpha*(1+(numer1+numer2+numer3)*T)/(F^(1-beta))
		ret(idx)=VolAtm;

	end
	



