function [xn, A] = metodo2(k, x0)
xn = x0;
g = @(x) x.^4/10 + sin(4*x); 
Psi = @(x) (x.*g(g(x))-g(x).^2)./(g(g(x))-2*g(x)+x);
%xn1 = Psi(xn);
A = [xn]%,xn1]

for i=1:k
    %xn = xn1;
    xn = Psi(xn);
    A = [A,xn]
end
