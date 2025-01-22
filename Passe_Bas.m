function y = Passe_Bas(x, fc)
    global N Te;
    
    % Axe des fréquences
    Z =linspace(-N/(2*Te), N/(2*Te) - 1/Te, N);
 % Générer N fréquences entre -N/(2*Te) et N/(2*Te)
    
    % Initialiser y avec les mêmes valeurs que x
    y = x;
    
    % Filtrage passe-bas avec une boucle `for` et une condition `if`
    for k = 1:N
        if abs(Z(k)) > fc % Si la fréquence est au-delà de fc
            y(k) = 0; % Remplace par 0
        end
    end
end
