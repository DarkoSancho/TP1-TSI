function[x]=frect(to,por) % Fonction vaut 1 sur por de l'intervalle
    global a b N Te; % Déclarer N comme global dans la fonctio
    x = zeros(N,1);
    for j=1:N
        valt = (j-1)*Te+a;
        tref=mod(valt,to);
        tporc = tref/Te*100; %Dans quel pourcentage on est ?
        if tporc>por
            x(j)=1;
        end
    end
end
