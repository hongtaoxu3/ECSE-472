function ind(n1,n2,val)
          % ind(n1,n2,val)
          % Add stamp for inductor to the global circuit representation
          % Inductor connected between n1 and n2
          % The indjuctance is val in Henry
          % global G
          % global C
          % global b
          % Date:

     % defind global variables
     global G
     global b
     global C
     
     m = size(G,1);
     mh = m+1;

     b(mh)=0;

     G(mh,mh)=0;

     C(mh,mh)=-val;
     if (n1~=0)
       G(n1,mh)=1;
       G(mh,n1)=1;
     end
     
     if (n2~=0)
       G(n2,mh)=-1;
       G(mh,n2)=-1;
     end

     