function h = histogram(image, canal)

  h = zeros(1,256);
  [filas, cols, canale] = size(image);
  
  m_in = double(image);
  
%Recorrer la imagen, tomar el valor del pixel actual, e incrementar h(pixel) en una unidad
  
  if canal==0
    
    for i=0:filas-1
      for j=0:cols-1
        pixel = m_in(i+1,j+1);
        h(pixel+1) += 1;
      endfor
    endfor
    
  else
  
  for i=0:filas-1
      for j=0:cols-1
        pixel = m_in(i+1,j+1,canal);
        h(pixel+1) += 1;
      endfor
    endfor
    
  endif
  
end