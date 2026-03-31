function [u] = metodo1c(n, q, r, a, b, y0, y1)

    A = zeros(n+1, n+1);
    b_vec = zeros(n+1, 1); % Mudei o nome para b_vec para não confundir com o limite b

    % Função phi que satisfaz as condições de fronteira e a sua derivada
    phi = @(x) y0 + (y1 - y0) / (b - a) .* (x - a);
    dphi = @(x) (y1 - y0) / (b - a) + 0.*x; 

    % Novas funções de base adaptadas para o intervalo [a, b]
    v = @(x,i) (x-a).^(i+1) .* (b-x);
    dv = @(x,i) (i+1).*(x-a).^i .* (b-x) - (x-a).^(i+1);

    for i = 0:n
        for j = 0:n
            % matriz A (iguais limites a,b)
            atualizarA = @(x) dv(x,j) .* dv(x,i) - q(x) .* v(x,j) .* v(x,i);
            A(i+1, j+1) = integral(atualizarA, a, b);
        end
        
    
        atualizarb = @(x) -r(x) .* v(x,i) - dphi(x) .* dv(x,i) + q(x) .* phi(x) .* v(x,i);
        b_vec(i+1) = integral(atualizarb, a, b);
    end

    c = A \ b_vec;

    % solução aproximada u(x) = phi(x) + somatorio
    u = @(x) phi(x);
    for i = 0:n
        c_i = c(i+1);
        idx = i;
        u = @(x) u(x) + c_i * v(x,idx);
    end
end
