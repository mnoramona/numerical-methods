function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  % partea de citire este identica cu cea folosita la Iterative, 
  % asemenea si pentru matricea de adiacenta A, L si M:
  fisier = fopen(nume, 'r');
  N = fscanf(fisier, '%d', 1);
  L = zeros(N, 1);
  A = zeros(N, N);
  for i = 1: N
    index = fscanf(fisier, '%d', 1);
    nr_vecini = fscanf(fisier, '%d', 1);
    vecini = fscanf(fisier, '%d', nr_vecini);
    L(index) = nr_vecini; 
    A(index, vecini)= 1;
  endfor
  val1 = fscanf(fisier, '%d', 1);
  val2 = fscanf(fisier, '%d', 1);
  R = zeros(N, 1);
  M = zeros(N, N);
  for i = 1: N
    for j = 1: N
      if(A(j, i) == 1)
        M(i, j) = 1/L(j);
      endif
    endfor
  endfor
  % vectorul coloana plin de 1:
  v = ones(N, 1);
  
  % separat un termen din formula:
  t = v * (1 - d)/N;
  
  % am initializat matricea D care va fi matricea pe care doresc sa o inversez:
  D = zeros(N, N);
  
  % aplic formula:
  % R = d * M * R + t;
  % R - d * M * R = t;
  % (I - d * M) * R = t1 
  % D * R = t /D ^(-1)
  % R = D^(-1) * t
  
  % din formula rezulta ca am nevoie de inversa matricei (I - d * M) (pe care am salvat-0 in D):
  D = eye(N) - d * M;
  
  % Di reprezinta inversa matricei dorite:
  Di = PR_Inv(D);
  
  % continui formula si ajung la rezultat pe care il salvez in R:
  R = Di * t;
  fclose(fisier);
  endfunction
  
  
  
  