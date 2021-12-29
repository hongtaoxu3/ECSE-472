function vccs(nd1,nd2,ni1,ni2,val)
% vccs(nd1,nd2,ni1,ni2,val)
% Add stamp for voltage controlled current source
% to the global circuit representation
% ni1 and ni2 are the controlling voltage nodes
% the controlled current source is between nd1 and nd2
% The controlled current (from nd1 to nd2) is val*(Vni1-Vni2)
global G
  if (ni1~=0)
    if (nd1~=0)
       G(nd1,ni1)=G(nd1,ni1)+val;
    end    
    if (nd2~=0)
       G(nd2,ni1)=G(nd2,ni1)-val;
    end
  end

  
if (ni2~=0)
    if(nd1~=0)
       G(nd1,ni2)=G(nd1,ni1)-val;
       
    if (nd2~=0)
       G(nd2,ni2)=G(nd2,ni1)+val;
    end
  end
end


