function [ mDot ] = fnMdot( Isp,Thrust )
%fnMdot Calculates the masss flow rate [kg/s] based on the Isp and the
% Thrust. If the throttle changes, then mDot needs to be recalculated,
% however if the throttle is remaining constant, mDot will remain constant,
% as well.

% Equation from: http://wiki.kerbalspaceprogram.com/wiki/Specific_impulse

mDot                    = Thrust / (Isp * 9.82); % kg/s




end

