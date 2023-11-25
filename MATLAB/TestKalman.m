clear all; clc; 

Nsamples = 15079;
EulerSaved = zeros(Nsamples, 3);
EulerSaved2 = zeros(Nsamples, 2);

dt = 0.038;

for k=1:Nsamples
    [p, q, r] = GetGyroData();
    A = eye(4) + dt*1/2*[ 0 -p -q -r; p 0 r -q; q -r 0 p; r q -p 0];
    [Ax, Ay, Az] = GetAccelData();
    [phi, theta] = AccelToEuler(Ax, Ay, Az);
    EulerSaved2(k, :) = [phi, theta];
    z = EulerToQuaternion(phi, theta, 0);


    [Phi, Theta, Psi] = KalmanToEuler(A, z);
    EulerSaved(k, :) = [Phi, Theta, Psi];
end


PhiSaved = EulerSaved(:, 1) * 180/pi;
ThetaSaved = EulerSaved(:, 2) * 180/pi;
PsiSaved = EulerSaved(:, 3) * 180/pi;

PhiSaved2 = EulerSaved2(:, 1) * 180/pi;
ThetaSaved2 = EulerSaved2(:, 2) * 180/pi;

t = 0:dt:(Nsamples-1)*dt;

% figure;
% plot(t, PhiSaved, 'b', 'LineWidth', 1);
% set(gca, 'LineWidth', 1);
% title('\bfTest Kalman')
% xlabel('Time [sec]');
% ylabel('\phi [deg]');
% axis auto

figure;
plot(t, ThetaSaved, 'b-', 'LineWidth', 1);
hold on;
plot(t, ThetaSaved2, 'r', 'LineWidth', 0.3);
legend('Kalman Filter', 'Accelerometer');

set(gca, 'LineWidth', 1);
title('\bfPitch angle of time (Sensor fusion using Kalman Filter)');
xlabel('Time [sec]');
ylabel('\theta [deg]');
axis auto
%axis([260 300 -40 50]);



% figure;
% plot(t, PsiSaved, 'b', 'LineWidth', 1);
% set(gca, 'LineWidth', 1);
% xlabel('Time [sec]');
% ylabel('\psi [deg]');