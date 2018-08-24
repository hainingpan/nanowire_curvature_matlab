function re=maxsdse(mu,delta,alpha)
t=25;
delta0=.3;
vzm=((-alpha^2+2*t*mu)*sqrt(delta^2+mu^2)+sqrt(4*t*mu*alpha^2*(mu^2-delta^2)+(alpha^4+4*t^2*mu^2)*(delta^2+mu^2)))/(4*t*mu);
vzstep=0.01;
vzset=0:vzstep:vzm;
vzset2=0:vzstep/100:vzm;
en=zeros(length(vzset),1);
parfor i=1:length(vzset)
    vz=vzset(i);
    en(i)=iter(1, mu, delta0, vz, alpha, , 300);
end
pp=interp1(vzset,en,'spline','pp');
pp_der=fnder(pp,2);
slopes=ppval(pp_der,vzset2);
re=max(slopes);
end
