function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  
  % "a si b sunt valori calculate astfel incat u(x) sa fie o functie continua":
  % functia u este continua <=> a * val1 + b = 0 si a * val2 + b = 1;
  % inmultesc prima ecuatie cu (-1) si le adun => a(val2 - val1) = 1 = > a = 1/(val2 - val1);
  % inlocuiesc a-ul in prima ecuatie: (1/(val2 - val1)) * val1 + b = 0 => b = val1/(val1 - val2);
  
  a = 1/(val2 - val1);
  b = val1/(val1 - val2);
  y = 0;
  if x < val1
    y = 0;
  endif
  if x > val2
    y = 1;
  endif
  if x >= val1
    if x <= val2
    y = a * x + b;
    endif
  endif
endfunction
  
  
  
  

	