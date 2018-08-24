function mainse(vbg)
% fn=strcat('exp',num2str(vbg),'.dat');
fn=vbg;
data=load(fn);
CostFunction = @(x) costsev(x(1),x(2),x(3),data);
X0 = [0.2,0.6,2];   % Starting point
lb = [0,.2,.1];
ub = [1.4,1.1];
% temperature = @(x,y) y.InitialTemperature./log(x.k);

% options = optimoptions(@simulannealbnd,'TemperatureFcn','temperatureboltz');
options = optimoptions(@simulannealbnd,'TemperatureFcn',temperature,'MaxIterations',10);

[x,fval,exitFlag,output] = simulannealbnd(CostFunction,X0,lb,ub,options)
% disp(num2str(vbg));
end
