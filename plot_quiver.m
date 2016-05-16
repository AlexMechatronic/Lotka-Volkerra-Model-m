%% plot_quiver: function description
function [] = plot_quiver(x,  % valores de x
								 y,  % de y
								 u,  % de la derivada de x
								 v,  % de la derivada de y
								 px, % punto critico en x
								 py) % punto critico en y
	
	%normal = sqrt(x.^2+y.^2);  % normalized
	%x_normal = x./normal;
	%y_normal = y./normal;

	[xx,yy] = meshgrid(0:0.5:10;

	%Ex = -xx./(xx.^2+yy.^2).^(3/2);
	%Ey = -yy./(xx.^2+yy.^2).^(3/2);

	Z = a*c/b*xx;
	[DX,DY] = gradient(Z,.4,.4);

	figure
	contour(X,Y,Z)
	hold on
	quiver(X,Y,DX,DY)
	hold off

	%quiver(xx,yy,Ex,Ey);
endfunction