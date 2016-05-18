clear all
clf
% x son presas.... y son depredadores
% limites del modelo... unidades en meses
t_i = 0;  	% lower
t_f = 200;  % upper

% obtiene el tiempo
N = 40;
t = linspace(t_i, t_f, N);

% valores iniciales del modelo
x0 = 75; 	% presas iniciales
y0 = 50; 	% depredadores iniciales

% parametros del modelo
a = .1;  	% tasa de crecimiento de presas
b = .02;  	% tasa de decrecimiento por interaccion en presas o taza de exito en la caza del depredador
c = .3;  	% tasa de éxito en la caza y cuánto alimenta cazar una presa al depredador.
d = .01;  	% tasa de decrecimiento de los depredadores


% puntos criticos del sistema osea valores iniciales
%       1    2
% x_pc = [0, d / c];
% y_pc = [0, a / b];

[fx_an, fy_an] = analitic_laplace(a, b, c, d, x0, y0, t);
[fx_num, fy_num] = numeric_solve_EDO(x0, y0, t, a, b, c, d);

subplot(2,1,1)
plot(t, fx_num, 'k', t, fy_num, 'b');
grid();
xlabel("meses");
ylabel("especimens");
legend("pesas","depredadores")

subplot(2,1,2)
plot(t, fx_an, 'k', t, fy_an, 'b');
grid();
xlabel("meses");
ylabel("especimens");
legend("pesas","depredadores")
