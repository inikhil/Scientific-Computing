function [root]= nik_secant8(f)
    x0=0;
    x1=1;
    while 1==1
        x2=x1-f(x1)*((x1-x0)/(f(x1)-f(x0)));
        if abs(x2-x1) < 10^-6
            break;
        end;
        x0=x1;
        x1=x2;
    end
    root=x2;
    return;
end
