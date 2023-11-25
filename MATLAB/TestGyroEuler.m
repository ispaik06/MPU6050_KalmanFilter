clear all; clc; 


Nsamples = 15079;
EulerSaved = zeros(Nsamples, 3);
GySaved = zeros(Nsamples, 3);

dt = 0.038;

for k=1:Nsamples
    [p, q, r] = GetGyroData();
    [phi, theta, psi] = GyroToEuler(p, q, r, dt);
    EulerSaved(k, :) = [phi, theta, psi];
    GySaved(k, :) = [p, q, r];
end

PhiSaved = EulerSaved(:, 1) * 180/pi;
ThetaSaved = EulerSaved(:, 2) * 180/pi;
PsiSaved = EulerSaved(:, 3) * 180/pi;


t = 0:dt:(Nsamples-1)*dt;

figure;
subplot(2, 1, 1);
plot(t, GySaved(:, 1), 'r', 'LineWidth', 1);
set(gca, 'LineWidth', 1);
title('\bfRoll rate obtained from gyro sensor');
xlabel('Time [sec]');
ylabel('\phi rate [deg/s]');

subplot(2, 1, 2);
plot(t, GySaved(:, 2), 'r', 'LineWidth', 1);
set(gca, 'LineWidth', 1);
title('\bfPitch rate obtained from gyro sensor');
xlabel('Time [sec]');
ylabel('\theta rate [deg/s]');


figure;
plot(t, PhiSaved, 'b', 'LineWidth', 1);
set(gca, 'LineWidth', 1);
title('\bfRoll angle of time (Gyro sensor)');
xlabel('Time [sec]');
ylabel('\phi [deg]');

figure;
plot(t, ThetaSaved, 'b', 'LineWidth', 1);
set(gca, 'LineWidth', 1);
title('\bfPitch angle of time (Gyro sensor)');
xlabel('Time [sec]');
ylabel('\theta [deg]');

% figure;
% plot(t, PsiSaved);
% xlabel('Time [sec]');
% ylabel('Yaw angle [deg]');