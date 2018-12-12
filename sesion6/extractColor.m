function extractColor(image, color)
[filas, cols, bands]= size(image);
out = image;

for i=1:filas
  for j=1:cols
    %Divide r, g y b por 255
    
    [h l s] = rgb2hls(r,g,b);
    [H L S] = hlsquant(h, 12, l, 4, s, 4); %Completar la funcion hlsquant
    if (H != color)
      out(i,j,1)=0;
      out(i,j,2)=0;
      out(i,j,3)=0;
    end
  end
end

figure();
imshow(image);
figure();
imshow(out);

endfunction
