function Xdc = dcsolvealpha(Xguess,alpha,maxerr)
% Compute dc solution using newtwon iteration for the augmented system
% G*X + f(X) = alpha*b
% Inputs: 
% Xguess is the initial guess for Newton Iteration
% alpha is a paramter (see definition in augmented system above)
% maxerr defined the stopping criterion from newton iteration: Stop the
% iteration when norm(deltaX)<maxerr
% Oupputs:
% Xdc is a vector containing the solution of the augmented system

global G C b DIODE_LIST
% from deliverable 1 
g=1;
f=f_vector(Xguess);
S=G*Xguess+f-(alpha*b);
J=nlJacobian(Xguess);
delta_x= -J\S;
Xguess=Xguess+delta_x;
dX(g,1) = norm(delta_x);

while dX>maxerr
     g=g+1;
     f=f_vector(Xguess);
     S=G*Xguess+f-(alpha*b);
     J=nlJacobian(Xguess);
     delta_x= -J\S;
     Xguess=Xguess+delta_x;
     dX(g,1) = norm(delta_x);
end

Xdc=Xguess; 
end




