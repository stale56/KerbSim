% variableInitialization.m
% Initializes all of the variables needed for the Kerbal Simulation
% [KerbSim]
%
% 1. Currently Initializes : 
% 2. Variable Name         :
% 3. Used in               :
%
%
%
% 1. Pressure Initialization
% 2. pressureData, pressureFn(alt), atmHeight
% 3. fnKerbinAtm.m, fnDrag.m
% 
% 
% 1. Planetary Parameters
% 2. SiderealRotVelo, bodyRadius, bodyMass, gravParam
% 3. fnOrbitalParameters.m, fnHeadingPrograde.m, fnGravity
% 
% 
% 1. Vessel Parameters
% 2. Area, dragCoeg, dryMass, wetMass, IspAtm, IspVac, ThrustAtm, ThrustVac
%    TESTEDaltitude, TESTEDpressure, TESTEDenginePerf, fnTESTEDperf,
%    minALT, maxALT
% 3. fnDrag.m, fnEnginePerf.m
%
% 
% 1. 
% 2. 
% 3. 
% 
% 

%% GLOBALIZATION %%
% Globalizas all variables from section above
clear

global pressureFn pressureData atmHeight SiderealRotVelo bodyRadius ...
       bodyMass gravParam Area dragCoef dryMass wetMass IspAtm ...
       IspVac ThrustAtm ThrustVac targetAltitude TESTEDaltitude...
       TESTEDpressure TESTEDenginePerf fnTESTEDperf minALT maxALT



%% Atmospheric Pressure Initialization %%

atmHeight = 70000;
% Height from sea level of the atmosphere

% pressureData= [alt[m]     Pressure[Pa]    [atm]] 
pressureData = [0           101325          1.000
                2500        69015           0.681
                5000        45625       	0.450
                7500    	29126           0.287
                10000       17933           0.177
                15000       6722            0.066
                20000       2546            0.025
                25000       989.0           0.010
                30000       401.3           0.004
                40000       78.99       	0.001
                50000       15.56           0.000
                60000       2.382           0.000
                70000       0.000           0.000];
            
% Data from: http://wiki.kerbalspaceprogram.com/wiki/Kerbin#Atmosphere


pressureFn = @(alt) spline(pressureData(:,1),pressureData(:,3),alt);
% Outputs pressure in atm
% Only valid for altitudes under 70,000m


%% Planetary Parameters %%

SiderealRotVelo          = 174.94;                  % m/s
% Velocity of the surface of Kerbin

bodyRadius               = 600000;                  % m
% Radius of Kerbin

bodyMass                 = 5.2915793*10^22;         % kg
% Mass of Kerbin

gravParam                = 3.5316000*10^12 ;        % (m^3)/(s^2)
% Standard Gravitational Parameter of Kerbin, mu

% Data from: http://wiki.kerbalspaceprogram.com/wiki/Kerbin
%% Vessel Parameters %%

Area                     = 2.5 * pi / 4;  % m^2
% cross sectional area, a 2.5m orange tank is the widest part.

dragCoef                 = 0.2;
% coefficient of drag from here: https://alterbaron.github.io/ksp_aerocalc/

dryMass                  = 15905; %kg
% dry mass of vessel

wetMass                  = 83905; % kg
% wet mass of vessel

IspAtm                   = 285; % m/s
IspVac                   = 310; % m/s
% specific impulse of vessel

ThrustAtm                = 1379000.03; %N
ThrustVac                = 1500000.00; %N
% thrust of vessel

targetAltitude           = 150000; % m
% target altitude from sea level


% Data from testing a RockoMax Mainsail engine. 
data                    = csvread('enginePerformance.csv');
TESTEDtime              = data(:,1);
TESTEDaltitude          = data(:,2);
minALT                  = TESTEDaltitude(1);
maxALT                  = TESTEDaltitude(end);
TESTEDpressure          = data(:,3);
TESTEDenginePerf        = data(:,4);
fnTESTEDperf            = @(alt)interp1(TESTEDaltitude,TESTEDenginePerf,alt);


            
