
% Mateusz Bauer
% nr albumu: 340776
% 76/4 = 19

function y = f1(t)
    A = 19;
    y = A * sin(A*t);
end

function y = f2(t)
    A = 19;
    y = A * exp(-t) .*cos(A*t);
end

x = linspace(0, 3.15, 1000);
y1 = f1(x);
y2 = f2(x);

hold on;
plot(x, y1, 'b-');
plot(x, y2, 'r-');
plot(x(1:5:end), y1(1:5:end), 'bo');
plot(x(1:5:end), y2(1:5:end), 'rx');

xlabel('t[s]');
xlim([0 3.5]);
xline(0.5, '--');
xline(0.15, '--');

ylabel('sin(t)');
ylim([-25 25]);
yline(-10);
yline(10);

title("Mateusz Bauer");
