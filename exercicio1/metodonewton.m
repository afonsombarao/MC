function [xn1] = metodonewton(epsilon,x0)

xn = x0; % atribuicao da variavel iterativa
f = @(x) x.^4/10 + sin(4*x) - x; % funcao que queremos aproximar os zeros
dfdx = @(x) 2*(x.^3)/5 + 4*cos(4*x) - 1;
h = @(x) x - f(x)./dfdx(x); % funcao iteradora do metodo de newton
xn1 = h(xn);

% ciclo que calcula iterativamente o proximo ponto ate ter |xn1 - xn|<= epsilon
while abs(xn1 - xn) > epsilon
    xn = xn1;
    xn1 = h(xn);
end
