% Script principal
global a b N Te; % Déclaration des variables globales
a = -25;
b = 25;
N = 65536;
Te = (b - a) / N;
fe = 1 / Te;
fc = 28;

x =fcos(20,0).*(s1_mod(40)+s2_mod(20)); %Retrouve un sin simple pour -df mais pas positif ? On peut prendre les valeurs que l'on veut tant que c'est les mêmes
yf = tfour(x.'); % Transformée de Fourier
y = yf;
x2=tfourinv(y);


Frequence = linspace(-fe/2, fe/2, N); % Fréquences centrées
Temps = linspace(-25, 25, N); % Temps

% Pour réaliser le passe bas
for k = 1:size(Frequence,2)
    if abs(Frequence(k))>fc
        y(k)=0;
    end
end

% % Première figure : Affichage des figures temporelles
% figure;
% 
% % Graphique pour le signal temporel
% subplot(2, 1, 1);
% plot(Temps, x);
% title('Signal Temporel');
% xlabel('Temps (s)');
% ylabel('Amplitude');
% grid on;
% 
% % Graphique pour x2 en fonction du temps
% subplot(2, 1, 2);
% plot(Temps, x2);
% title('Signal Reconstruit');
% xlabel('Temps (s)');
% ylabel('Amplitude');
% grid on;
% 
% % Titre global pour la première figure
% sgtitle('Analyse du Signal : Figures Temporelles');

% Deuxième figure : Affichage des figures fréquentielles
figure;

% Graphique pour l'amplitude
subplot(3, 1, 1);
plot(Frequence, abs(y));
title('Amplitude du Signal');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
grid on;

% % Graphique pour la phase
% subplot(3, 1, 2);
% plot(Frequence, angle(y));
% title('Phase du Signal');
% xlabel('Fréquence (Hz)');
% ylabel('Phase (radians)');
% grid on;

% Graphique pour la partie réelle
subplot(3, 1, 2);
plot(Frequence, real(y));
title('Partie Réelle');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
grid on;

% Graphique pour la partie imaginaire
subplot(3, 1, 3);
plot(Frequence, imag(y));
title('Partie Imaginaire');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
grid on;

% Titre global pour la deuxième figure
sgtitle('Analyse du Signal : Figures Fréquentielles');
