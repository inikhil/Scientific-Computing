function [root]=nik_bisect2(f)
   % f = @(x) 2^(-x)+exp(x)+2*cos(x)-6;
    x=0.5;
    y=1.5;
    t=0;
    while t~=1
        z=(x+y)/2;
       % k=f(-3.1831);
        %fprintf ('%f',k);
        if (abs(f(z)) - 10^-3) < 0
            root=z;
            t=1;
            return;
        end
        if (f(z)*f(x)) < 0
           y=z;
        else
            x=z;
        end
    end   
end
