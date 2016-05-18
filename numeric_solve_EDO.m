%% numeric_solve_EDO: function description
function [fx, fy] = numeric_solve_EDO(x0, y0, t, a, b, c, d)
	h = t(2)-t(1);  % incremento
	N = length(t) - 1;  % numero de pasos

	fx = x0;
	fy = y0;
	for n = 1 : N
		% k_n de x
		k1_x = a*fx(n)-b*fx(n)*fy(n);
		k2_x = a*(fx(n)+1/2*h*k1_x)-b*(fx(n)+1/2*h*k1_x)*(fy(n)+1/2*h*k1_x);
		k3_x = a*(fx(n)+1/2*h*k2_x)-b*(fx(n)+1/2*h*k2_x)*(fy(n)+1/2*h*k2_x);
		k4_x = a*(fx(n)+1/2*h*k3_x)-b*(fx(n)+1/2*h*k3_x)*(fy(n)+1/2*h*k3_x);
		%k_n de y
		k1_y = c*fx(n)*fy(n)-d*fy(n);
		k2_y = c*(fx(n)+1/2*h*k1_y)*(fy(n)+1/2*h*k1_y)-d*(fy(n)+1/2*h*k1_y);
		k3_y = c*(fx(n)+1/2*h*k2_y)*(fy(n)+1/2*h*k2_y)-d*(fy(n)+1/2*h*k2_y);
		k4_y = c*(fx(n)+1/2*h*k3_y)*(fy(n)+1/2*h*k3_y)-d*(fy(n)+1/2*h*k3_y);

		%se calcula n+1
		fx(n+1) = fx(n) + h/6*(k1_x+2*k2_x+2*k3_x+k4_x);
		fy(n+1) = fy(n) + h/6*(k1_y+2*k2_y+2*k3_y+k4_y);
	end
endfunction