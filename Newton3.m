function [x,y,t,J] = Newton3(z ,w , eps, k)
    x = z;
    y = w;
    t=".";
    run = true;
    for iter = 1:k
        % Calcular valores 
        j=@(x1,x2)([4.*x1.^3+4.*x1.*x2-42.*x1+2.*x2.^2-14;4.*x2.^3+4.*x1.*x2-26.*x2+2.*x1.^2-22]);
        h=@(x1,x2)([12.*x1.^2+4.*x2-42 4.*x1+4.*x2;4.*x1+4.*x2 12.*x2.^2+4.*x1-26]);
        H=h(x,y);
        J=j(x,y);
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
        
        else
            %atualizar os dados
            r = (inv(H))*J;
            x = x - r(1);
            y = y - r(2);
        
        
        end
    end
    
    warning('O método atingiu o máximo de iterações sem convergir.');
    
end