function f = createFunctionFromDiscreteAndPlot(x_vals, y_vals, method)
    % createFunctionFromDiscreteAndPlot - Crée une fonction continue à partir de
    % valeurs discrétisées et l'affiche sur un graphique.
    %
    % Syntaxe :
    %   f = createFunctionFromDiscreteAndPlot(x_vals, y_vals, method)
    %
    % Entrées :
    %   x_vals : Vecteur des points en x (abscisses)
    %   y_vals : Vecteur des points en y (ordonnées)
    %   method : Méthode d'interpolation ('linear', 'spline', 'pchip', etc.)
    %
    % Sortie :
    %   f : Fonction continue qui peut être évaluée en n'importe quel point
    %
    % Exemple d'utilisation :
    %   x_vals = [0, 1, 2, 3];
    %   y_vals = [1, 2, 0, 3];
    %   f = createFunctionFromDiscreteAndPlot(x_vals, y_vals, 'spline');

    % Vérification de la validité des entrées
    if length(x_vals) ~= length(y_vals)
        error('Les vecteurs x_vals et y_vals doivent avoir la même longueur.');
    end
    if nargin < 3
        method = 'linear'; % Méthode par défaut
    end

    % Créer une fonction interpolante
    f = @(x) interp1(x_vals, y_vals, x, method);

    % Génération des points pour afficher la courbe continue
    x_interp = linspace(min(x_vals), max(x_vals), 500);
    y_interp = f(x_interp);

    % Affichage des points discrets et de la courbe interpolée
    figure;
    plot(x_vals, y_vals, 'ro', 'MarkerSize', 8, 'DisplayName', 'Points discrets'); % Points discrets
    hold on;
    plot(x_interp, y_interp, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Interpolation'); % Courbe interpolée
    hold off;

    % Ajout des titres et légendes
    title('Interpolation d''une fonction à partir de valeurs discrétisées');
    xlabel('x');
    ylabel('y');
    legend('Location', 'best');
    grid on;
end
