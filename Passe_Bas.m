function[y]=Passe_Bas(x,fc)
    y = x;
    X=(-N/(2*T)):(1/T):(N/2*T))-(1/T);
    L = size(X);
    sizex = L(1);
    for k=1:sizex
        if abs(X(k))>fc
            y(X(k))=0;
        end
    end
end
    

