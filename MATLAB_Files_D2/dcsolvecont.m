function Xdc = dcsolvecont(n_steps,maxerr)
% Compute dc solution using newtwon iteration and continuation method
% (power ramping approach)
% inputs:
% n_steps is the number of continuation steps between zero and one that are
% to be taken. For the purposes of this assigments the steps should be 
% linearly spaced (the matlab function "linspace" may be useful).
% maxerr is the stopping criterion for newton iteration (stop iteration
% when norm(deltaX)<maxerr

global b 

alpha=linspace(0,1,n_steps);

S = size(b);
Xdc = zeros(S);

for g = 1:length(alpha)
    
    Xdc = dcsolvealpha(Xdc,alpha(g),maxerr);
    
end




