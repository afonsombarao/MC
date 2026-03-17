function [xn, A] = metodo2eps(k, x0)
xn = x0;
g = @(x) x.^4/10 + sin(4*x); 
Psi = @(x) (x.*g(g(x))-g(x).^2)./(g(g(x))-2*g(x)+x);
xn1 = Psi(xn);
A = [xn,xn1]

while abs(xn1 - xn) > epsilon
    xn = xn1;
    xn1 = h(xn);
    A = [A,xn1]
end
