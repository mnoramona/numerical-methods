function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  % "Acest graf va fi afisat intr-un fisier" -> deschid fisierul si incep citire:
  fisier = fopen(nume, 'r');
  
  % "pe prima linie va fi dat numarul N" -> citesc N:
  N = fscanf(fisier, '%d', 1);
  
  % initializez vectorul coloana L pentru formula:
  L = zeros(N, 1);
  
  % initializez matricea de adiacenta A:
  A = zeros(N, N);
  
  % "pe urmatoarele linii vor fi date listele de vecini" -> incep citirea listelor de vecini:
  for i = 1: N
    
    % "o linie va incepe cu numarul nodului" -> numar pe care l-am salvat in index:
    index = fscanf(fisier, '%d', 1);
    
    % "numarul de noduri cu care se invecineaza nodul" -> numar pe care l-am salvat in nr_vecini:
    nr_vecini = fscanf(fisier, '%d', 1);
    
    % "urmatoarele numere reprezinta nodurile cu care se invecineaza nodul respectiv" -> salvez vecinii intr-un vector:
    vecini = fscanf(fisier, '%d', nr_vecini);
    
    % salvez in L numarul de vecini:
    L(index) = nr_vecini;
   
    % fac matricea de adiacenta:
    A(index, vecini)= 1;
  endfor
  
  % citesc cele 2 valori de la finalul fisierului:
  val1 = fscanf(fisier, '%d', 1);
  val2 = fscanf(fisier, '%d', 1);
  
  % initializez matricile pentru formula:
  R = zeros(N, 1);
  M = zeros(N, N);
  
  % aplic formula:
  for i = 1: N
    for j = 1: N
      if(A(j, i) == 1)
        M(i, j) = 1/L(j);
      endif
    endfor
  endfor
  
  % am ales sa fac separat vectorul coloana plin de '1':
  v = ones(N, 1);
  
  % am ales sa scriu separat al doilea termen al adunarii din formula:
  t = ((1 - d)/N) * v;
  
  % Ri de la initial care reprezinta R(t):
  Ri = zeros(N, 1);
  
  % Rf de la final care reprezinta R(t + 1):
  Rf = (ones(N, 1))./N;
  
  % cat timp norma diferentei e mai mare decat eroarea primita, updatez Ri si Rf sa fac urmatoarea iteratie:
  while((norm(Rf - Ri)) > eps)
    Ri = Rf;
    Rf = d * M * Ri + t;
  endwhile
  
  % inchid fisierul:
  fclose(fisier);
  
  % salvez ultima iteratie:
  R = Rf;
  endfunction
  