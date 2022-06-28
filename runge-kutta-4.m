
function[values] = rk4(df, t0, x0, h, N)
    values = zeros(N + 1, 1);
    values(1) = x0;
    for i = 2 : N + 1
      tk = t0 + h * (i - 2);
      xk = values(i - 1);
      k1 = h * df(tk, xk);
      k2 = h * df(tk + 1/2 * h, xk + 1/2 * h * k1);
      k3 = h * df(tk + 1/2 * h, xk + 1/2 * h * k2);
      k4 = h * df(tk + h, xk + h * k3);
      values(i) = xk + 1/6 * (k1 + 2 * k2 + 2 * k3 + k4);
    endfor
endfunction
