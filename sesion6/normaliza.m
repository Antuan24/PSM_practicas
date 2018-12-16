function normal = normaliza(IN, canal)

    %Dividir entre 255 cada pixel, usar castings para convertir a float antes de dividir
    
    [filas, cols, canal] = size(IN);
    m_in = double(IN);
    y = zeros(filas, cols, canal);
    
    for i=0:filas-1
      for j=0:cols-1
        y(i+1,j+1,canal) = m_in(i+1,j+1,canal)/255;
      endfor
    endfor
    
    normal = uint8(y);
    
end
