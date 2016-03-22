%Stale56
%This function will provide telemetry through kOS.
%
%
%This function will run indefinately, and constantly updates
%the data it reads.
%
%
%It is up to you to determine how you wish you use this program:
%for good or for evil. I trust that you will make the correct
%decision.
clear;
clc
figure
hold on






i=1; %dummy variable
while i > 0; %infi-loop!

    %Read the data... again...
    data = csvread('D:\Steam Library\steamapps\common\Kerbal Space Program\Ships\Script\enginePerformance.csv');
    time = data(:,1);
    altitude = data(:,2);
    pressure = data(:,3);
    enginePerf = data(:,4);
 

    %plot the data... again...
    subplot(2,2,1), plot(time,altitude)
    xlabel('time [s]')
    ylabel('altitude [m]')
    title(num2str(altitude(end)))


    subplot(2,2,2), plot(time,pressure)
    xlabel('time [s]')
    ylabel('pressure [kPa]')
    title(num2str(pressure(end)))


    subplot(2,2,3), plot(time,enginePerf,'.')
    xlabel('time [s]')
    ylabel('Performance [%]')
    title(num2str(enginePerf(end)))
    
    subplot(2,2,4), plot(pressure,enginePerf,'.')
    xlabel('pressure [kPa]')
    ylabel('Performance [%]')
    title(num2str(enginePerf(end)))
    
    


     pause(0.1); %pause briefly!
end