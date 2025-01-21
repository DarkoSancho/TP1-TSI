function[x]=fdirac(t0)
    global a b N Te; % Déclarer N comme global dans la fonctio
    x = zeros(N,1);
    n = floor((t0-a)/Te+1);
    x(n)=1;
end
