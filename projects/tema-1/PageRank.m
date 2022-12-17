function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

  % "Acest graf va fi afisat intr-un fisier" -> deschid fisierul si incep citire:
  fisier = fopen(nume, 'r');
  
  % "PageRank.m va scrie un nou fisier, a carui nume este dat de numele fisierului primit ca parametru,
  % la care se concateneaza sirul .out":
  fout = fopen(strcat(nume, '.out'), 'w');
  
  %citesc din fisierul de intrare tot ce este de citit:
  N = fscanf(fisier, '%d', 1);
  for i = 1: N
    index = fscanf(fisier, '%d', 1);
    nr_vecini = fscanf(fisier, '%d', 1);
    vecini = fscanf(fisier, '%d', nr_vecini);
    L(index) = nr_vecini; 
    A(index, vecini)= 1;
  endfor
  val1 = fscanf(fisier, '%f', 1);
  val2 = fscanf(fisier, '%f', 1);

  PR = zeros(N, 1);
  
  % "Va scrie in noul fisier, pe prima linie, numarul N":
  fprintf(fout, "%d\n", N);
  
  % "va calcula vectorul P R folosind primul algoritm si-l va scrie in fisierul .out":
  R1 = Iterative(nume, d, eps);
  fprintf(fout, "%0.6f\n", R1);
  
  % "si un rand gol intre cei doi vectori":
  fprintf(fout, "\n");
  
  % "apoi va calcula vectorul P R folosind al doilea algoritm si-l va scrie in fissierul .out":
  R2 = Algebraic(nume, d);
  fprintf(fout, "%0.6f\n", R2);
  
  % "Se va lasa in fisierul de iesire un spatiu liber":
  fprintf(fout, "\n");
  
  % sortez descrescator vectorul de la al doilea algoritm:
  PR = sort(R2, 'descend');
  
  % imi fac o matrice in care salvez ce trebuie sa afisez in final:
  F = zeros(N, 3);
  
  % parcurg matricea sortata PR:
  for i = 1: N 
    % parcurg matricea R2 initiala:
    for j = 1: N 
       if PR(i) == R2(j)
         % salvez indicele:
         F(i, 1) = i; 
         
         % salvez nodul a carui PageRank este PR1(i):
         F(i, 2) = j;
         
         % salvez valoarea u(PR1(i)):
         F(i, 3) = Apartenenta(PR(i), val1, val2);
       endif
    endfor
  endfor
  
  for i = 1: N
    fprintf(fout, '%d %d %f\n', F(i, 1), F(i, 2), F(i, 3));
  endfor
  fclose(fisier);
  fclose(fout);
  endfunction
  
  