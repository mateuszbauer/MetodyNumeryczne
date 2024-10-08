
% Dane
x = [-5 -4 -3 -2 -1 0 1 2 3 4 5 6];
y = [1.2 1.1 0.95 1.25 1.1 1.0 2 3.1 3.9 4.4 4.6 4.61];


% m - stopień
function A = my_polyfit(x, y, m)
    M = zeros(length(x), m+1);

    for i = 1:m+1
        for j = 1:length(x)
            M(j, i) = x(j)^(i-1);
        end
    end

    A = (M'*M)\M' * y';
    A = A'; 
end

% funkcja pomocnicza, oblicza wartosc g(x) dla wielomianu ze
% wspolczynnikami A
function n = g(A, x)
    y = 0;
    for i = 1:length(A)
        y = y + A(i) * x^(i-1);
    end
    n = y;
end

% f(x) = exp(-0.1x) * [g(x)]^2
function n = f(A, x)
    n = exp(-0.1 * x) * g(A, x)^2;
end


function sum = calculate_integral(A, x1, x2)
    sum = 0;

    delta_x = 0.01;
    x = x1;

    while x < x2
        sum = sum + f(A, x) * delta_x;
        x = x + delta_x;
    end
end

% Funkcja pomocnicza rysująca wykres wielomianu o wspolczynnikach A
% x, y - dane punkty
function plot_results(A, x, y, color)
    x_plot = linspace(min(x)-3, max(x)+3, 1000);
    y_plot = zeros(1, length(x_plot));
    for i = 1:length(y_plot)
        y_plot(i) = g(A, x_plot(i));
    end
    plot(x_plot, y_plot, Color=color, LineStyle='-');
    plot(x, y, 'Color', color, 'Marker', "o", 'LineStyle', 'none');
    xlim([min(x)-1 max(x)+1]);
    ylim([min(y)-1 max(y)+1])
end

degrees = [3 4 5 6 7 8 9];
integral_polyfit = zeros(1, length(degrees));
integral_my_polyfit = zeros(1, length(degrees));
colors = ['b' 'r' 'g' 'c' 'm' 'y' 'k'];

figure;
grid on;
hold on;
for i = 1:length(degrees)
    d = degrees(i);
    A = my_polyfit(x, y, d);
    plot_results(A, x, y, colors(i));
    integral_my_polyfit(i) = calculate_integral(A, -2, 2);
end
title('Moja aproksymacja');

figure;
grid on;
hold on;
for i = 1:length(degrees)
    d = degrees(i);
    A = polyfit(x, y, d);
    plot_results(flip(A), x, y, colors(i));
    integral_polyfit(i) = calculate_integral(flip(A), -2, 2);
end
title('Polyfit');


















