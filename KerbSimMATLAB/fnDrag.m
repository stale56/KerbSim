function [ FORCEdrag ] = fnDrag (altitude, surfaceVelocity, dragCoef, Area)
%fnDrag Calculates the drag force [N], based on altitude from sea level
% [m], surface velocity [m/s], drag coefficient, and cross sectional
% area [m^2]



atmDensity = fnKerbinAtm(altitude); % Calculates atmosphereic density
                                    % based on altitude [kg/(m^3)]



FORCEdrag = (1/2) * atmDensity * surfaceVelocity^2 * dragCoef * Area; % [N]




end

