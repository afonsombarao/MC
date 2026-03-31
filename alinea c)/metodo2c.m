function [u] = metodo2c(n, q, r, a, b, y0, y1)

    A = zeros(n+1, n+1);
    b_vec = zeros(n+1, 1);

    % Função phi que satisfaz as condições de fronteira
    phi = @(x) y0 + (y1 - y0) / (b - a) .* (x - a);
    %A segunda derivada de phi (d2phi) seria 0, logo nem a definimos.

    % Novas funções de base adaptadas para o intervalo [a, b]
    v = @(x,i) (x-a).^(i+1) .* (b-x);
    
    % Segunda derivada das novas funções v(x,i)
    d2v = @(x,i) (i>0).*i.*(i+1).*(x-a).^(max(i-1,0)).*(b-x) - 2.*(i+1).*(x-a).^i;

    for i = 0:n
        for j = 0:n
            atualizarA = @(x) v(x,i) .* (d2v(x,j) + q(x) .* v(x,j));
            A(i+1, j+1) = integral(atualizarA, a, b);
        end
        atualizarb = @(x) v(x,i) .* (r(x) - q(x) .* phi(x));
        b_vec(i+1) = integral(atualizarb, a, b);
    end

    % encontrar os coeficientes c
    c = A \ b_vec;

    % solução aproximada u(x) = phi(x) + somatorio
    u = @(x) phi(x);
    for i = 0:n
        c_i = c(i+1);
        idx = i;
        u = @(x) u(x) + c_i * v(x,idx);
    end
end
