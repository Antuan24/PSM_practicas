%
function [R, G, B] = Canales(IN)

[filas, cols, canal] = size(IN);

%Completar por el alumno
%Crear tres imagenes de tres canales cada una R, G y B
%R solo tendra valores utiles en el canal 1
%G en el canal 2
%B en el canal 3
%Los canales que no tengan valores utiles seran 0
%Los pixeles del canal con informacion util tendran el mismo valor que 
%el pixel correspondiente de la imagen original en dicho canal

R = zeros(filas,cols,canal);
G = zeros(filas,cols,canal);
B = zeros(filas,cols,canal);

R(:,:,1) = IN(:,:,1);
G(:,:,2) = IN(:,:,2);
B(:,:,3) = IN(:,:,3);

end;