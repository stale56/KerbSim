%% KERBSIM %%
% KerbSim.m
% By: /u/stale56
% 12/20/2015


%% DEPENDENCIES %%
% variableInitialization.m            Initializes all needed variables
% fnEnginePerf.m                      Calculcates engine performance percent   
% engineperformance.csv               Data from engine performance tests
% fnDrag.m*                           Calculates drag force on rocket
% fnAscentProfile.m                   Determines the ascent profile of rocket
% fnGravity.m                         Calculates acceleration from gravity
% fnHeadingPrograde.m                 Calculates the heading of Prograde for the vessel
% fnOrbitalParameters.m               Calculates all necessary orbital paramters for the vessel
% fnKerbinAtm.m*                       Calculates the atmospheric pressure on the vessel
% fnMdot.m                            Calculates the mass flow of the vessel


% *Currently, this is the most inefficient function. It always calls
%  back to variableInitialization and reads a spline, or something like
%  that. It's been too long since I've worked on this bad boy, so I don't
%  know how to fix it right now.

%% The Scriptening:


clear all
clear


variableInitialization


% See comments at end of script for advice for using this to log data
%
% var1=0;
% var2=0;
% for turnParam1=xxx:xxx
%     var1=var1+1;
% for turnParam2=xxx:xxx
%     var2=var2+1;
% var1 and var2 are for indexing purposes.

% See comments at end of script for advice for using this to log data
 
h                           = .5; % Timestep: iterations per second

targetAltitude              = 150000; % m


heading                     = 90; % deg : straight up 



massCurrent                  = wetMass;


throttle                     = 1;


timeCurrent                 = 0;

altitudeCurrent             = minALT; %Initial Altitude of the vessel
positionXcurrent            = 0;


velocityXcurrent            = 0; % m/s   Starting at rest
velocityYcurrent            = 0; % m/s   Starting at rest

[ surfaceVelocity, orbitalVelocity, SMA, APsurf, PEsurf, vAP, vPE ] = fnOrbitalParameters(altitudeCurrent, velocityXcurrent,velocityYcurrent);



i=1; % Initialize Index
runmode = 1;

while runmode == 1
    if altitudeCurrent > (targetAltitude)
        runmode = 0;
    elseif massCurrent < dryMass
        runmode = -1;
    elseif altitudeCurrent < 0
        runmode = -2;
    end
    % Continue simulation until we either run out of fuel, the
    % vessel reaches the target altitude, or we drop below sea level. 
    % 0  --- Vessel made it to AP
    % -1 --- Vessel ran out of fuel
    % -2 --- Vessel did falls below sea level
    
    

    g                       = fnGravity(altitudeCurrent); % m/(s^2)
    Weight                  = massCurrent * g; % N
    
    enginePerf              = fnEnginePerf(altitudeCurrent); % [%]
    Thrust                  = enginePerf * ThrustVac; % N
    Isp                     = enginePerf * IspVac; % m/s
    
    massLoss                = fnMdot(Isp,Thrust); % kg/s

    Drag                    = fnDrag (altitudeCurrent, surfaceVelocity, dragCoef, Area); % N
    d(i)=Drag;

    heading                 = fnAscentProfile(altitudeCurrent,velocityYcurrent);% turnParam1,turnParam2);
    t(i) = throttle;
    head(i) = heading;
    
    Thrust                  = Thrust * throttle;
    massLoss                = massLoss * throttle;

    
    time(i) = timeCurrent + h;
    timeCurrent = time(i);
    
    mass(i)                 = massCurrent - (massLoss * h); % kg
    massCurrent             = mass(i);
    
    accelerationX(i)        = ((Thrust - Drag) * cosd(heading))/massCurrent;
    accelerationXcurrent    = accelerationX(i);
    
    accelerationY(i)        = ((Thrust - Drag) * sind(heading) - Weight)/massCurrent;
    accelerationYcurrent    = accelerationY(i);

    
    velocityX(i)            = velocityXcurrent + accelerationXcurrent * h;
    velocityXcurrent        = velocityX(i);
   
    velocityY(i)            = velocityYcurrent + accelerationYcurrent * h;
    velocityYcurrent        = velocityY(i);
    
    positionX(i)            = positionXcurrent + velocityXcurrent * h + (accelerationXcurrent / 2) * h^2;
    positionXcurrent        = positionX(i);
   
    altitudeY(i)            = altitudeCurrent + velocityYcurrent * h + (accelerationYcurrent / 2) * h^2;
    altitudeCurrent         = altitudeY(i);
    
    AP(i)                   = APsurf;
    
    if APsurf > targetAltitude * 1 
        throttle = 0;
        runmode = 0;
    end
    
    [ surfaceVelocity, orbitalVelocity, SMA, APsurf, PEsurf, vAP, vPE ]= fnOrbitalParameters(altitudeCurrent, velocityXcurrent,velocityYcurrent);
    i=i+1;


end


if runmode == 0 
    orbitalSpeed                = sqrt(gravParam/(bodyRadius+APsurf)); % m/s : velocity for a 150km Orbit
    
    dVremaining                 = log(massCurrent / dryMass) * IspVac * 9.81; % m/s : dV remaining
    dVcirc                      = dVremaining - (orbitalSpeed - vAP); % m/s :dV remaining after circularization, assuming an impulse burn
    
    disp({'Vessel dV Remaining             [m/s]:   ', dVremaining;
        'Velocity at AP                  [m/s]:   ', vAP;
        'Approx dV after Circularization [m/s]:   ', dVcirc;
        'Mass Remaining                   [kg]:   ', massCurrent})
    
elseif runmode == -1
    disp('Ran out of fuel')
    dVcirc=0;
elseif runmode == -2
    disp('Crashed')
    dVcirc=0;
end







% disp(var1)
% disp(var2)
% 
% dvRem(var1,var2)=dVcirc;
% 
% 
% end 
% var2=0;
% end
% If you are interested in making this test varius ascent profiles, I suggest you remove the comments
% for this 'end'.I also suggest that you index and record your dVcirc, time, or whatever other
% parametric you're interested in optimizing







