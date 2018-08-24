mulist=0.2:0.2:.6;
deltalist=0.05:0.15:.6;
alphac=zeros(length(deltalist),length(mulist));
for i=1:length(mulist)    
    alphactmp=zeros(length(deltalist),1);
    for j=1:length(deltalist)
        mu=mulist(i);
        delta=deltalist(j);
        alphactmp(j)=j;
%         alphactmp(j)=critical_alpha(mu,delta);
%         alphac(j,i)=critical_alpha(mu,delta);
    end
    alphac(:,i)=alphactmp;
end
% save('alphac.dat','alphac','-ascii')
