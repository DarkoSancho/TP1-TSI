function[x]=constant(value)
    global a b N Te; % Déclarer N comme global dans la fonctio
    x = zeros(N,1);
    x = x+value;
end
