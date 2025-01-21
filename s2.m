function[x]=s2()
    f = 5;
    global a b N Te; % Déclarer N comme global dans la fonctio
    x = zeros(N,1);
    df =5;
    for k=1:N
        t = (k-1)*Te+a;
        x(k)=5*cos(2*pi*f*t)+4*cos(2*pi*(f+df)*t)+3*cos(2*pi*(f+2*df)*t)+2*cos(2*pi*(f+3*df)*t)+cos(2*pi*(f+4*df)*t);
    end
end