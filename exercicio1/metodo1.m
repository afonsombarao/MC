function [xn1] = metodo1(epsilon,x0)
xn = x0;
f = @(x) x.^4/10 + sin(4*x) - x;
dfdx = @(x) 2*(x.^3)/5 + 4*cos(4*x) - 1;
h = @(x) x - f(x)./dfdx(x0);
xn1 = h(xn);

while abs(xn1 - xn) > epsilon
    xn = xn1;
    xn1 = h(xn);
end
