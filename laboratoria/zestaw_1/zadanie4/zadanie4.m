
function n = W(x)
    a1 = 890/21;
    a2 = -460/7;
    a3 = (427 + 890*0.27)/21;
    a4 = -2.8 - (890*0.018)/21;

	n = a1*x^3 + a2*x^2 + a3*x + a4;
end

x_i = [0.1 0.3 0.6 0.8];
y_i = [-1 1.2 1 1.5];

x_plot = linspace(-0.5, 1, 1000);
y_plot = zeros(1, length(x_plot));
for i = 1:length(y_plot)
    y_plot(i) = W(x_plot(i));
end

x = 0.55;
y = W(x);

grid on;
hold on;
plot(x_plot, y_plot, 'r-');
plot(x_i, y_i, 'bo');
plot(x, y, 'go');

