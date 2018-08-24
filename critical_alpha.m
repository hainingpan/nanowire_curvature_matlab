function re=critical_alpha(mu,delta)
first=0;
last=5;
current=(first+last)/2;
val=maxsd(mu,delta,current);
while(abs(val)>1e-1 && first<last)
    if val>0
        first=current;
    else
        last=current;
    end
    current=(first+last)/2;
    val=maxsd(mu,delta,current);
end
re=current;
end