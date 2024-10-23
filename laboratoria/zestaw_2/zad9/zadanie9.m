


num_of_iterations = 100;

z = zeros(2, num_of_iterations);
z(:, 1) = [-0.6 -0.65];


function y = J(x)
    y = [x(2)-1 x(1); 2*x(1) -2*x(2)];
end

function y = F(x)
    y = [x(1)*x(2) - x(1) - 2; x(1)^2 - x(2)^2 - 1];
end

for i = 2:num_of_iterations
    z(:, i) = z(:, i-1) - J(z(:, i-1)) \ F(z(:, i-1));
end


len = 50;
x1 = linspace(-2, 2, len);
x2 = linspace(-2, 2, len);

[X, Y] = meshgrid(x1, x2);

v1 = zeros(len, len);
v2 = zeros(len, len);

for i = 1:len
    for j = 1:len
        v1(i, j) = X(i, j) * Y(i, j) - X(i, j) - 2;
        v2(i, j) = X(i, j)^2 - Y(i, j)^2 - 1;
    end
end


surf(X, Y, v1);
hold on;
surf(X, Y, v2);


