% Testbench for rectifier circuit




% load netlist 
Circuit_Rectifier

t1 = 0; t2 = 0.2; out = 3;
h1 = 0.0001; 
% Find transient response using backward Euler for nonlinear circuits
[tpointsh1,tranrespBEh1] = nl_transient_beuler(t1,t2,h1,out);





% Plot  results
figure(1)
hold off
clf
plot(1000*tpointsh1, tranrespBEh1,'b','LineWidth',2);

grid on
xlabel('Time (mSec)','FontSize',20)
ylabel('Output Voltage (V)','FontSize',20)




