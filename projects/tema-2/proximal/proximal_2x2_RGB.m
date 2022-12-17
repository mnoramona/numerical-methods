function I = proximal_2x2_RGB(img, STEP = 0.1)
    % ==============================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte intermediare echidistante.
    % img este o imagine colorata RGB -Red, Green, Blue.
    % =============================================================================================
    [m, n, c] = size(img);
    
    R = zeros(m, n);
    V = zeros(m, n);
    A = zeros(m, n);
    
    % TODO: Extrage canalul rosu al imaginii.
      for i = 1 : m
        for j = 1 : n
          R(i, j) = img(i, j, 1);
        endfor
      endfor
    % TODO: Extrage canalul verde al imaginii.
      for i = 1 : m
        for j = 1 : n
          V(i, j) = img(i, j, 2);
        endfor
      endfor
    % TODO: Extrage canalul albastru al imaginii.
      for i = 1 : m
        for j = 1 : n
          A(i, j) = img(i, j, 3);
        endfor
      endfor
    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    R2 = proximal_2x2(R, STEP);
    V2 = proximal_2x2(V, STEP);
    A2 = proximal_2x2(A, STEP);
    
    x = length(R2);
    I = zeros(x, x, 3);
    
    % TODO: Formeaza imaginea finala concatenand cele 3 canale de culori.
    for i = 1 : x
        for j = 1 : x
          I(i, j, 1) = R2(i, j);
          I(i, j, 2) = V2(i, j);
          I(i, j, 3) = A2(i, j);
        endfor
    endfor
endfunction
