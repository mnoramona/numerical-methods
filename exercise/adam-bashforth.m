function[values] = ab2_explicit(df, t0, x0, h, N, initial_aproximator)
    values = zeros(N + 1, 1);
    res = initial_aproximator(df, t0, x0, h, 1);
    values(1 : 2) = res;
    for i = 3 : N + 1
      tk1 = t0 + h * (i - 3);
      tk = t0 + h * (i - 2);
      xk1 = values(i - 2);
      xk = values(i - 1);
      values(i) = xk + h * 1/2 * (3 * df(tk, xk) - df(tk1, xk1));
    endfor
endfunction
