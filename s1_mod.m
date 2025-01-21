function[x]=s1_mod(fmod)
    f = 5;
    global a b N Te; % Déclarer N comme global dans la fonctio
    x = zeros(N,1);
    df =5;
    for k=1:N
        t = (k-1)*Te+a;
        x(k)=cos(2*pi*fmod*t)*(cos(2*pi*f*t)+2*cos(2*pi*(f+df)*t)+3*cos(2*pi*(f+2*df)*t)+4*cos(2*pi*(f+3*df)*t)+5*cos(2*pi*(f+4*df)*t));
    end
end