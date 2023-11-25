function [phi, theta, psi] = KalmanToEuler(A, z)
% 칼만 필터를 적용하여 쿼터니언 추정값을 구하고
% 오일러 각으로 바꿔서 반환하는 함수
persistent H Q R
persistent x P firstRun

if isempty(firstRun)
    H = eye(4);
%     Q = [ 0.5850^2      0       0       0;
%           0        0.3988^2     0       0;
%           0             0    0.4982^2   0;
%           0             0       0     0.3703^2 ];
% 
%     R = [ 0.0189^2      0       0       0;
%           0        0.1665^2     0       0;
%           0             0    0.0052^2   0;
%           0             0       0     0.0012^2 ];

    Q = 2.7*eye(4);
    R = 40*eye(4);

    x = [1 0 0 0]';
    P = 1*eye(4);

    firstRun = 1;
end


xp = A*x;
Pp = A*P*A' + Q;

K = Pp*H'/(H*Pp*H' + R);

x = xp + K*(z - H*xp);
P = Pp - K*H*Pp;


e = quat2eul(x', 'XYZ');

phi = e(1);
theta = e(2);
psi = e(3);