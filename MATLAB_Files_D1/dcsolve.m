function [Xdc dX] = dcsolve(Xguess,maxerr)
% Compute dc solution using newtwon iteration
% input: Xguess is the initial guess for the unknown vector. 
%        It should be the correct size of the unknown vector.
%        maxerr is the maximum allowed error. Set your code to exit the
%        newton iteration once the norm of DeltaX is less than maxerr
global G C b DIODE_LIST
g=1; %Xguess = [2,1.3,1];
f=f_vector(Xguess);
S=G.*Xguess+f-b;
J=nlJacobian(Xguess);
delta_x= -J\S;
Xguess=Xguess+delta_x;
dX(g,1) = norm(delta_x);

while dX>maxerr
g=g+1;
f=f_vector(Xguess);
S=G*Xguess+f-b;
J=nlJacobian(Xguess);
delta_x= -J\S;
Xguess=Xguess+delta_x;
dX(g,1) = norm(delta_x);
end

% Code exits when norm of DeltaX is less than maxerr
Xdc=Xguess; 
% the correction solution
%Xguess = [2,1.3,1];
%G = [1/50,-1/50,1;-1/50,1/50,0;1,0,0];
%F = [(-1e-15).*exp((2-1.3)/(26e-3)),(1e-15).*exp((2-1.3)/(26e-3)),0];
%b = [0,0,2]
%theta = G.*Xguess+F-b;
% Output: Xdc is the correction solution
%         dX is a vector containing the 2 norm of DeltaX used in the 
%         newton Iteration. the size of dX should be the same as the number
%         of Newton-Raphson iterations. See the help on the function 'norm'
%         in matlab.
end



