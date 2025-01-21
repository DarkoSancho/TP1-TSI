function[x]=fcpl(w,fi)
    global a b N Te; % Déclarer N comme global dans la fonctio
    x = zeros(N,1);
    for k=1:N
        x(k)=exp(1j*w*((k-1)*Te+a)+fi);
    end
end