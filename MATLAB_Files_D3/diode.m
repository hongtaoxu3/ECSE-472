function diode(name,n1,n2,Is,Vt)
% Adds Diode Stamp
% The Global varialble DIODE_LIST should be defined at the beginning of
% your netlist as follows
% 
% global DIODE_LIST
% DIODE_LIST = struct('diodename',{ }, 'node1', [ ], 'node2', [ ], 'Is', [ ], 'Vt', [ ]);
% node1 is the andode and node2 is the Cathod. Is and Vt are diode
% parameters.



global DIODE_LIST

%current number of diodes
nbDiodes = size(DIODE_LIST,2);

N = nbDiodes + 1;  %index of next diode
DIODE_LIST(N).diodename = name;
DIODE_LIST(N).node1 = n1;
DIODE_LIST(N).node2 = n2;
DIODE_LIST(N).Is = Is;
DIODE_LIST(N).Vt = Vt;

