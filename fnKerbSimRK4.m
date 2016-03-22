function [ valueNext ] = fnKerbSimRK4  yP ,a, h, y0 )
%fnKerbSimRK4 This was copied and pasted from my solution to homework
% problem 25.13. You input the function you wish to evaluate, the current
% terms for both indexices (a for x-independent, y- for y-dependent), and
% timestep of the function.


%ME300
%Joe Ruggiero
%Problem 25.13



%yP= function for the derivative of y
%a= initial condition for x
%h= stepsize
%y0= initial condition for y





x(1)=a;
y(1)=y0;



i=1;


k1=yP(x(i),y(i));    
k2=yP(x(i)+1/2*h,y(i)+1/2*h*k1);
k3=yP(x(i)+1/2*h,y(i)+1/2*h*k2);
k4=yP(x(i)+h,y(i)+h*k3);



valueNext=y(i)+1/6*(k1+2*k2+2*k3+k4)*h;




end