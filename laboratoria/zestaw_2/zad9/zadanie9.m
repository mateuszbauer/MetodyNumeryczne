


num_of_iterations = 10;

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


