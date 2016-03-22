function atmDensity = fnKerbinAtm(altitude)
% fnKerbinAtm determines that atmospheric density [atm] at the given
% altitude above sea level. Only valid for Kerbin.

global pressureFn atmHeight






if altitude >= atmHeight
    atmPressure = 0;
else
    atmPressure = pressureFn(altitude);
end

%If the alt is above atmospheric height, the pressure is 0.

conversionFactor = 1.2230948554874; % kg/(m^3 * atm)


atmDensity = atmPressure*conversionFactor; % kg/(m^3)