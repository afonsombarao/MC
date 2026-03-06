function [x1,x2,A,t] = Algoritmo1(x1,x2,eps,k)

t=".";
a=[0 0];
x=[x1 x2];
j=@(x1,x2)([4.*x1.^3+4.*x1.*x2-42.*x1+2.*x2.^2-14;4.*x2.^3+4.*x1.*x2-26.*x2+2.*x1.^2-22]);
h=@(x1,x2)([12.*x1.^2+4.*x2-42 4.*x1+4.*x2;4.*x1+4.*x2 12.*x2.^2+4.*x1-26]);
A=h(x1,x2);
for iter=1:k

    if norm(x-a,inf)<eps
        if det(H)>0
                if trace(H)>0
                    t="minimo";
                else
                    t="maximo";
                end    
            elseif det(H)<0
                t="pontodesela";
            else
                t="indeterminado";
                
        end
        return;
    else

        a=x;
        s=-(inv(A)*J);

        x=x+s;
        y=j(x)-j(a);

        A=A+(((y-A*s)*((y-(A*(s)))'))/((y-A*(s))'*(x-a)));
    end

end