function [vzset,d_en]=g(mu,delta,alpha)
% vzm=sqrt(mu^2+delta^2)*1.1;
vzm=0.7;
% vzgrid=101;
% vzset=linspace(0,vzm,vzgrid);
% vzstep=vzset(2)-vzset(1);
vzstep=0.01;
vzset=0:vzstep:vzm;
en=zeros(1,length(vzset));
parfor i=1:length(vzset)
     warning('off','all');
    vz=vzset(i);
    ham=hc(1,mu,delta,vz,alpha,3000);    
    try 
       eigo=eigs(ham,2,0,'Tolerance',1e-6);     
        if (prod(isnan(eigo))==1)
            error("1 is not enough");
        end
   catch            
       try 
           eigo=eigs(ham,20,0,'Tolerance',1e-6);
            if (prod(isnan(eigo))==1)
                 error("20 is not enough");
            end
       catch
           eigo=eigs(ham,40,0,'Tolerance',1e-6);
            if (prod(isnan(eigo))==1)
                error("40 is not enough");
            end
       end
    end  
    en(i)=min(abs(eigo));
end
d_en=diff(en)/vzstep;
end
