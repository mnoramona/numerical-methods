function I = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
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
      
    % TODO: Aplica rotatia pe fiecare canal al imaginii.
    R2 = proximal_rotate(R, rotation_angle);
    V2 = proximal_rotate(V, rotation_angle);
    A2 = proximal_rotate(A, rotation_angle);
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    I = zeros(m, n, 3);
    
    % TODO: Formeaza imaginea finala concatenand cele 3 canale de culori.
    for i = 1 : m
        for j = 1 : n
          I(i, j, 1) = R2(i, j);
          I(i, j, 2) = V2(i, j);
          I(i, j, 3) = A2(i, j);
        endfor
    endfor
    
endfunction