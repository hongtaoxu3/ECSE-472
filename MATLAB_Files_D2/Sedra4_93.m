% Netlit of Diode circuit
% output is node 3
% The Variable Vi define the value of the input voltage.
% Vi needs to be set before calling this script.

global G C D
global b;

% You also need to define and initialize the global variable DIODE_LIST as follows
global DIODE_LIST
DIODE_LIST = struct('diodename',{ }, 'node1', [ ], 'node2', [ ], 'Is', [ ], 'Vt', [ ]);


N=6;
G = zeros(N,N);               
C = zeros(N,N);
b = zeros(N,1);    

vol(1,0,1)
res(1,2,1000)
diode('D1',3,2,2e-15,26e-3)
res(4,3,3000)
vol(4,0,Vi)   %The variable Vi is the input voltage. It needs to be assined
              %before this script is called.
diode('D2',5,3,2e-15,26e-3)
diode('D3',6,5,2e-15,26e-3)
res(6,5,1000)
vol(6,0,-2)


