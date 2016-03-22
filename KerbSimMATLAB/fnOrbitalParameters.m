function [ surfaceVelocity, orbitalVelocity, SMA, APsurf, PEsurf, vAP, vPE] = ...
           fnOrbitalParameters( altitude, surfaceVeloX, surfaceVeloY )
%fnOrbitalParameters Input the altitude [m] and surface velocity components [m/s],
% and function outputs the AP, PE [m] (from surface of body), the SMA [m] from
% the center of the body, the velocity at the AP and PE [m/s], and the
% orbital and surface velocity of
% the vessel [m/s]

global bodyRadius gravParam SiderealRotVelo

dist2center = altitude + bodyRadius; % m
% Distance to the center of the body

surfaceVelocity         = sqrt(surfaceVeloX^2 + surfaceVeloY^2); % m/s
% Adds the x and y components of the velocity


orbitalVelocity         = sqrt((surfaceVeloX + SiderealRotVelo)^2 + surfaceVeloY^2);
% Adds the (x+siderealRotation) and y components of the surface velocity


specificEnergy          = (orbitalVelocity^2)/2 - gravParam/dist2center; % (m^2)/(s^2) = J/kg
% Calculates the specific energy at the given point on the orbit.

SMA                     = -gravParam/(2 * specificEnergy); % m
% Calculates the semi-major axis

specAngMom              = dist2center * orbitalVelocity * sin( atan( (surfaceVeloX + SiderealRotVelo) / surfaceVeloY));
% Specific Angular Momentum. It's the cross product of the radius and
% velocity. I got the
% equation from wikipedia: https://en.wikipedia.org/wiki/Specific_relative_angular_momentum
% The atan part gets the angle between the radius and velocity (which is
% the same as the angle between the x and y components of the orbital
% velocity

eccentricity            = sqrt(1 + 2 * (specificEnergy * specAngMom^2) / (gravParam^2));
%  I got this equation from here http://www.gdnordley.com/_files/Keplerian%20review.pdf


APcent                  = SMA * ( 1 + eccentricity); % m
PEcent                  = SMA * ( 1 - eccentricity); % m
% AP and PE from center of body
vAP                     = sqrt((1 - eccentricity) * gravParam / APcent); % m/s
vPE                     = sqrt((1 + eccentricity) * gravParam / PEcent); % m/s
% Velocity at AP and PE

APsurf                  = APcent - bodyRadius; % m
PEsurf                  = PEcent - bodyRadius; % m
% AP and PE from surface of body








end

