

function [tpoints,r] = transient_trapez(t1,t2,h,out)
% [tpoints,r] = Transient_trapez(t1,t2,h,out)
% Perform Transient Analysis using the Trapezoidal Rule for LINEAR
% circuits.
% assume zero initial condition.
% Inputs:  t1 = starting time point (typically 0)
%          t2 = ending time point
%          h  = step size
%          out = output node
% Outputs  tpoints = are the time points at which the output
%                    was evaluated
%          r       = value of the response at above time points
% plot(tpoints,r) should produce a plot of the transient response
global G C b

zs1 = zeros(size(G,2),1);
zs = zeros(size(b));

tpoints = t1:h:t2;
%same as beuler
r = zeros(1,length(tpoints));

for x = 1:length(tpoints)-1
    zs = inv(G+2*C/h)*(BTime(tpoints(x+1))+BTime(tpoints(x))+(2*C/h-G)*zs);
    
    r(x+1)=zs(out);
end

