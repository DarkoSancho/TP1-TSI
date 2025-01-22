[im_flou, map_flou]=imread('texte_flou.png');   % Lecture de l'image flou
[im_ref, map_ref]=imread('texte_ref.png');   % Lecture de l'image flou
l=size(im,1);                        % Hauteur image initiale
c=size(im,2);                        % Largeur image initiale
K_flou = 11;

I=fftshift(fft2(im_ref));               % TF image
H = zeros(l,c);                        % Matrice de filtrage
IM_flou_simple = zeros(l,c);           % image rétablie avec une simple inversion sans tenir compte des bruits 



% % Affichage image flou
% figure('numbertitle','off','name','Image flou');
% image(im_flou);
% colormap(map_flou);
% 
% % Affichage image réference
% figure('numbertitle','off','name','Image reference');
% image(im_ref);
% colormap(map_ref);


% Créer la réponse impulsionnelle (h)
h = zeros(l,c);
h(floor(l/2)-1:floor(l/2)+1, floor(c/2)-K_flou/2:floor(c/2)+K_flou/2) = 1; %Rectangle
h=fftshift(h);
sum = 0;
for i=1:size(h,1)
    for j=1:size(h,2)
        sum = sum+h(i,j);
    end
end


h_norm = h/sum;

% Calcul de la TF de H
H = fftshift(fft2(h_norm));

% TF de H
figure('numbertitle', 'off', 'name', 'TF de H');
affichage = abs(log(H));
plot(affichage);
title('H');
grid on;

% Filtrage Inverse simple
IM_flou_simple = I .* H;

% Passage à l'image "visuelle"
im_flou_simple = real(ifft2(fftshift(IM_flou_simple)));

Pi = norm(I)* norm(I);

% Affichage image flou avec le filtrage inverse simple
figure('numbertitle','off','name','Image flou avec le filtrage inverse simple');
image(im_flou_simple);
colormap(map_flou);