function[s] = msimps(f, a, b, m)
    h = (b - a)/(2 * m);
    s1 = 0;
    s2 = 0;
    for k = 1 : m
      x = a + h * (2 * k - 1);
      s1 = s1 + feval(f, x);
    endfor
    for k = 1 : m - 1
      x = a + h * 2 * k;
      s2 = s2 + feval(f, x);
    endfor
    s = h * (feval(f, a) + feval(f, b) + 4 * s1 + 2 * s2) /3;
endfunction
