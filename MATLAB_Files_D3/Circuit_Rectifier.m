global G C
global b;

global DIODE_LIST TD_SOURCE_LIST_SINE TD_SOURCE_LIST_PWL
DIODE_LIST = struct('diodename',{ }, 'node1', [ ], 'node2', [ ], 'Is', [ ], 'Vt', [ ]);
TD_SOURCE_LIST_SINE = struct('SourceName',{ }, 'index1', [ ], 'index2', [ ], 'A', [ ], 'Phi', [ ], 'f', [ ]);
TD_SOURCE_LIST_PWL = struct('SourceName',{ }, 'index1', [ ], 'index2', [ ], 'T', [ ], 'D', [ ]);


N = 3;
G = sparse(N,N);               
C = sparse(N,N);
b = sparse(N,1);  



volsine(1,0,2.3,60,0);
res(1,2,100)
res(3,0,1e3)
cap(3,0,50e-6)
diode('D1',2,3,1e-15,26e-3);
