function r=mainseerrorbar(vbg)
para=load('parameters.dat');
fn=strcat('exp',num2str(vbg),'.dat');
data=load(fn);
mu0=para(para(:,1)==-vbg,2);
err=.1;
muub=mu0*(1+err);
mulb=mu0*(1-err);
CostFunction = @(x) costse(muub,x(1),x(2),data);
X0 =[0.6,2,1];   % Starting point
lb = [.2,.1,0.5];
ub = [1.1,6,2];
[xub,fvalub,exitFlagub,outputub] = simulannealbnd(CostFunction,X0,lb,ub);

CostFunction = @(x) costse(mulb,x(1),x(2),data);
X0 =[0.6,2,1];   % Starting point
lb = [.2,.1,0.5];
ub = [1.1,6,2];
[xlb,fvallb,exitFlaglb,outputlb] = simulannealbnd(CostFunction,X0,lb,ub);
disp(num2str(vbg));
r=[xub(1),muub,xub(2),fvalub,exitFlagub;xlb(1),mulb,xlb(2),fvallb,exitFlaglb];
save(strcat('mu',num2str(vbg),'.dat'),'r','-ascii');
end
