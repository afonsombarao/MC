function grafico2()
    % loop para construir p(x) = (x-1)(x-2)...(x-20)
    % multiplicar p(x) por (x-k) equivale a fazer x*p(x) - k*p(x)

    % Em termos do vetor dos coeficientes, o que acontece é:
    %   x*p(x)  <=>  [p, 0]    (adicionamos um zero no fim, ou seja todos aumentam o seu expoente por 1)
    %   k*p(x)  <=>  k*[0, p]  (multiplicar por k mas adicionamos um zero no início para alinhar o vetor com [p, 0])
    %   [p, 0] - k*[0, p] dá os coeficientes de p(x)*(x-k)

    p = 1;
    for k = 1:20
        p = [p, 0] - k*[0, p]; % p(x) <- p(x)*(x-k)
    end
    
    % p_perturbado: perturbar coeficiente de x^19
    p_perturbado = p;
    p_perturbado(2) = p_perturbado(2) - 2^(-23);
    
    % Raízes
    raizes_p = roots(p);
    raizes_p_perturbado = roots(p_perturbado);
    
    % Gráfico
    figure;
    plot(real(raizes_p), imag(raizes_p), 'x', 'DisplayName', 'Raízes de p');
    hold on;
    plot(real(raizes_p_perturbado), imag(raizes_p_perturbado), 'o', 'DisplayName', 'Raízes de p~');
    grid on;
    title('Raízes de p(x) e p~(x) no plano complexo');
    xlabel('Parte real');
    ylabel('Parte imaginária');
    legend show;
    hold off;

    % ordenar raizes de p~ por parte real para comparar com 1:20
    raizes_p_pertur_ordenadas = sort(raizes_p_perturbado);
    raizes_p_ordenadas = sort(raizes_p);
    
    for j = 1:20
        erro = abs(raizes_p_pertur_ordenadas(j) - raizes_p_ordenadas(j));
        fprintf('z_%d: erro = %.6f\n', j, erro);
    end