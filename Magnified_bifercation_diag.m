clear all ;
format long ;

itermax = 500;

finalits = 100;
%final number of iterates to be plot

finits = itermax - (finalits-1);

for r = 3:0.001:4
    x = 0.4;
    xo = x;
    for n = 2:itermax   
        xn = r*xo*(1-xo);
        x = [x xn];
        xo = xn;
    end
    % r*ones(finalits) does a 30 dim of r against it .
    plot(r*ones(finalits),x(finits:itermax),'.','MarkerSize',5);
    hold on 
end

fsize = 50;

set(gca,'xtick',[0:1:4],'FontSize',fsize);
set(gca,'ytick',[0:0.5:1],'FontSize',fsize);

xlabel('(\mu)','FontSize',fsize);
ylabel('(\it x)','FontSize',fsize);
