mulist=0.02:0.02:1;
deltalist=0.2:0.05:.6;
alphac=zeros(length(deltalist),length(mulist));
valc=zeros(length(deltalist),length(mulist));
for i=1:length(mulist)    
%     alphactmp=zeros(length(deltalist),1);
    for j=1:length(deltalist)
        mu=mulist(i);
        delta=deltalist(j);
%         alphactmp(j)=j;
%         alphactmp(j)=critical_alpha(mu,delta);
        fprintf("mu=%f,delta=%f\n",mu,delta);
        [alph,val]=critical_alpha(mu,delta);        
        alphac(j,i)=alph;
        valc(j,i)=val;
    end
%     alphac(:,i)=alphactmp;
end
save('alphac.dat','alphac','-ascii');
save('valc.dat','valc','-ascii');

