          function cap(n1,n2,val)
          % cap(n1,n2,val)
          % Add stamp for capacitor to the global circuit representation
          % global C
          % cap.m: 
          % Author: R.K.
          % Date:

         % define global variables
         global C

          if (n1~=0)
             C(n1,n1)=C(n1,n1)+val;
          end

          if (n2~=0)
             C(n2,n2)=C(n2,n2)+val;
          end

          if (n1~=0)&(n2~=0)
             C(n1,n2)=C(n1,n2)-val;
             C(n2,n1)=C(n2,n1)-val;
          end