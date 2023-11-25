function [Ax, Ay, Az] = GetAccelData()
% 엑셀 파일에 저장되어 있는 
% 가속도계의 가속도 값을 읽어서 반환하는 함수

persistent ax ay az 
persistent k firstRun

if isempty(firstRun)
    data = readcell('myAcclGyroData.xlsx');
    Accel = cell2mat(data(2:size(data, 1), 1:3));
    ax = Accel(:, 1);
    ay = Accel(:, 2);
    az = Accel(:, 3);
    disp('Accelerometer Data file loaded.');
    k = 1;
    firstRun = 1;
end

Ax = ax(k);
Ay = ay(k);
Az = az(k);

k = k + 1;