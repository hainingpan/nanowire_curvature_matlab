data=load('test.dat');
CostFunction = @(x) cost(x(1),x(2),x(3),data);
X0 = [0.2,0.22,2];   % Starting point
lb = [0,.18,.1];
ub = [.3,.22,7];
[x,fval,exitFlag,output] = simulannealbnd(CostFunction,X0,lb,ub)