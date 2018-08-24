function re=iter(a,mu,delta,vz,alpha_R,gamma,dim)
omega=0;
omega_n=hse(a,mu,delta,vz,alpha_R,gamma,omega,dim);
count=0;
while abs(omega_n-omega)>1e-6 && count<300
    omega=omega_n;
    count=count+1;
    omega_n=hse(a,mu,delta,vz,alpha_R,gamma,omega,dim);
end
re=omega_n;
% fprintf("mu=%f,gamma=%f,alpha=%f,cost=%f\n",mu,gamma,alpha_R,abs(re-0.2539));
end
