
function y = f(x)
    y = 1 ./ (1 + exp(1).^-x);
end

% p(x) = a_0 + a_1*x + a_3*x^3 + a_4*x^4
% A - wspolczynniki A(1) = a_0, A(2) = a_1, ...
function y = p(A, x)
    y = A(1) + A(2)*x + A(3)*x.^3 + A(4)*x.^4;
end

x = -5:5;
y = f(x);

M = zeros(length(x), 4);
M(:, 1) = 1;
M(:, 2) = x;
M(:, 3) = x.^3;
M(:, 4) = x.^4;

A = (M'*M)\M'*y';

xp = linspace(-5, 5, 1000);
yp = f(xp);
yp_approx = p(A, xp);

err = sum(abs(yp - yp_approx)) / length(xp);

hold on;
grid on;
plot(xp, yp, DisplayName='y = f(x)');
plot(xp, yp_approx, DisplayName='aproksymacja');
legend('show');


