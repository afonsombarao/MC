function [x,t,iter,eA,eS,eP] = Algoritmo1d(x1,x2,eps,k,xstar)
t=".";
a=[0;0];
x=[x1;x2];
j=@(p,q)([4*p^3+4*p*q-42*p+2*q^2-14;4*q^3+4*p*q-26*q+2*p^2-22]);
h=@(p,q)([12*p^2+4*q-42 4*p+4*q;4*p+4*q 12*q^2+4*p-26]);
A=h(x1,x2);
Hstar=h(xstar(1),xstar(2));
eA=zeros(1,k);
eS=zeros(1,k);
eP=zeros(1,k);
for iter=1:k
    a=x;
    s=-((inv(A))*j(x(1),x(2)));
    x=x+s;
    y=j(x(1),x(2))-j(a(1),a(2));
    eA(iter)=norm(A-Hstar,2);
    eS(iter)=norm((A-Hstar)*s,2)/norm(s,2);
    eP(iter)=norm(x-a,2)/norm(a-xstar,2);
    A=A+(((y-A*s)*((y-A*s)'))/((y-A*s)'*s));
    if norm(x-a,inf)<eps
        if det(A)>0
            if trace(A)>0
                t="minimo";
            else
                t="maximo";
            end
        elseif det(A)<0
            t="pontodesela";
        else
            t="indeterminado";
        end
        eA=eA(1:iter);
        eS=eS(1:iter);
        eP=eP(1:iter);
        return
    end
end