%%
function showHisto(h,niveles)
if nargin<2
	niveles=256;
	h=h(1:niveles);
endif

x=[1:niveles];
%stem(x,h);
bar(x,h,0.1);
axis([1 niveles-1]);
colormap(gray(255));
colorbar ("SouthOutside", "xtick", []);

end;
