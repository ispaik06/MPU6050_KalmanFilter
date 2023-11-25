clear all; clc; 

Nsamples = 15079;
EulerSaved = zeros(Nsamples, 2);
AxSaved = zeros(Nsamples, 1);
AySaved = zeros(Nsamples, 1);
dt = 0.038;

for k=1:Nsamples
    [Ax, Ay, Az] = GetAccelData();
    [phi, theta] = AccelToEuler(Ax, Ay, Az);
    EulerSaved(k, :) = [phi, theta];
    AxSaved(k, 1) = Ax;
    AySaved(k, 1) = Ay;
end


PhiSaved = EulerSaved(:, 1) * 180/pi;
ThetaSaved = EulerSaved(:, 2) * 180/pi;

t = 0:dt:(Nsamples-1)*dt;

figure;
subplot(2, 1, 1);
plot(t, AxSaved, 'r', 'LineWidth', 1);
set(gca, 'LineWidth', 1);
title('\bfx-axis acceleration obtained from acceleration sensor');
xlabel('Time [sec]');
ylabel('A_x [m/s^2]');

subplot(2, 1, 2);
plot(t, AySaved, 'r', 'LineWidth', 1);
set(gca, 'LineWidth', 1);
title('\bfy-axis acceleration obtained from acceleration sensor');
xlabel('Time [sec]');
ylabel('A_y [m/s^2]');

% figure;
% plot(t, PhiSaved, 'b', 'LineWidth', 1);
% set(gca, 'LineWidth', 1);
% title('\bfRoll angle of time (Accelerometer)');
% xlabel('Time [sec]');
% ylabel('\phi [deg]');

figure;
plot(t, ThetaSaved, 'b', 'LineWidth', 1);
set(gca, 'LineWidth', 1);
title('\bfPitch angle of time (Accelerometer)');
xlabel('Time [sec]');
ylabel('\theta [deg]');