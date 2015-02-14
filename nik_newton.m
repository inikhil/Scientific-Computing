function [root]=nik_newton(f,g)
   % f = @(x) 2^(-x)+exp(x)+2*cos(x)-6;
   %syms x;
   %f = x-cos(x);
   %nik_newton(f,g)
   fx = matlabFunction(f);
   fdx = matlabFunction(diff(f));
    x=0.5;
    t=0;
    while t~=1
        z= x - (fx(x) / fdx(x));
        if (abs(fx(z)) - 10^-6) < 0
            root=z;
            t=1;
            return;
        end
        x = z;
    end   
end
