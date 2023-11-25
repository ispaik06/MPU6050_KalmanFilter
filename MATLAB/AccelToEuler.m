function [phi, theta] = AccelToEuler(Ax, Ay, Az)
% 가속도 센서로 측정한 가속도 값으로 
% 롤각, 피치각을 반환하는 함수

% 결과가 더 정확하게 나오는 식
% phi = atan(Ay/Az);
% theta = atan(Ax/sqrt(Ay^2 + Az^2));


g = 9.81;
theta = asin(Ax/g);
phi = asin(-Ay/(g*cos(theta)));