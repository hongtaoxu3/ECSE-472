function f = f_vector(X)
% Compute the nonlinear vector of the MNA equations as a function of x

global b DIODE_LIST

N = size(b);
f = zeros(N); % Initialize the f vector (same size as b)

NbDiodes = size(DIODE_LIST,2);

for I = 1:NbDiodes
    if (DIODE_LIST(I).node1 ~= 0) && (DIODE_LIST(I).node2 ~= 0) 
        v1 = X(DIODE_LIST(I).node1); %nodal voltage at anode
        v2 = X(DIODE_LIST(I).node2); %nodal voltage at cathode
        Vt = DIODE_LIST(I).Vt; % Vt of diode (part of diode model)
        Is = DIODE_LIST(I).Is; % Is of Diode (part of diode model)
        diode_current = Is*(exp((v1-v2)/Vt)-1);
        f(DIODE_LIST(I).node1) = f(DIODE_LIST(I).node1) + diode_current;
        f(DIODE_LIST(I).node2) = f(DIODE_LIST(I).node2) - diode_current;
    elseif (DIODE_LIST(I).node1 == 0)
        v2 = X(DIODE_LIST(I).node2); %nodal voltage at cathode
        Vt = DIODE_LIST(I).Vt; % Vt of diode (part of diode model)
        Is = DIODE_LIST(I).Is; % Is of Diode (part of diode model)
        diode_current = Is*(exp((-v2)/Vt)-1);
        f(DIODE_LIST(I).node2) = f(DIODE_LIST(I).node2) - diode_current;
    elseif (DIODE_LIST(I).node2 == 0)
        v1 = X(DIODE_LIST(I).node1); %nodal voltage at anode
        Vt = DIODE_LIST(I).Vt; % Vt of diode (part of diode model)
        Is = DIODE_LIST(I).Is; % Is of Diode (part of diode model)
        diode_current = Is*(exp((v1)/Vt)-1);
        f(DIODE_LIST(I).node1) = f(DIODE_LIST(I).node1) + diode_current;
    end
end



