function[x]=fgauss()
    global a b N Te; % Déclarer N comme global dans la fonctio
    x = zeros(N,1);
    for k=1:N
        t = (k-1)*Te+a;
        x(k)=exp(-pi*t*t);
    end
end