clear all
clc
format long

m = 2;
x(1) = 0.2;
for j = 1:10 
    x(j+1) = m*x(j)*(1-x(j));
end
for j = 1:10 
    X(2*j-1)= x(j);
    X(2*j) = x(j);
end
Y(1) = 0;
Y(2) = x(2);
for j = 2:10 
    Y(2*j-1) = x(j);
    Y(2*j) = x(j+1);
end
plot(X,Y,'b-','LineWidth',2)


for equilb
xx = 0:0.01:1;
yy = m*xx.*(1-xx);
plot(xx,xx,'k-',xx,yy,'r-',X,Y,'b-',"LineWidth",2)
