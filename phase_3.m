clear all 
format long

N = 10000;
dt = 0.01;

x= zeros(2,N+1);
y = zeros(2,N+1);

t = zeros(1,N+1);
x(1,1) = 1;
y(1,1) = 2;
x(2,1) = 1;
y(2,1) = 3;
t(1) = 0; 

for i = 1:2
for j = 1:N
    t(j+1) = t(j) +dt ;
    k1 = dt*eqf1(x(i,j),y(i,j));
    l1 = dt*eqf2(x(i,j),y(i,j));
    k2 = dt*eqf1(x(i,j)+ 0.5*k1,y(i,j)+0.5*l1);
    l2 = dt*eqf2(x(i,j)+0.5*k1,y(i,j)+0.5*l1);
    k3 = dt*eqf1(x(i,j)+ 0.5*k2,y(i,j)+0.5*l2);
    l3 = dt*eqf2(x(i,j)+0.5*k2,y(i,j)+0.5*l2);
    k4 = dt*eqf1(x(i,j)+k3,y(i,j)+l3);
    l4 = dt*eqf2(x(i,j)+k3,y(i,j)+l3);
    x(i,j+1) = x(i,j) + (k1+2*k2 +2*k3+k4)/6 ;
    y(i,j+1) = y(i,j) + (l1+2*l2 +2*l3+l4)/6 ;
end
end

hold on ;
plot(x(1,:),y(1,:),'-b','LineWidth',2);
plot(x(2,:),y(2,:),'-b','LineWidth',2);