function volsine(n1,n2,A,f,phi)
          % volsine(n1,n2,A,F,phi)
          % Add stamp for voltage source to the global circuit representation
          % This source is used in transient time domain simulation.
          % The value of the source is A*sin(2*pi*f + pi*phi/180)
          % A is in Volts, f is in Hertz, and phi is in degrees
          % global G
          % global b
          % Vn1 is the positive terminal
          % Vn2 is the negative terminal
          % vol.m
          % Author: R.K.
          % Date: Oct. 2019

     % define global variables
     global G
     global b
     global C
     global TD_SOURCE_LIST_SINE
     
     %current number of sources
     nbSources = size(TD_SOURCE_LIST_SINE,2);

     N = nbSources + 1;  %index of next source

     d = size(G,1);       %current size of the MNA
     xr = d+1;            %new row

     b(xr)=0;             %add new row
                                % Matlab automatically increases the size of a matrix if you use an index
                                % that is bigger than the current size.
     G(xr,xr)=0;        %add new row/colomn
     C(xr,xr)=0;        %add new row/colomn



     if (n1~=0)
        G(n1,xr)=1;
        G(xr,n1)=1;
     end

     if (n2~=0)
        G(n2,xr)=-1;
        G(xr,n2)=-1;
     end

     TD_SOURCE_LIST_SINE(N).SourceName = 'VoltageSource';
     TD_SOURCE_LIST_SINE(N).index1 = xr;
     TD_SOURCE_LIST_SINE(N).index2 = 0;
     TD_SOURCE_LIST_SINE(N).A = A;
     TD_SOURCE_LIST_SINE(N).f = f; 
     TD_SOURCE_LIST_SINE(N).Phi = phi;
     