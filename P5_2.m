[im_flou, map_flou]=imread('texte_flou.png');   % Lecture de l'image flou
[im_ref, map_ref]=imread('texte_ref.png');   % Lecture de l'image flou
l=size(im,1);                        % Hauteur image initiale
c=size(im,2);                        % Largeur image initiale
K_flou = 22;

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



% Filtrage Inverse simple
IM_flou_simple = I .* H;

% Passage à l'image "visuelle"
im_flou_simple = real(ifft2(fftshift(IM_flou_simple)));



%puissance spectrale
Pi = abs(I)* abs(I);
ib=im_flou_simple-floor(im_flou_simple);
Ib=fft2(fftshift(ib));
Pb=abs(Ib).*abs(Ib);

W = zeros(l,c);
for u=1:l
    for v = 1:c
        W(u,v)=(1/H(u,v))*abs(H(u,v))*abs(H(u,v))/(abs(H(u,v))*abs(H(u,v))+Pb(u,v)/Pi(u,v));
    end
end

Iideale = D.*W;
i_ideale = real(ifft2(fftshift(Iideale)));

figure('numbertitle','off','name','Image idéale');
image(i_ideale);
colormap(map_flou);

