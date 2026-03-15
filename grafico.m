function [S, fig] = grafico()
    
    syms x
    % Definir o polinomio e calcular as raizes
    ptil = -2^(-23)*x^19+(x-1)*(x-2)*(x-3)*(x-4)*(x-5)*(x-6)*(x-7)*(x-8)*(x-9)*(x-10)*(x-11)*(x-12)*(x-13)*(x-14)*(x-15)*(x-16)*(x-17)*(x-18)*(x-19)*(x-20) ==0; 
    S = solve(ptil);
    
    % 2. Gráfico das raízes
    fig=figure; 
    plot(real(S), imag(S), "o", 'DisplayName', 'Raízes de p~');
    grid on;
    hold on;
    plot(1:20, zeros(20), "x", 'DisplayName', 'Raízes de p');
    
    title("Gráfico das raízes de p(x) e p~(x) no plano complexo");
    legend show;
    xlabel("Parte real");
    ylabel("Parte imaginária");
    hold off;
end