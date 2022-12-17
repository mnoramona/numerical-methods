function A = proximal_2x2(f, STEP = 0.1)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute în punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distanta dintre doua puncte succesive.
    % ===================================================================================
    
    % TODO: Defineste coordonatele x si y ale punctelor intermediare.
      j = 1;
    for i = 1 : STEP : 2
      x_int(j, 1) = i;
      y_int(j, 1) = i;
      
      j++;
    endfor

    % Se afla numarul de puncte.
    n = length(x_int);

    % TODO: Cele 4 puncte încadratoare vor fi aceleasi pentru toate punctele din interior.
    % Salvez coordonatele celor 4 colturi
    x1 = x_int(1, 1);
    y1 = y_int(1, 1);
    x2 = x_int(n, 1);
    y2 = y_int(n, 1);
    
    % O sa salvez functiile separat pentru ca de ce nu
    p1 = f(x1, y1);
    p2 = f(x2, y1);
    p3 = f(x1, y2);
    p4 = f(x2, y2);
    
    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    A = zeros(n, n);  
  
    % Se parcurge fiecare pixel din imaginea finala.
    for i = 1 : n
        for j = 1 : n
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
            % TODO: Calculeaza pixelul din imaginea finala.
            if i <= n/2 
              if j <= n/2
                A(i, j) = p1;
              endif
              if j > n/2
                A(i, j) = p3;
              endif
            endif
            % verific fiecare pozitie in parte
            if i > n/2 
              if j <= n/2
                A(i, j) = p2;
              endif
              if j > n/2
                A(i, j) = p4;
              endif
            endif
        endfor
    endfor

endfunction