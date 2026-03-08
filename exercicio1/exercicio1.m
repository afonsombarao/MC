% Exercicio 1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (a)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% definicao de algumas funcoes uteis
zero = @(x) zeros(size(x));
f = @(x) x.^4/10 + sin(4*x) - x;
dfdx = @(x) 2*(x.^3)/5 + 4*cos(4*x) - 1;
g = @(x) x.^4/10 + sin(4*x); 
dgdx = @(x) 2*(x.^3)/5 + 4*cos(4*x);

% variaveis para o plot
y1 = zero(x);
y2 = f(x);

x = linspace(-2,2,1000);

% plot do grafico
figure;
plot(x, y2);
hold on;
plot(x, y1);
hold off;

% gravar o grafico como um png
% saveas(gcf, 'my_plot.png');

% obtencao dos varios zeros da funcao f
z1 = fzero(f, -0.6);
z2 = fzero(f, 0);
z3 = fzero(f, 0.75);
z4 = fzero(f, 1.75);

% derivada de f nos zeros para verificar atratividade/repulsividade dos pontos fixos de g
dgdx(z1)
dgdx(z2)
dgdx(z3)
dgdx(z4)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (b)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% metodo de newton x_n+1 = h(x_n) = x_n - f(x_n)/f'(x_n)

% definicao da funcao iterativa
h = @(x) x - f(x) ./ dfdx(x);

% condicoes iniciais
x0 = [-1.2; -0.2; 1.0; 2.0]; % se substituirmos -1.2 por -0.5 ele converge

% a matriz A vai ser a matrix que contem x_i na sua i+1 esima coluna, pois a primeira coluna tem x0
A = x;

% iteracao
for i = 1:5
    x = h(x);
    A = [A, x];
end

x

% erro da ultima iterada relativamente ao zero calculado por fzero
format long
e = abs(z - A(:, 6))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (c)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% variacao do metodo de newton x_n+1 = h(x_n) = x_n - f(x_n)/f'(x_0)

% definicao da variacao do metodo de newton
h0 = @(x) x - f(x) ./ dfdx(x0);

% atribuicao de nova variavel para a iteracao e criacao da matriz que vai guardar as varias iteracoes
y = x0;
B = y;

% for loop que calcula as varias iteradas
for i = 1:5
    y = h0(y);
    B = [B, y];
end

% derivada de h0 nos zeros para verificacao de convergencia. se abs(d) < 1 o metodo converge
d = ones(4,1) - dfdx(z)./dfdx(x0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (d)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% experimentacao de varios valores iniciais para o metodo (2)
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

% definicao de algumas funcoes que serao necessarias para o calculo tanto teorico como experimental
d2fdx2 = @(x) 6/5*x.^2 - 16*sin(4*x);
dhdx = @(x) f(x).*d2fdx2(x)./(dfdx(x).^2);
h1 = @(x) x - f(x)./dfdx(x0);
dh1dx = @(x) 1 - dfdx(x)./dfdx(x0);
Psi = @(x) (x.*g(g(x))-g(x).^2)./(g(g(x))-2*g(x)+x);

% valor exato do zero de f / ponto fixo de g e x0
format long
z1 = fzero(f, -0.6);
x0 = -0.7;


% estimativa para o metodo de newton
[xn] = metodonewton(10^-4, x0); % correr o metodo de newton ate ter |xn-xn1|<epsilon
xn1 = h(xn);
abs(z1 - xn1)./abs(z1 - xn) % estimativa
dhdx(z1) % valor teorico

% estimativa para o metodo 1
[xn] = metodo1(10^-12, x0); % correr o metodo 1 ate ter |xn-xn1|<epsilon
xn1 = h1(xn);
abs(z1 - xn1)./abs(z1 - xn) % estimativa
dh1dx(z1) % valor teorico

% estimativa para o metodo 2
[xn] = metodo2(10^-11, x0); % correr o metodo 2 ate ter |xn-xn1|<epsilon
xn1 = Psi(xn);
abs(z1 - xn1)./abs(z1 - xn) % estimativa
% o valor teorico foi calculado na alinea anterio e corresponde a Psi'(z1)=0














