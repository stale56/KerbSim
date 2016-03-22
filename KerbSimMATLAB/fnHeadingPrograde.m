function [ orbPro, surfPro ] = fnHeadingPrograde( surfaceVeloX, surfaceVeloY )
%fnHeadingPrograde Calculates the orbital and surface prograde angle of
% the vessel. The angle is measured in degrees, measured from horizontal
global SiderealRotVelo


orbPro                       = atand(surfaceVeloY/(surfaceVeloX + SiderealRotVelo));
surfPro                      = atand(surfaceVeloY/surfaceVeloX);


% If the vessel is not moving (such as right at launch), there is no
% surface prograde, so just assume that the vessel is at 90deg.
if isnan(surfPro)
    surfPro                  = 90;
end


end

