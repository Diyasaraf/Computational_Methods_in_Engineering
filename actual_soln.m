clear;
clc;

% Define parameters
k1 = 2;
k2 = 0.5;
k3 = 0.3;
A0 = 1;
B0 = 0;
C0 = 0;
D0 = 0;
t_final = 10;

% Initial conditions
y0 = [A0, B0, C0, D0];

% Time span
tspan = [0 t_final];

% Solve the ODEs using ode45
[t, y] = ode45(@odes, tspan, y0);

% Extract the solutions
A_ode45 = y(:, 1);
B_ode45 = y(:, 2);
C_ode45 = y(:, 3);
D_ode45 = y(:, 4);

% Plot the results from ode45
figure(4);
plot(t, A_ode45, 'r', 'DisplayName', 'A - ode45');
hold on;
plot(t, B_ode45, 'b', 'DisplayName', 'B - ode45');
plot(t, C_ode45, 'g', 'DisplayName', 'C - ode45');
plot(t, D_ode45, 'm', 'DisplayName', 'D - ode45');
xlabel('Time');
ylabel('Concentration');
legend;
title('Kinetic System Solution using ode45');
grid on;

% Define the system of ODEs
function dydt = odes(t, y)
    k1 = 2;
    k2 = 0.5;
    k3 = 0.3;
    A = y(1);
    B = y(2);
    C = y(3);
    D = y(4);
    dA_dt = -k1 * A;
    dB_dt = k1 * A - (k2 + k3) * B;
    dC_dt = k2 * B;
    dD_dt = k3 * B;
    dydt = [dA_dt; dB_dt; dC_dt; dD_dt];
end