function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Aplic Gram-Schimdt rezultand: A = Q * R, unde:
  % A este matricea care trebuie inversata;
  % Q este baza ortonormata
  % R este o matrice superior triunghiulara
  % B este matricea A^(-1);
  
  % salvez dimensiunile matricei A:
  [l k]=size(A);
  
  % mi se pare mai usor sa lucrez cu N din obisnuinta:
  N = l;
  
  %initializez matricile folosite in formula:
  R = zeros(l, k);
  Q = zeros(l, k);
  B = zeros(N, N);
  
  % am ales sa salvez matricea A intr-o copie C sa nu fac modificari asupra acesteia:
  C = A;
  
  % aplic algoritmul Gram-Schmidt invatat in laboratorul 3:
  for i = 1: N
    R(i, i) = norm(C(:, i));
    Q(:, i) = C(:, i)/R(i, i);
    for j = i+1: N
      R(i, j) = Q(:, i)' * C(:, j);
      C(:, j) = C(:, j) - Q(:, i) * R(i, j);
    endfor
  endfor
  
  % rezulta A = Q * R
  
  % trebuie rezolvat sistemul de ecuatii: A * xi = ei;
  % A * xi = ei;
  
  % inlocuiesc A = Q * R:
  % Q * R * xi = ei
  
  % inmultesc la stanga cu Q^(-1)
  % matricea Q fiind ortonormata rezulta ca inversa acesteia este egala cu transpusa sa
  % R * xi = Q' * ei
  
  % salvez termenul din stanga intr-o alta matrice:
  D = Q' * eye(N);
  
  % rezolv cele n sisteme de ecuatii, de jos in sus:
  for j = 1: N
    for i = N: -1: 1
      
      % voiam sa salvez termenul R(i, i+1:N)*B(i+1:N,j) intr-o valoare 'inmultire' pe care o calculam in alt "for"
      % dar imi dadea gresit doar pentru prima linie asa ca am facut direct:
      B(i, j) = (D(i, j) - R(i, i+1:N)*B(i+1:N,j))/R(i, i);
    endfor
  endfor
  endfunction
  
  
  
