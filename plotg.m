mulist=0:.01:.4;
vzlist=0:.01:.7;
en=zeros(length(mulist),length(vzlist));
parfor muindex=1:length(mulist)
    mu=mulist(muindex);
    [~,en2]=g(mu,.2,2);
    en(muindex,:)=en2;
end
save('en.dat','en','-ascii')