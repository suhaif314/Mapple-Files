clear all ;
format long ;

itermax = 500;

finalits = 100;
%final number of iterates to be plot
min = itermax -9;
finits = itermax - (finalits-1);
alpha = 8 ;

for beta = -1:0.001:1
    x = 0;
    xo = x;
    for n = 1:itermax   
        xn = exp(-alpha*xo^2) + beta ;
        x = [x xn];
        xo = xn;
    end
    % r*ones(finalits) does a 30 dim of r against it .
    plot(beta*ones(finalits),x(finits:itermax),'.','MarkerSize',5);
    hold on 
end

fsize = 50;

set(gca,'xtick',[-1 1],'FontSize',fsize);
set(gca,'ytick',[-1 1],'FontSize',fsize);

xlabel('{\beta}','FontSize',fsize);
ylabel('\it x','FontSize',fsize);

