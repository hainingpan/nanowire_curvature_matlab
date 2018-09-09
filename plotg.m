mulist=0:.001:.4;
vzlist=0:.005:.7;
en=zeros(length(mulist),length(vzlist)-1);
parfor muindex=1:length(mulist)
    mu=mulist(muindex);
    [~,en2]=g(mu,.2,2);
    en(muindex,:)=en2;
end
save('en.dat','en','-ascii')