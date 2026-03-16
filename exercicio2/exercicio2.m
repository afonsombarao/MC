
% (e)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555

x0 = [2.9;1.9];
z = [3;2];


h = @ (p,q) ([12.*p.^2+4.*q-42 4.*p+4.*q;4.*p+4.*q 12.*q.^2+4.*p-26]);
F = @ (p,q) ([4.*p.^3+4.*p.*q-42.*p+2.*q.^2-14;4.*q.^3+4.*p.*q-26.*q+2.*p.^2-22]);
G = @(x) -inv(h(x(1),x(2)))*F(x(1),x(2)) + x;

[xn] = metodopontofixo2e(10^-4, x0) % converge para valores proximos de (3,2)

% estimativa para o coeficiente assintotico do metodo do ponto fixo proposto
xn1 = G(xn)
abs(z - xn1)./abs(z - xn)
