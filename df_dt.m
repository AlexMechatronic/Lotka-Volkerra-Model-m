%% df_dt: function description
function [dx, dy] = df_dt(x0, y0, t, a, b, c, d)
	dx = a * x0 - b * x0 * y0
    dy = - d * y0 + c * x0 * y0
endfunction