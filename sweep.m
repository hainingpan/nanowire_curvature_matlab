function re=sweep(vbg)
% fn=strcat('exp',num2str(vbg),'.dat');
fn=vbg;
data=load(fn);
gammalist=.2:.1:1;
mulist=linspace(.2,1,50);
alphalist=linspace(1,5,50);
store=zeros(length(mulist),length(alphalist),length(gammalist));
for gammaind=1:length(gammalist)
    for muind=1:length(mulist)
        for alphaind=1:length(alphalist)
            disp([muind,alphaind,gammaind])
            store(muind,alphaind,gammaind)=costse(mulist(muind),gammalist(gammaind),alphalist(alphaind),data);
        end
    end
end
save('mapstore2.mat','store');
re=store;
end
