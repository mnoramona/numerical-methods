function I = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================
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
    R2 = bicubic_resize(R, p, q);
    V2 = bicubic_resize(V, p, q);
    A2 = bicubic_resize(A, p, q);
  
    I = zeros(p, q, 3);
    
    % TODO: Formeaza imaginea finala concatenand cele 3 canale de culori.
    for i = 1 : p
        for j = 1 : q
          I(i, j, 1) = R2(i, j);
          I(i, j, 2) = V2(i, j);
          I(i, j, 3) = A2(i, j);
        endfor
    endfor

endfunction