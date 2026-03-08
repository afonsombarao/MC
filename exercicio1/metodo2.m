function [xn1] = metodo2(epsilon, x0)

xn = x0; % atribuicao da variavel iterativa
g = @(x) x.^4/10 + sin(4*x); % funcao que queremos aproximar os pontos fixos
Psi = @(x) (x.*g(g(x))-g(x).^2)./(g(g(x))-2*g(x)+x); % funcao iteradora do metodo 2
xn1 = Psi(xn);

% ciclo que calcula o proximo ponto ate ter |xn1 - xn|<= epsilon
while abs(xn - xn1) > epsilon
    xn = xn1;
    xn1 = Psi(xn);
end
