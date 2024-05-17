clear all 
format long

N = 1000;
dt = 0.01;

x= zeros(1,N+1);
y = zeros(1,N+1);

t = zeros(1,N+1);
x(1) = 1;
y(1) = 2;
t(1) = 0; 
for j = 1:N
    t(j+1) = t(j) +dt ;
    k1 = dt*eq1(x(j),y(j));
    l1 = dt*eq2(x(j),y(j));
    k2 = dt*eq1(x(j)+ 0.5*k1,y(j)+0.5*l1);
    l2 = dt*eq1(x(j)+0.5*k1,y(j)+0.5*l1);
    k3 = dt*eq1(x(j)+ 0.5*k2,y(j)+0.5*l2);
    l3 = dt*eq1(x(j)+0.5*k2,y(j)+0.5*l2);
    k4 = dt*eq1(x(j)+k3,y(j)+l3);
    l4 = dt*eq2(x(j)+k3,y(j)+l3);
    x(j+1) = x(j) + (k1+2*k2 +2*k3+k4)/6 ;
    y(j+1) = y(j) + (l1+2*l2 +2*l3+l4)/6 ;
end

plot(x,y,'-b','LineWidth',2);