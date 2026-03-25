%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% alinea (d)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% definicao das funcoes para o ruge kunta
q = @(x) 1;
r = @(x) 1;

Fz = @(t, x, y) [y; -q(t).*x + r(t)];
Fw = @(t, x, y) [y; -q(t).*x];

[z, dzdx] = rugekuntta(0.05, 0, 0, Fz, 1);
[w, dwdx] = rugekuntta(0.05, 0, 1, Fw, 1)


x = 0:0.05:1;


y = z - z(end)./w(end).*w

plot(x,y)
