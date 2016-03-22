function [ gravity ] = fnGravity( altitude )
%fnGravity Calculates the acceleration due to gravity based on the 
% altitude of the craft


global gravParam bodyRadius

gravity              = gravParam / (altitude + bodyRadius)^2; % m/(s^2)


end

