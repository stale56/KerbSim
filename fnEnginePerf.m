function [ performancePercent ] = fnEnginePerf( altitude )
%fnEnginePerf Calculates the performance of a rockomax Mainsail engine, 
% based on the current altitude. Most accurate on Kerbin for altitudes
% above 100 km.
% performancePercent is the percent of the VAC values for Isp and Thrust
% given on the engine page.


global fnTESTEDperf minALT maxALT


if altitude < minALT
    altitude = minALT;
elseif altitude > maxALT
    altitude = maxALT;
end

performancePercent =fnTESTEDperf(altitude);
    
    
end

