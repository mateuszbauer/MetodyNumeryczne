
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

% funkcja pomocnicza, oblicza wartosc f(x) dla wielomianu ze
% wspolczynnikami A
function n = f(A, x)
    y = 0;
    for i = 1:length(A)
        y = y + A(i) * x^(i-1);
    end
    n = y;
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
        y_plot(i) = f(A, x_plot(i));
    end
    plot(x_plot, y_plot, Color=color, LineStyle='-');
    plot(x, y, 'Color', color, 'Marker', "o", 'LineStyle', 'none');

end


degree = 4;
A1 = my_polyfit(x, y, degree);
A2 = polyfit(x, y, degree);

figure;
hold on;
grid on;
plot_results(A1, x, y, 'b');
title('Moja aproksymacja');


% polyfit zwraca wspolczynniki od najwiekszego na najmniejszego, trzeba
% obrocic
figure;
grid on;
hold on;
plot_results(flip(A2), x, y, 'r');
title('Polyfit');

%n = calculate_integral(A2, -2, 2);



degrees = [3 4 5 6 7 8 9];
integral_polyfit = zeros(1, length(degrees));
integral_my_polyfit = zeros(1, length(degrees));

for i = 1:length(degrees)
    d = degrees(i);
    A1 = my_polyfit(x, y, d);
    A2 = polyfit(x, y, d);

    integral_my_polyfit(i) = calculate_integral(A1, -2, 2);
    integral_polyfit(i) = calculate_integral(flip(A2), -2, 2);
end


















