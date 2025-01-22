[im, map]=imread('Lyon.png');   % Lecture de l'image 

l=size(im,1);                        % Hauteur image initiale
c=size(im,2);                        % Largeur image initiale


L = floor(l/8);
C = floor(c/8);

im_compresse = zeros(l,c);


%initialisation de Q
K = 6; %coefficient de Compression
Q = ones(8,8);
for i = 1:8
    for j = 1:8
        Q(i,j) = 2 ^ (K* max(abs(i-4),abs(j-4)));
    end
end


%résultat F
F = zeros(L,C);

for i = 0:L-1
    
    for j = 0:C-1
        bloc = im(i*8+1:(i+1)*8,j*8+1:(j+1)*8);  % divise la matrice en bloc
        B = fftshift(fft2(bloc));

        F = round(B ./ Q) .* Q;

        f = real(ifft2(fftshift(F))); 

        im_compresse(i*8+1:(i+1)*8,j*8+1:(j+1)*8) = f;  %reforme la matrice à partir du bloc

    end
end



figure('NumberTitle', 'off', 'Name', 'Images');
subplot(2, 1, 1); % Divise la figure en 1 ligne et 2 colonnes, et sélectionne la première partie
image(im);
colormap(map);
title('Image avant compression');

subplot(2, 1, 2); % Sélectionne la deuxième partie
image(im_compresse);
colormap(map);
title('Image après compression');
