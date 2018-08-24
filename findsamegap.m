delta=.3;

CostFunction = @(x)  abs(iter(1,0.1484,.3,0,2.1253,x,1000)-0.2539);
X0 = [0.6];   % Starting point
lb = [0];
ub = [1];
[x,fval,exitFlag,output] = simulannealbnd(CostFunction,X0,lb,ub)