% Netlit of Diode circuit

% Your netlist should always begin by defining the global variables G C and b
global G C
global b;

% You also need to define and initialize the global variable DIODE_LIST as follows
global DIODE_LIST
DIODE_LIST = struct('diodename',{ }, 'node1', [ ], 'node2', [ ], 'Is', [ ], 'Vt', [ ]);



G = zeros(2,2);               
C = zeros(2,2);
b = zeros(2,1);    

vol(1,0,2)
res(1,2,50)
res(2,0,50)
cap(2,0,1e-6);
diode('D1',1,2,1e-15,26e-3);
