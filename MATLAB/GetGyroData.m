function [p, q, r] = GetGyroData()
% 엑셀 파일에 저장되어 있는 
% 자이로 각속도 값을 읽어서 반환하는 함수

persistent GyX GyY GyZ
persistent k firstRun

if isempty(firstRun)
    data = readcell('myAcclGyroData.xlsx');
    GyX = cell2mat(data(2:size(data, 1), 4));
    GyY = cell2mat(data(2:size(data, 1), 5));
    GyZ = cell2mat(data(2:size(data, 1), 6));
    disp('Gyro Data file loaded.');
    k = 1;
    firstRun = 1;
end

p = GyX(k);
q = GyY(k);
r = GyZ(k);

k = k + 1;