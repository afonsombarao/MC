function [x,t] = Newton(x1 ,x2 , eps, k)
    x=[x1;x2];
    t=".";
    for iter = 1:k
        % Calcular valores 
        j=@(x1,x2)([4.*x1.^3+4.*x1.*x2-42.*x1+2.*x2.^2-14;4.*x2.^3+4.*x1.*x2-26.*x2+2.*x1.^2-22]);
        h=@(x1,x2)([12.*x1.^2+4.*x2-42 4.*x1+4.*x2;4.*x1+4.*x2 12.*x2.^2+4.*x1-26]);
        J=j(x1,x2);
        H=h(x1,x2);
        % Para se a norma do gradiente for menor que eps
        
        if norm(J) < eps
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
        end
        

        %atualizar os dados
        r = (inv(H))*J;
        x = x - r;
    end
    warning('O método atingiu o máximo de iterações sem convergir.');
end