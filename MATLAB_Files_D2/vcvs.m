function vcvs(nd1,nd2,ni1,ni2,val)
% vcvs(nd1,nd2,ni1,ni2,val)
% Add stamp for a voltage controlled voltage source
% to the global circuit representation
% val is the gain of the vcvs
% ni1 and ni2 are the controlling voltage nodes
% nd1 and nd2 are the controlled voltage nodes
% The relation of the nodal voltages at nd1, nd2, ni1, ni2 is:
% Vnd1 - Vnd2 = val*(Vni1 - Vni2)


global G
global b
global C


  m = size(G,1);
  mh = m+1;

  b(mh)=0;
  G(mh,mh)=0;
  C(mh,mh)=0;

  if(ni1~=0)
       G(mh,ni1)=G(mh,ni1)-val;
  end
  
  if(ni2~=0)
       G(mh,ni2)=G(mh,ni2)+val;
  end
  
  if(nd1~=0)
       G(mh,nd1)=G(mh,nd1)+1;
       G(nd1,mh)=G(nd1,mh)+1;
  end
  
  if(nd2~=0)
       G(mh,nd2)=G(mh,nd2)-1;
       G(nd2,mh)=G(nd2,mh)-1;
  end




    