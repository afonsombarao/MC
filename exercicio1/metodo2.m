function [xn1] = metodo2(epsilon, x0)
xn = x0;
g = @(x) x.^4/10 + sin(4*x); 
Psi = @(x) (x.*g(g(x))-g(x).^2)./(g(g(x))-2*g(x)+x);
xn1 = Psi(xn);

while abs(xn - xn1) > epsilon
    xn = xn1;
    xn1 = Psi(xn);
end
