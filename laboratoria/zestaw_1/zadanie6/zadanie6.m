

a = 0;
b = 0.8;
n = 4;
x = linspace(a, b, n+1);
h = (b-a)/n;
alpha = 4.02;
beta = -2.62;

y = [-1.79 -2.26 -1.59];

c = zeros(1, length(x));

A = [4 2 0; 1 4 1; 0 2 4];


c(2:4) = A \ [y(1)+(h*alpha)/3 y(2) y(3)-(h*beta)/3]';
c(1) = c(3) - (h*alpha)/3;
c(5) = c(3) + (h*beta)/3;


function y = phi(x)
    if x < 0
        y = 0;
    elseif x <= 0.2
        y = x^3 / h;
    elseif x <= 0.4
        y = (x^3 - 4*(x-0.2)^3)/h;
    elseif x <= 0.6
        y = ((0.8-x)^3 - 4*(0.6-x)^3)/h;
    elseif x <= 0.8
        y = (0.8-x)^3;
    else
        y = 0;           
end



