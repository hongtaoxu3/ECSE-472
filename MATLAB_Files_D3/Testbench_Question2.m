% Testbench for Chebychev filter
% Use opAmps with Gain of 5000

% Specify OpAmp Gain
A = 5000;

% Load netlist for filter with time domain source
Circuit_chebychev_filter_TD;

% Find transient response using backward Euler with step size of 1 microSec
[tpointsh1,tranrespBEh1] = transient_beuler(0,20e-3,1e-6,10);

% Find transient response using BE with step size of 10 microSec
[tpointsh2,tranrespBEh2] = transient_beuler(0,20e-3,1e-5,10);

% Find transient response using trapezoidal rule with step size of 10 microsec
[tpointsh2,tranrespTRh2] = transient_trapez(0,20e-3,1e-5,10);



% Plot and compare results
figure(1)
hold off
clf
plot(1000*tpointsh1, 1000*tranrespBEh1,'b','LineWidth',2);
hold on
plot(1000*tpointsh2, 1000*tranrespBEh2,'r:','LineWidth',2);
plot(1000*tpointsh2, 1000*tranrespTRh2,'g:','LineWidth',2);
grid on
xlabel('Time (mSec)','FontSize',20)
ylabel('Output Voltage (mV)','FontSize',20)
legend({'Backward Euler h=1\muSec','Backward Euler h=10\muSec', ...
    'Trapezoidal Rule h=10\muSec'},'FontSize',20);




