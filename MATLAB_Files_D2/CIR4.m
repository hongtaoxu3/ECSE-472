% Active Filte Circuit
% Output at node 4

global   G C b

r1 = 1200;
     r2 = 1010;
     r3 = 1140;
     r4 = 1450;
     r5 = 1540;




G = zeros(4,4);               
C = zeros(4,4);
b = zeros(4,1);               

vol(1,0,1);
res(1,2,r1);
cap(2,0,200e-9);
res(2,0,r2);
vccs(3,0,2,0,1/r3);
res(3,0,r4);
vcvs(4,0,3,0,-10);
res(4,0,r5);