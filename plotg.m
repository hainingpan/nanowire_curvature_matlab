mulist=0:.01:.4;
en=zeros(length(mulist),100);
parfor muindex=1:length(mulist)
    mu=mulist(muindex);
    [~,en2]=g(mu,.2,2);
    en(muindex,:)=en2;
end
save('en2.dat','en','-ascii')