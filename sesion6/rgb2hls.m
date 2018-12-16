function [h, l, s] = rgb2hls(r,g,b)

pixel = [r, g, b];

%Implementar el algoritmo visto en clase

  MAX = max([r,g,b]);
  MIN = min([r,g,b]);

  l = (MAX+MIN)/2;

  if(MAX==MIN)

      s=0;
      h=-1000;
      
  elseif (l<=0.5)
   
      s=(MAX-MIN)/(2*l);
    
  else   
    
      s=(MAX-MIN)/(2-2*l);
    

  endif

  if(MAX==MIN)

      h=-1000;
  elseif(MAX==r)
      h= 60*(g-b)/(MAX-MIN);
      if(h<0)
        h=h+360;
      endif
  elseif(MIN==g)
      h=120+(60*(b-r)/(MAX-MIN));
  else            
      h= 240 + (60*(r-g)/(MAX-MIN));
  endif

end