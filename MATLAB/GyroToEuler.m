function [phi, theta, psi] = GyroToEuler(p, q, r, dt)
% 자이로 각속도로 계산한 phi, theta를 반환하는 함수
%
persistent prevPhi prevTheta prevPsi


if isempty(prevPhi)
  prevPhi   = 0;
  prevTheta = 0;
  prevPsi   = 0;
end

sinPhi   = sin(prevPhi);    cosPhi   = cos(prevPhi);
cosTheta = cos(prevTheta);  tanTheta = tan(prevTheta);

phi   = prevPhi   + dt*( p + q*sinPhi*tanTheta + r*cosPhi*tanTheta );
theta = prevTheta + dt*(     q*cosPhi          - r*sinPhi );
psi   = prevPsi   + dt*(     q*sinPhi/cosTheta + r*cosPhi/cosTheta );

prevPhi   = phi;
prevTheta = theta;
prevPsi   = psi; 