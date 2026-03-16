function [xn1] = metodopontofixo(epsilon, x0)
xn = x0;
h = @ (p,q) ([12.*p.^2+4.*q-42 4.*p+4.*q;4.*p+4.*q 12.*q.^2+4.*p-26]);
F = @ (p,q) ([4.*p.^3+4.*p.*q-42.*p+2.*q.^2-14;4.*q.^3+4.*p.*q-26.*q+2.*p.^2-22]);
G = @(x) -inv(h(x(1),x(2)))*F(x(1),x(2)) + x;
xn1 = G(xn);

while abs(xn - xn1) > epsilon
    xn = xn1;
    xn1 = G(xn);
end
