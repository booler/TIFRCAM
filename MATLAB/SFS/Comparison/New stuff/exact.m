function V = exact(x)
    if(x < 0.4 || x > 0.6)
        V = x*(1-x);
    else
        %V = 0.5*x*(1-x);
        V = 0.10;
    end
end