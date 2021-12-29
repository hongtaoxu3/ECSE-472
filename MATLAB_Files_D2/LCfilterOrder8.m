% LC filter 8th order
% output at node 6

global G C b

N = 6; % Number of nodes
G = zeros(N,N);               
C = zeros(N,N);
b = zeros(N,1);  

vol(1,0,1)

res(1,2,R1)
ind(2,3,L1)
cap(3,0,C1)
ind(3,4,L2)
cap(4,0,C2)
ind(4,5,L3)
cap(5,0,C3)
ind(5,6,L4)
cap(6,0,C4)
res(6,0,R2)