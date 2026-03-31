function [u] = metodo2(n, q, r)

    A = zeros(n+1, n+1);
    b = zeros(n+1, 1);

    % Definição das funções de teste v e sua segunda derivada d2v
    v = @(x,i) x.^(i+1) .* (1-x);
    d2v = @(x,i) i*x.^(i-1).*((i+1)-(i+2).*x) - (i+2)*x.^i;

    for i = 0:n
        for j = 0:n
            % matriz A: integral de v_i * (v_j'' + q * v_j)
            atualizarA = @(x) v(x,i) .* (d2v(x,j) + q(x) .* v(x,j));
            A(i+1, j+1) = integral(atualizarA, 0, 1);
        end
        % vetor b: integral de v_i * r
        atualizarb = @(x) v(x,i) .* r(x);
        b(i+1) = integral(atualizarb, 0, 1);
    end

    % encontrar os coeficientes c
    c = A \ b;

    % solução aproximada u(x) (somatorio)
    u = @(x) 0;
    for i = 0:n
        ci = c(i+1);
        vi = @(x) v(x,i);
        u_old = u;
        u = @(x) u_old(x) + ci * vi(x);
    end
