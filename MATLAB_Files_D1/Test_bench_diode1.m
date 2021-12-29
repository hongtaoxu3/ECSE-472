% Test Bench to Run for Diode Circuit

clear all

Circuit_diodeckt1

[Xdc dX] = dcsolve([0; 0; 0],1e-6);

Xdc
figure(1)
hold off
clf
semilogy(dX)
xlabel('Iteration Number')
ylabel('norm of \DeltaX')
grid