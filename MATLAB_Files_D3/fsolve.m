function r = fsolve(fpoints ,out)
%  fsolve(fpoints ,out)
%  Obtain frequency domain response
% global variables G C b
% Inputs: fpoints is a vector containing the fequency points at which
%         to compute the response in Hz
%         out is the output node
% Outputs: r is a vector containing the value of
%            of the response at the points fpoint


% define global variables
global G C b

m=size(G,1);
m2=size(fpoints,2);
r=zeros(1,m2);

for u=1:m2
  A=G+((1j*fpoints(1,u)*2*pi)*C);
  x=A\b;
  r(1,u)=x(out,1);
end
end



