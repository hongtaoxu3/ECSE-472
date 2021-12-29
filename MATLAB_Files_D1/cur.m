function cur(n1,n2,val)
     % cur(n1,n2,val)
     % Add stamp for current source to the 
     % global circuit representation
     % global b
     % cur.m: 
     % Current direction from n1 to n2
     % Author: R.K 
     % Date: Sept 19, 2019

global b

     if (n1~=0)
        b(n1)=b(n1)-val;
     end
     
     if (n2~=0)
        b(n2)=b(n2)+val;
     end
     
     
     
     
     