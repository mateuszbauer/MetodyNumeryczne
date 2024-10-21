

x = [0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1];
Y = [0   0   1   1   0   0   0.5 1   1.5 0.5];

M = zeros([length(x), 7]);
M(:, 1) = 1;
M(:, 2) = cos(x);
M(:, 3) = sin(x);
M(:, 4) = cos(2*x);
M(:, 5) = sin(2*x);
M(:, 6) = cos(3*x);
M(:, 7) = sin(3*x);


A = (M'*M)\M'*Y';

% A - wspolczynniki a_0, a_1, ..., a_m
function y = Tm(A, x)
    y = A(1) + A(2)*cos(x) + A(3)*sin(x) + A(4)*cos(2*x) + A(5)*sin(2*x) + A(6)*cos(3*x) + A(7)*sin(3*x);
end


xp = linspace(0.2, 1.2, 100);
yp = zeros(1, length(xp));
for i = 1:length(xp)
    yp(i) = Tm(A, xp(i));
end

hold on;
plot(xp, yp, 'b--', DisplayName='T_m(x)');
plot(x, Y, Marker='o', LineStyle='none', DisplayName='(x_i, y_i)');
ylim([min(yp) max(yp)]);
legend('show');
xlabel('x');
ylabel('T_m(x)');
