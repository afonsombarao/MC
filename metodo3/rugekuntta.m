function [x, y] = rugekuntta(h,x0,y0,F,k)
tn = 0;
x = [x0];
xn = x0;
y = [y0];
yn = y0;
n=k./h;


for i = 1:n

k1 = F(tn, xn, yn);
k2 = F(tn + h./3, xn+h./3.*k1(1), yn+h./3.*k1(2));
k3 = F(tn + 2.*h./3, xn + 2.*h./3.*k2(1), yn + 2.*h./3.*k2(2));
xn = xn + h./4.*(k1(1)+3.*k3(1));
yn = yn + h./4.*(k1(2)+3.*k3(2));
y = [y, yn];
x = [x, xn];
tn = tn + h;

end

