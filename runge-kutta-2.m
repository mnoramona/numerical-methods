function[values] = rk2_heun(df, t0, x0, h, N)
    values = zeros(N + 1, 1);
    values(1) = x0;
    for i = 2 : N + 1
      tk = t0 + h * (i - 2);
      xk = values(i - 1);
      k1 = h * df(tk, xk);
      k2 = h * df(tk + h, xk + k1);
      values(i) = xk + 1/2 * (k1 + k2);
    endfor
endfunction
