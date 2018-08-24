function re=cost(mu,delta,alpha,expdata)
vzm=1.2*sqrt(mu^2+delta^2);
vzstep=0.005;
vzset=0:vzstep:vzm;
en=zeros(length(vzset),1);
% vz=.17;
parfor i=1:length(vzset)    
    vz=vzset(i);
    ham=hc(1,mu,delta,vz,alpha,300);    
   try 
       eigo=eigs(ham,1,'SM');     
        if (prod(isnan(eigo))==1)
            error("1 is not enough");
        end
   catch            
       try 
           eigo=eigs(ham,20,'SM');
            if (prod(isnan(eigo))==1)
                 error("20 is not enough");
            end
       catch
           eigo=eigs(ham,40,'SM');
            if (prod(isnan(eigo))==1)
                error("40 is not enough");
            end
       end
    end  
    en(i)=min(abs(eigo));
end

p=[en,vzset'];
p2=isnan(p);
p3=[p2(:,1),p2(:,1)];
p(p3)=[];
p=reshape(p,[],2);
en=p(:,1);
vzset=p(:,2);

hrzcor=interp1(en,vzset,-expdata(:,2),'spline','extrap');
hrzcor(isnan(hrzcor))=0;
len=length(expdata);
re=sum(abs(hrzcor/hrzcor(floor(len/2))-expdata(:,1)/expdata(floor(len/2),1)));
% if (isnan(re)) 
%     error("no");
% end
fprintf("mu=%f,delta=%f,alpha=%f,cost=%f\n",mu,delta,alpha,re);
end
