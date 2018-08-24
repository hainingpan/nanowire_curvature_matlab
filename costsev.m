function re=costsev(mu,gamma,alpha,g,expdata)
delta0=.34;
vzm=1.1*sqrt(mu^2+gamma^2);
vzstep=0.005;
vzc=1.2/g;                                                                                                                                        
vzset=0:vzstep:vzm;
en=zeros(length(vzset),1);
parfor i=1:length(vzset)
    vz=vzset(i);
%     delta=delta0*sqrt(1-(vz/vzc)^2)*(vz<=vzc);
    delta=delta0;
    tmp=iter(1,mu,delta,vz,alpha,gamma,75);    
    en(i)=tmp;
%     disp(i);
end
% figure;
% plot(vzset,en);


p=[en,vzset'];
p2=isnan(p);
p3=[p2(:,1),p2(:,1)];
p(p3)=[];
p=reshape(p,[],2);
en=p(:,1);
vzset=p(:,2);

hrzcor=interp1(en,g*vzset,-expdata(:,2),'spline','extrap');
hrzcor(isnan(hrzcor))=0;
re=sum(abs(hrzcor-expdata(:,1)));

fprintf("mu=%f,gamma=%f,alpha=%f,g=%f,cost=%f\n",mu,gamma,alpha,g,re);

end