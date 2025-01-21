function[x]=gf(f)
    global a b N Te; % Déclarer N comme global dans la fonctio
    x = zeros(N,1);
    df =30;
    for k=1:N
        t = (k-1)*Te+a;
        x(k)=sin(2*pi*f*t)+sin(2*pi*(f+df)*t)-2*sin(2*pi*(f+2*df)*t);
    end
end