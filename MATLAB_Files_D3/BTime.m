function Bt = BTime(t)
% Evaluate the time dependent right hand side vector of the MNA
% t is time in seconds
% Bt is the returned RHS vector

global b
global TD_SOURCE_LIST_SINE

N = size(b);
Bt = zeros(N); % Initialize the Bt vector (same size as b)

NbSources = size(TD_SOURCE_LIST_SINE,2);

for I = 1:NbSources
    if TD_SOURCE_LIST_SINE(I).index1 ~=0 
    Bt(TD_SOURCE_LIST_SINE(I).index1) = Bt(TD_SOURCE_LIST_SINE(I).index1) + ...
        TD_SOURCE_LIST_SINE(I).A*sin(2*pi*TD_SOURCE_LIST_SINE(I).f*t + ...
        TD_SOURCE_LIST_SINE(I).Phi*pi/180);
    end
    
    if TD_SOURCE_LIST_SINE(I).index2 ~=0 
    Bt(TD_SOURCE_LIST_SINE(I).index2) = Bt(TD_SOURCE_LIST_SINE(I).index2) - ...
        TD_SOURCE_LIST_SINE(I).A*sin(2*pi*TD_SOURCE_LIST_SINE(I).f*t + ...
        TD_SOURCE_LIST_SINE(I).Phi*pi/180);
    end
end