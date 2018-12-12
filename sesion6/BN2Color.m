%
function OUT = BN2Color(IN)

% Función a Completar por el alumno
[filas, cols, canales] = size(IN);

m_in = double(IN);
m_out = zeros(filas,cols,canales);

for n=1:3
	OUT(:,:,n)= zeros(size(IN));
endfor

desp=20; %Probar con diferentes valores de desplazamiento
CT = TransformationCurve(desp); %Creamos la curva de transformación
			      
	
%En primer lugar le asignamos a cada uno de los canales
%de la imagen de salida OUT, una copia de la imagen de entrada
%IN

for n=1:3
	m_out(:,:,n)= m_in;
endfor

% Recorremos las filas y columnas de la imagen de entrada y
% le asignamos el nuevo nivel RGB a la matriz OUT de acuerdo
% con la curva de transformación CT.

for i=0:filas-1
  for j=0:cols-1
    pixel1 = m_out(i+1,j+1,1);
    pixel2 = m_out(i+1,j+1,2);
    pixel3 = m_out(i+1,j+1,3);
    m_out(i+1,j+1,1) = CT(pixel1+1,1);
    m_out(i+1,j+1,2) = CT(pixel2+1,2);
    m_out(i+1,j+1,3) = CT(pixel3+1,3);
  endfor
endfor

OUT = uint8(m_out);

endfunction;


function Matriz = TransformationCurve (desp);

	Ngris =256;
	n=0: Ngris-1;
	Matriz=zeros(Ngris,3);

	% A COMPLETAR POR EL ALUMNO
	% Obtener la curva de transformación
	% que se describe en el enunciado de la práctica.
	% Para ello genere señales senoidales de periodo
	% 256, con diferentes fases y en valor absoluto
	% Por ejemplo:
	% Azul = 255*abs( sen (2*pi*n/Ngris  ) )
	% Verde = 255*abs( sen( 3*pi*(n+desp)/Ngris))
	% -------------------------------------

  Matriz(:,1) = 255*abs( sin (2*pi*n/Ngris)); %ROJO
  Matriz(:,2) = 255*abs( sin (2*pi*(n+desp)/Ngris)); %VERDE
  Matriz(:,3) = 255*abs( sin (2*pi*(n+2*desp)/Ngris)); %AZUL
  

	%--------------------------------------------
	
	Matriz = floor(Matriz);


	%------------------------------------------
	figure()
	plot(n,Matriz(:,3),'b','linewidth',1.5);
	hold on;
	plot(n,Matriz(:,2),'g','linewidth',1.5);
	plot(n,Matriz(:,1),'r','linewidth',1.5);
	grid on;
	hold off;
	%---------------------------------------------
	
endfunction


