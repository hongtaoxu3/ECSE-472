

clear all

% Define the Vi points at which we need to 
Vi_vec = linspace(-10,10,100);

for I = 1:length(Vi_vec)
    Vi=Vi_vec(I);
    Sedra4_93 % Call the netlist.
              % We are calling the netlist repeatedly because Vi has
              % changed. There are more efficient ways to do this. It is ok
              % for very small circuits like this one.
              
    Xdc = dcsolvecont(10,1e-6);
    Vo(I)=Xdc(3); %Store the voltage at the output node
end

figure(1)
hold off
clf
plot(Vi_vec,Vo)
grid
xlabel('Vi (Volts)')
ylabel('Vo (Volts)')
title('Question 2: Vo vs Vi')