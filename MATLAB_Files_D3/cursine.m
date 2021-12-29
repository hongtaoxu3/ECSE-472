function cursine(n1,n2,A,f,phi)
     % cur(n1,n2,A,f,phi)
     % Add stamp for current source to the global circuit representation
     % This source is used in transient time domain simulation.
     % The value of the source is A*sin(2*pi*f + pi*phi/180)
     % A is in Volts, f is in Hertz, and phi is in degrees
     % global b
     % cur.m: 
     % Current direction from n1 to n2
     % Author: R.K 
     % Date: Sept 19, 2019

     global b
     global TD_SOURCE_LIST_SINE
     
     %current number of sources
     nbSources = size(TD_SOURCE_LIST_SINE,2);

     N = nbSources + 1;  %index of next source
     
     TD_SOURCE_LIST_SINE(N).SourceName = 'CurrentSource';
     TD_SOURCE_LIST_SINE(N).A = A;
     TD_SOURCE_LIST_SINE(N).f = f; 
     TD_SOURCE_LIST_SINE(N).Phi = phi;
     
     
     if (n1~=0)
        TD_SOURCE_LIST_SINE(N).index2 = n1;
     else
        TD_SOURCE_LIST_SINE(N).index2 = 0;
     end
     
     if (n2~=0)
        TD_SOURCE_LIST_SINE(N).index1 = n2;
     else
        TD_SOURCE_LIST_SINE(N).index1 = 0;
     end
     
     
     
     
     