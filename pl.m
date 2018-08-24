% figure;
% plot(vzlist,rs);
% hold on;
% plot(vzlist,abs(en));

list=linspace(0,.2,100);
rss=zeros(length(list),1);
for i=1:length(list)
    rss(i)=w(list(i));
end
    