

a = 0.2;
b = 0.6;
n = 2;
h = (b-a)/n;
x = linspace(a-h, b+h, n+3);
alpha = 4.02;
beta = -2.62;

y = [-1.79 -2.26 -1.59];

c = zeros(1, length(x));

A = [4 2 0; 1 4 1; 0 2 4];


c(2:4) = A \ [y(1)+(h*alpha)/3 y(2) y(3)-(h*beta)/3]';
c(1) = c(3) - (h*alpha)/3;
c(5) = c(3) + (h*beta)/3;



function y = phi(x, xi, h)
    if x >= xi-2*h && x < xi-h
        y = (x-(xi-2*h))^3;
    elseif x >= xi-h && x < xi
        y = (x-(xi-2*h))^3 - 4 * (x-(xi-h))^3;
    elseif x >= xi && x < xi+h
        y = (xi+2*h-x)^3 - 4 * (xi+h -x)^3;
    elseif x >= xi+h && x < xi+2*h
        y = (xi+2*h - x)^3;
    else 
        y = 0;
    end
    y = y / h^3;
end


xp = linspace(a-h, b+h, 100);
hold on;
for i = 1:5
    xi = x(i);
    yp = zeros(1, length(xp));
    for j = 1:length(xp)
        yp(j) = phi(xp(j), xi, h);
    end
    xline(xi, '--', {sprintf('x_{%d}',i)});
    plot(xp, yp);
end
xlim([a-h*2 b+h*2]);
ylim([-4 5]);

function y = S3(x, c, h)
    xi = linspace(0, 0.8, 5);
    y = c(1) * phi(x, xi(1), h) + c(2)*phi(x,xi(2),h) + c(3)*phi(x,xi(3),h) + c(4)*phi(x,xi(4),h) + c(5)*phi(x,xi(5),h);
end


yp = zeros(1, length(xp));
for j = 1:length(yp)
    yp(j) = S3(xp(j), c, h);
end
plot(xp, yp, 'b--');
plot([0.2 0.4 0.6], [-1.79 -2.26 -1.59], Marker='o', LineStyle='none');


w = S3(0.23, c, h)
