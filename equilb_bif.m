clear all 
format long

q = 10 ;

R = 0.2:0.01:0.8 ;

M = length(R);

for j = 1:M 
    r = R(j);
    y = roots([r  -r*q q+r -r*q]);
    n = length(y);
    hold on 
    for k = 1:n
        if imag(y(k)) == 0 && real(y(k)) >= 0
            plot(r,y(k),'b.','MarkerSize',20);
        end
    end
end