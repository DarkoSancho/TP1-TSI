[im, map]=imread('ndg-bellecour.png');   % Lecture de l'image
IM=fftshift(fft2(im));               % TF image
l=size(im,1);                        % Hauteur image initiale
c=size(im,2);                        % Largeur image initiale
L=floor(l/4);                        % Hauteur image r�duite
C=floor(c/4);                        % Largeur image r�duite
im_r=zeros(L,C);                     % Image r�duite
im_r_filtree=zeros(L,C);             % Image r�duite
K = 0.005;                                   % Param�tre du filtre
H=zeros(l,c);                        % Matrice de filtrage

% Affichage image originale 
figure('numbertitle','off','name','Image originale');
image(im);
colormap(map);

% Boucle cr�ation de l'image r�duite 
for i=1:L
    for j=1:C
        im_r(i,j)=im(4*i,4*j);
    end
end

% Affichage image r�duite
figure('numbertitle','off','name','Image r�duite sans filtre');
image(im_r);
colormap(map);

% Boucle de cr�ation de la matrice de filtrage 
for i=1:l
    for j=1:c
        H(i,j)=exp(-K*((l/2-i)*(l/2-i)+(c/2-j)*(c/2-j)));
    end
end

% Image filtr�e en fr�quence 
IM_FILTREE=IM.*H;

% Passage � l'image filtr�e "visuelle"
im_filtree=real(ifft2(fftshift(IM_FILTREE)));

figure('numbertitle','off','name','Image filtr�e grand format');
image(im_filtree);
colormap(map);

% Boucle cr�ation de l'image r�duite apr�s filtrage
for i=1:L
    for j=1:C
        im_r_filtree(i,j)=im_filtree(4*i,4*j);
    end
end

% Affichage de l'image r�duite apr�s filtrage -----------------------------
figure('numbertitle','off','name','Image filtr�e r�duite');
image(im_r_filtree);
colormap(map);



%j'ai du mal a comprendre a quoi correspond une image dans le domaine
%spatia vers le domaine fr�quentielle