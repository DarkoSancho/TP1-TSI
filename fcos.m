function[x]=fcos(f,fi)
    global a b N Te; % Déclarer N comme global dans la fonctio
    x = zeros(N,1);
    for i=1:N
        x(i)=cos(2*pi*f*((i-1)*Te+a)+fi);
    end
end
