function vol(n1,n2,val)
          % vol(n1,n2,val)
          % Add stamp for voltage source to the global circuit representation
          % global G
          % global b
          % Vn1 is the positive terminal
          % Vn2 is the negative terminal
          % vol.m
          % Author: R.K.
          % Date: Sept. 2019

     % define global variables
     global G
     global b
     global C

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

     b(xr)=val;