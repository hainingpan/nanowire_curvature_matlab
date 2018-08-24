CostFunction = @(x) cost1(x);
X0=0;
lb=-2;
ub=3;
options = optimoptions(@simulannealbnd,'TemperatureFcn','temperatureboltz');
[x,fval,exitFlag,output] = simulannealbnd(CostFunction,X0,lb,ub,options)
