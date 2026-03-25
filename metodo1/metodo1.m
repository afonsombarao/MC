%mind you isto é fixeiro function e tamebm pus o codigo para dar plot noutro coiso


function [u] = metodo1(n,q,r)


A = zeros(n+1, n+1);
b = zeros(n+1, 1);

% Definição das funções de teste v_i e suas derivadas dv_i
v = @(x,i) x.^(i+1) .* (1-x);
dv = @(x,i) x.^(i).*(1+i-((2+i).*x));

for i = 0:n
    for j = 0:n
        %matriz A
        atualizarA = @(x) dv(x,j) .* dv(x,i) - q(x) .* v(x,j) .* v(x,i);
        A(i+1, j+1) = integral(atualizarA, 0, 1);
    end
    %vetor b
    atualizarb = @(x) -r(x) .* v(x,i);
    b(i+1) = integral(atualizarb, 0, 1);
    
    
end

% encontrar os coeficientes c
c = A \ b;

%solução aproximada u(x) (somatorio)
u = @(x) 0;
for i = 0:n
    u = @(x) u(x) + c(i+1) * v(x,i);
end
