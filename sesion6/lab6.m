%----------------------------------------------------
%  		LABORATORIO 6
% 	  	 PARTE 1   
%
%Autor: Octavio Rivera Romero
%Fecha: 02-12-13
%Versión:1
%
%----------------------------------------------------
close all
clear all
clc

%----------------------------------------------------
%	Ficheros utilizados en este apartado
%	lab6.m  [mc]

%
%	[c] A completar por el alumno
%	[m] A modificar por el alumno
%
%----------------------------------------------------





%--------------------- Menú inicial
printf('Elige el apartado que quiere seleccionar\n');
printf('[1] Apartado 1: Inversion de imagen\n');
printf('[2] Apartado 2: Calculo del histograma\n');
printf('[3] Apartado 3: Transformacion BN a color\n');
printf('[4] Apartado 4: Canales de color\n');
printf('[5] Apartado 5: Histograma de color\n');
printf('[6] Apartado 6: Transformacion RGB a Brillo\n');
printf('[7] Apartado 7: Transformacion RGB a HLS\n');
printf('[8] Apartado 8: Cuantizacion HLS\n');


apartado = input('Elige la opción [1-8] ');
switch(apartado)


case 1 %Apartado 1

%----------------------------------------------------------------------
% En este primer apartado se lee un fichero imagen y se genera un % nuevo fichero con la imagen invertida
%----------------------------------------------------------------------
	
IN = imread('helicoptero.bmp'); %modificar
[filas, cols, canales] = size(IN);
imshow(IN);
pixel = IN(10,20);

%-------------------------------------------------------------------
%Completar por el alumno
% Recorrer la imagen original y crear una nueva donde el valor de
% cada pixel sea el complementario del actual, o sea, 255 menos el
% nivel de gris de la imagen original.
%
m_in = double(IN);
m_out = zeros(filas,cols);

for i=0:filas-1
  for j=0:cols-1
    m_out(i+1,j+1,1) = 255 - m_in(i+1,j+1,1);
  endfor
endfor

OUT = uint8(m_out);

%------------------------------------------------------------------
figure(2);
imshow(OUT);



case 2 %Apartado 2

%----------------------------------------------------------------------
% Calculo del histograma
%----------------------------------------------------------------------

IN = imread('helicoptero.bmp'); %modificar por el alumno
[filas, cols, canales] = size(IN);
imshow(IN);
	
h = histogram(IN, 1); %Completar la funcion histogram

figure(2);
showHisto(h);

m_in = double(IN);
m_out = zeros(filas,cols);

for i=0:filas-1
  for j=0:cols-1
    m_out(i+1,j+1,1) = 255 - m_in(i+1,j+1,1);
  endfor
endfor

OUT = uint8(m_out);

h_comp = histogram(OUT, 1);

figure(3);
showHisto(h_comp);

case 3 %Apartado 3

%----------------------------------------------------------------------
% Transformacion de imagen en niveles de grises a color
%----------------------------------------------------------------------

IN = imread('infrarojo.bmp'); %modificar por el alumno
[filas, cols, canales] = size(IN);
imshow(IN);

OUT = BN2Color(IN); %Completar por el alumno

figure();
imshow(OUT);


     

  case 4 %Apartado 4
%----------------------------------------------------------------------
% Canales de color
%----------------------------------------------------------------------

IN = imread('cuadro.bmp'); %modificar por el alumno
[filas, cols, canales] = size(IN);
imshow(IN);

[R, G, B] = Canales(IN); %Completar la funcion Canales

M = zeros(filas,cols,canales);

M(:,:,1) = R(:,:,1);
M(:,:,2) = G(:,:,2);
M(:,:,3) = B(:,:,3);

figure();
imshow(R);

figure();
imshow(G);

figure();
imshow(B);

figure();
imshow(M); 

  case 5 %Apartado 5
%----------------------------------------------------------------------
% Histogramas de color
%----------------------------------------------------------------------

IN = imread('figuras_geometricas.jpg'); %modificar por el alumno
[filas, cols, canales] = size(IN);
imshow(IN);

%Completar por el alumno
%Crear los canales de color de la imagen y luego calcular y representar los histogramas de cada
%canal

[R, G, B] = Canales(IN);

hr = histogram(R, 1);
hg = histogram(G, 2);
hb = histogram(B, 3);

figure();
showHisto(hr);

figure();
showHisto(hg);

figure();
showHisto(hb);

  case 6 %Apartado 6
%----------------------------------------------------------------------
% Transformacion RGB a Brillo
%----------------------------------------------------------------------

IN = imread('pijama.bmp'); %modificar por el alumno
[filas, cols, canales] = size(IN);
imshow(IN);

OUT = rgb2gray(IN); %Completar la funcion rgb2gray.m

figure();
imshow(OUT);


  case 7 %Apartado 7
%----------------------------------------------------------------------
% Transformacion RGB a HLS
%----------------------------------------------------------------------

IN = imread('cuadro.bmp'); %modificar por el alumno
[filas, cols, canales] = size(IN);
imshow(IN);


[R, G, B] = Canales(IN);
Rnorm = normaliza(R, 1); %Completar la funcion normaliza
Gnorm = normaliza(G, 2);
Bnorm = normaliza(B, 3);

for ind=1:filas
   for jnd=1:cols
      [h, l, s] = rgb2hls(Rnorm(ind, jnd), Gnorm(ind, jnd), Bnorm(ind, jnd)); %Completar la funcion rgb2hls
      H(ind, jnd) = h;
      L(ind, jnd) = l;
      S(ind, jnd) = s;
   endfor
endfor

%Completar por el alumno
%Crear un histograma para H 
%y almacénalo en hh.

hh = histogram(H,0);

figure();
showHisto(hh,360);


  case 8 %Apartado 8
%----------------------------------------------------------------------
% Cuantizacion HLS
%----------------------------------------------------------------------

IN = imread('cuadro.bmp'); %modificar por el alumno
[filas, cols, canales] = size(IN);
imshow(IN);
color = 1;


extractColor(IN, color); %Completar la funcion extraColor





end  % Fin del programa










