clear all
format long

% Defining parameters
alpha_values = [4, 8];

% Values of Beta
beta_values = linspace(-1, 1, 1000);

%% Initialize Lyapunov exponents array

lyapunov_exponents = zeros(length(alpha_values), length(beta_values));
num_x0 = 2;
% The outer loop (alpha_idx)
for alpha_idx = 1:length(alpha_values)
    alpha = alpha_values(alpha_idx);

    % The inner loop (beta_idx) 
    for beta_idx = 1:length(beta_values)
        beta = beta_values(beta_idx);

        % Initializing variables
        x0_values = [0, -1];
        num_iterations = 1000;
        sum_log_derivative = zeros(1, num_x0);

        for x0_idx = 1:num_x0
            x0 = x0_values(x0_idx);
            x = x0;

            for n = 1:num_iterations
                % Gaussian map iteration
                x  = exp(-alpha*x^2) + beta;

                % Computing the derivative of the map
                derivative = 2 * alpha * x *  exp(-alpha*x^2);

                % Update the sum of logarithmic derivatives variable to 
                % accumulate the sum of logarithmic derivatives during iterations.
                sum_log_derivative(x0_idx) = sum_log_derivative(x0_idx) + log(abs(derivative));
            end

            % Computing the average logarithmic derivative for this X0
            avg_log_derivative = sum_log_derivative(x0_idx) / num_iterations;

            % Store Lyapunov exponent
            lyapunov_exponents(beta_idx, x0_idx, alpha_idx) = avg_log_derivative;
        end

    end
end

%% Plot the Lyapunov spectrum
figure;

% alpha = 4 && X0 = 0
subplot(2,2,1)
plot(beta_values, lyapunov_exponents(:, 1, 1), 'b', 'LineWidth', 1, 'DisplayName', '{\alpha} = 4');

xlabel('{\beta}');
ylabel('Lyapunov Exponent');
title('Lyapunov Spectrum of the Gaussian Map For X_{0} = 0');
legend('Location', 'best');
grid on;

% alpha = 4 && X0 = -1
subplot(2,2,2)
plot(beta_values, lyapunov_exponents(:, 2, 1), 'b', 'LineWidth', 1, 'DisplayName', '{\alpha} = 4');

xlabel('{\beta}');
ylabel('Lyapunov Exponent');
title('Lyapunov Spectrum of the Gaussian Map For X_{0} = -1');
legend('Location', 'best');
grid on;

% alpha = 8 && X0 = 0
subplot(2,2,3)
plot(beta_values, lyapunov_exponents(:, 1, 2), 'r', 'LineWidth', 1, 'DisplayName', '{\alpha} = 8');
xlabel('{\beta}');
ylabel('Lyapunov Exponent');
title('Lyapunov Spectrum of the Gaussian Map For X_{0} = 0');
legend('Location', 'best');
grid on;

% alpha = 8 && X0 = -1
subplot(2,2,4)
plot(beta_values, lyapunov_exponents(:, 2, 2), 'r', 'LineWidth', 1, 'DisplayName', '{\alpha} = 8');

xlabel('{\beta}');
ylabel('Lyapunov Exponent');
title('Lyapunov Spectrum of the Gaussian Map For X_{0} = -1');
legend('Location', 'best');
grid on;

