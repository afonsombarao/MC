% Exercício 1

% (a)

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

% (b)

% método de newton x_n+1 = h(x_n) = x_n - f(x_n)/f'(x_n)

h = @(x) x - f(x) ./ dfdx(x);

x = [-1.2, -0.2, 1.0, 2.0];

for i = 1:5
    x = h(x);
end

x

