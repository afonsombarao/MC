% Exercício 1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (a)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

zero = @(x) zeros(size(x));
f = @(x) x.^4/10 + sin(4*x) - x;
dfdx = @(x) 2*(x.^3)/5 + 4*cos(4*x) - 1;
g = @(x) x.^4/10 + sin(4*x); 
dgdx = @(x) 2*(x.^3)/5 + 4*cos(4*x);

y1 = zero(x);
y2 = f(x);

x = linspace(-2,2,1000);

figure;
plot(x, y2);
hold on;
plot(x, y1);
hold off;

saveas(gcf, 'my_plot.png');

z1 = fzero(f, -0.6);
z2 = fzero(f, 0);
z3 = fzero(f, 0.75);
z4 = fzero(f, 1.75);

dgdx(z1)
dgdx(z2)
dgdx(z3)
dgdx(z4)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (b)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% método de newton x_n+1 = h(x_n) = x_n - f(x_n)/f'(x_n)

h = @(x) x - f(x) ./ dfdx(x);

x = [-1.2, -0.2, 1.0, 2.0];

for i = 1:5
    x = h(x);
end

x

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (c)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% variacao do método de newton x_n+1 = h(x_n) = x_n - f(x_n)/f'(x_0)

x0 = [-1.2; -0.2; 1; 2];

h0 = @(x) x - f(x) ./ dfdx(x0);

y = x0;

B = y;

for i = 1:5
    y = h0(y);
    B = [B, y];
end

y

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (d)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[x] = metodo2(10^-8, -0.5)
[x] = metodo2(10^-8, -0.05)
[x] = metodo2(10^-8, 0.6)
[x] = metodo2(10^-8, 1.7)
[x] = metodo2(10^-8, -1.2)
[x] = metodo2(10^-8, -0.2)
[x] = metodo2(10^-8, 1.0)
[x] = metodo2(10^-8, 2.0)
[x] = metodo2(10^-8, 10.0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (e)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\

d2fdx2 = @(x) 6/5*x.^2 - 16*sin(4*x);

dhdx = @(x) f(x).*d2fdx2(x)./(dfdx(x).^2);

h1 = @(x) x - f(x)./dfdx(x0);
dh1dx = @(x) 1 - dfdx(x)./dfdx(x0);

Psi = @(x) (x.*g(g(x))-g(x).^2)./(g(g(x))-2*g(x)+x);


format long
z1 = fzero(f, -0.6);
x0 = -0.7;


% estimativa para o metodo de newton
[xn] = metodonewton(10^-4, x0);
xn1 = h(xn);
abs(z1-xn1)./abs(z1 - xn) % estimativa
dhdx(z1) % valor teorico

% estimativa para o metodo 1
[xn] = metodo1(10^-12, x0);
xn1 = h1(xn);
abs(z1 - xn1)./abs(z1 - xn) % estimativa
dh1dx(z1) % valor teorico

% estimativa para o metodo 2
[xn] = metodo2(10^-11, x0);
xn1 = Psi(xn);
abs(z1 - xn1)./abs(z1 - xn) % estimativa














