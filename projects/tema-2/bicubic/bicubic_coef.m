function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaza coeficientii de Interpolare Bicubica pentru 4 puncte alaturate
    % =========================================================================

    % TODO: Calculeaza matricile intermediare.
    a1 = [1 0 0 0; 0 0 1 0; -3 3 -2 -1; 2 -2 1 1];
    a2 = zeros(4, 4);
    a3 = [1 0 -3 2; 0 0 3 -2; 0 1 -2 1; 0 0 -1 1];
    
    % imi pare extrem rau dar am ales sa le iau pe fircare in parte, mult mai ok
    
    a2(1, 1) = f(y1, x1);
    a2(1, 2) = f(y2, x1);
    a2(1, 3) = Iy(y1, x1);
    a2(1, 4) = Iy(y2, x1);
    
    a2(2, 1) = f(y1, x2);
    a2(2, 2) = f(y2, x2);
    a2(2, 3) = Iy(y1, x2);
    a2(2, 4) = Iy(y2, x2);
    
    a2(3, 1) = Ix(y1, x1);
    a2(3, 2) = Ix(y2, x1);
    a2(3, 3) = Ixy(y1, x1);
    a2(3, 4) = Ixy(y2, x1);
    
    a2(4, 1) = Ix(y1, x2);
    a2(4, 2) = Ix(y2, x2);
    a2(4, 3) = Ixy(y1, x2);
    a2(4, 4) = Ixy(y2, x2);
    
    % TODO: Converteste matricile intermediare la double.
    a1 = double(a1);
    a2 = double(a2);
    a3 = double(a3);
    
    % TODO: Calculeaza matricea finala.
    A = a1 * a2 * a3;
endfunction