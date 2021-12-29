function J = nlJacobian(X)
% Compute the jacobian of the nonlinear vector of the MNA equations as a 
% function of X
% input: X is the current value of the unknown vector.
% output: J is the jacobian of the nonlinear vector f(X) in the MNA
% equations. The size of J should be the same as the size of G.
global G DIODE_LIST
S = size(G);
J = zeros(S);

Diodes = size(DIODE_LIST,2);

for I = 1:Diodes
    
    if (DIODE_LIST(I).node1 ~= 0) && (DIODE_LIST(I).node2 ~=0)
        v1 = X(DIODE_LIST(I).node1);
        v2 = X(DIODE_LIST(I).node2);
        Vt = DIODE_LIST(I).Vt;
        Is = DIODE_LIST(I).Is;
        
J(DIODE_LIST(I).node1,DIODE_LIST(I).node1)=J(DIODE_LIST(I).node1,DIODE_LIST(I).node1)+(Is/Vt)*exp((v1-v2)/Vt);
J(DIODE_LIST(I).node1,DIODE_LIST(I).node2)=J(DIODE_LIST(I).node1,DIODE_LIST(I).node2)-(Is/Vt)*exp((v1-v2)/Vt);
J(DIODE_LIST(I).node2,DIODE_LIST(I).node1)=J(DIODE_LIST(I).node2,DIODE_LIST(I).node1)-(Is/Vt)*exp((v1-v2)/Vt);
J(DIODE_LIST(I).node2,DIODE_LIST(I).node2)=J(DIODE_LIST(I).node2,DIODE_LIST(I).node2)+(Is/Vt)*exp((v1-v2)/Vt);

    elseif (DIODE_LIST(I).node1 == 0)
    v2 = X(DIODE_LIST(I).node2);
    Vt = DIODE_LIST(I).Vt;
    Is = DIODE_LIST(I).Is;
    J(DIODE_LIST(I).node2,DIODE_LIST(I).node2)=J(DIODE_LIST(I).node2,DIODE_LIST(I).node2)+(Is/Vt)*exp(-v2/Vt);

    else (DIODE_LIST(I).node2 == 0)
    v1 = X(DIODE_LIST(I).node1);
    Vt = DIODE_LIST(I).Vt;
    Is = DIODE_LIST(I).Is;
    J(DIODE_LIST(I).node1,DIODE_LIST(I).node1)=J(DIODE_LIST(I).node1,DIODE_LIST(I).node1)+(Is/Vt)*exp(v1/Vt);
    end
end
J=J+G;
%syms v1 v2 Ie
%global X eqn
%X = [v1;v2;Ie];
%eqn = [(-1e-15)*exp((v1-v2)/(26e-3));(1e-15)*exp((v1-v2)/(26e-3));0];
%J = jacobian(eqn,X);
%J = jacobian([(-1e-15)*exp((v1-v2)/(26e-3)),(1e-15)*exp((v1-v2)/(26e-3)),0],[v1,v2,Ie])

