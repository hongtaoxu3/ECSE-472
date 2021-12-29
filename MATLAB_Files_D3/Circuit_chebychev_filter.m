% Chebychev filter

% define global variables
global G C
global b;
global DIODE_LIST
global TD_SOURCE_LIST_SINE TD_SOURCE_LIST_PWL



% Initialize MNA matrices
DIODE_LIST = struct('node1', [ ], 'node2', [ ], 'Is', [ ], 'Vt', [ ]);
TD_SOURCE_LIST_SINE = struct('SourceName',{ }, 'index1', [ ], 'index2', [ ], 'A', [ ], 'Phi', [ ], 'f', [ ]);
TD_SOURCE_LIST_PWL = struct('SourceName',{ }, 'index1', [ ], 'index2', [ ], 'T', [ ], 'D', [ ]);
G = sparse(10,10);               
C = sparse(10,10);
b = sparse(10,1);               

% Specify component values. This is done only for clarity.
% The values could have been entered directly in the netlist below.
R1a = 9606;
R1b = 23280;
R2 = 6800;
C1 = 94.9e-9;
C2 = 20.5e-9;

C3 = 15e-9;
C4 = 15e-9;
R3 = 9304;
R4 = 9304;
Rq = 52107;
Rg = 9304;
r = 20000;

% A, the opamp gain, can be specified here or before calling this function
%A = 50; %OpAmp gain 


% Netlist is below. Output is node 10.
vol(1,0,1);
res(1,2,R1a);
res(2,0,R1b);
res(2,3,R2);
res(4,5,Rg);
res(5,6,Rq);
res(6,7,R4);
res(8,9,r);
res(9,10,r);
res(5,10,R3);

cap(2,4,C1);
cap(3,0,C2);
cap(5,6,C3);
cap(7,8,C4);

vcvs(4,0,3,4,A);
vcvs(6,0,0,5,A);
vcvs(8,0,0,7,A);
vcvs(10,0,0,9,A);


