function [x,y,t,iter] = Newton(x1 ,x2 , eps, k)
    x = x1;
    y = x2;
    t=".";
    for iter = 1:k
        % Calcular valores 
        j=@(z,w)([4.*z.^3+4.*z.*w-42.*z+2.*w.^2-14;4.*w.^3+4.*z.*w-26.*w+2.*z.^2-22]);
        h=@(z,w)([12.*z.^2+4.*w-42 4.*z+4.*w;4.*z+4.*w 12.*w.^2+4.*z-26]);
        H=h(x,y);
        J=j(x,y);
        % Para se a norma do gradiente for menor que eps
        
        if norm(J,inf) < eps
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