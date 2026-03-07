function [x1,x2,t,A] = Algoritmo1(x1,x2,eps,k)

t=".";
a=[0 0];
x=[x1 x2];
j=@(p,q)([4.*p.^3+4.*p.*q-42.*p+2.*q.^2-14;4.*q.^3+4.*p.*q-26.*q+2.*p.^2-22]);
h=@(p,q)([12.*p.^2+4.*q-42 4.*p+4.*q;4.*p+4.*q 12.*q.^2+4.*p-26]);
A=h(x1,x2);
for iter=1:k

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
        return;
    else

        a=x;
        s=-((inv(A))*j(x(1),x(2)));

        x=x-s;
        y=j(x(1),x(2))-j(a(1),a(2));

        A=A+(((y-A*s)*((y-(A*(s)))'))/((y-A*(s))'*s));
    end

end

        A=A+(((y-A*s)*((y-(A*(s)))'))/((y-A*(s))'*(x-a)));
    end

end
