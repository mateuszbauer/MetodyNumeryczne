




% x - szukana wartosc
function y = lagrange(X, Y, x)
    y = 0;

    for i = 1:length(X)
        Li = 1;
        for j = 1:length(X)
            if j ~= i
                Li = Li * ((x-X(j)) / (X(i)-X(j)));
            end
        end
        y = y + Y(i) * Li;
    end
end


function y = f(x)
    y = 1./(25*x.^2 + 1);
end


% Funkcja pomocnicza rysująca wykres
function plot_results(x, y, color)
    x_plot = linspace(min(x)-3, max(x)+3, 1000);
    y_plot = zeros(1, length(x_plot));
    for i = 1:length(y_plot)
        y_plot(i) = lagrange(x, y, x_plot(i));
    end

    plot(x_plot, y_plot, Color=color, LineStyle='-');
    plot(x, y, 'Color', color, 'Marker', "o", 'LineStyle', 'none');
    xlim([min(x)-1 max(x)+1]);
    ylim([min(y)-1 max(y)+1])
    plot([0 0], ylim, 'k-');
    plot(xlim, [0 0], 'k-');
end

% liczba wezlow
w = [3 5 6 8 9];
colors = ['b' 'r' 'g' 'c' 'm'];
bledy_interpolacji = zeros(1,length(w));

figure;
grid on;
hold on;
for i = 1:length(w)
    x = linspace(-1.5, 1.5, w(i));
    y = f(x);

    plot_results(x, y, colors(i));

    x1 = linspace(-1.5, 1.5, 100);
    y1 = f(x1);
    y2 = zeros(1, length(x1));
    for j = 1:length(y2)
        y2(j) = lagrange(x, y, x1(j));
    end

    bledy_interpolacji(i) = mean(abs(y1-y2));

end
title('Lagrange');
