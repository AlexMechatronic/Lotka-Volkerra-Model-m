clear all
clf
% x son presas.... y son depredadores
% limites del modelo... unidades en meses
t_i = 0;  	% lower
t_f = 200;  % upper

% obtiene el tiempo
N = 500;
t = linspace(t_i, t_f, N);

% valores iniciales del modelo
x0 = 125; 	% presas iniciales
y0 = 100; 	% depredadores iniciales

% parametros del modelo
a = .1;  	% tasa de crecimiento de presas
b = .02;  	% tasa de decrecimiento por interaccion en presas o taza de exito en la caza del depredador
c = .3;  	% tasa de éxito en la caza y cuánto alimenta cazar una presa al depredador.
d = .01;  	% tasa de decrecimiento de los depredadores


% puntos criticos del sistema osea valores iniciales
%       1    2
x_pc = [0, d / c];
y_pc = [0, a / b];

[fx_an, fy_an] = analitic_laplace(a, b, c, d, x0, y0, t);


% subplot(2,1,1)
plot(t, fx_an, 'k', t, fy_an, 'b');
grid();
xlabel("meses");
ylabel("especimens");
legend("pesas","depredadores")

% subplot(2,1,2);
% x_max = max(fx_an(:)) * 1.05;
% y_max = max(fy_an(:)) * 1.05;
% 
% x = linspace(0, x_max, 25);
% y = linspace(0, y_max, 25);
% 
% [xx, yy] = meshgrid(x, y);
% [uu, vv] = df_dt(xx, yy, t_i, a, b, c, d);
% norml = sqrt(uu.^2 + vv.^2);
% uu = uu / norml;
% vv = vv / norml;
% 
% quiver(xx, yy, uu, vv, norml)
% plot(fx_an(:), fy_an(:))