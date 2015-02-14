function[x_root,y_root,error,max_error]=ivp_impliciteuler_single1(n)
    f=@(t,y) sin(t)-y;
    a=0;b=1;init=1;
    g=@(t) (sin(t)-cos(t)+3*exp(-t))/2;
    %n=10;
    h=(b-a)/n;
    x0=a:h:b;
    y(1)=init;
    max_iter=1000;
    tol=10^-6;
    for i=1:n
        a=y(i)+h*f(x0(i),y(i));
        for j=1:max_iter
            a_new=y(i)+h*f(x0(i),a);
            if abs(a_new-a) < tol
                break;
            end
            a=a_new;
        end
        y(i+1)=a_new;
    end
    z=g(x0);
    x_root=z;
    y_root=y;
    error=z-y;
    aa=0;
    for i=1:n+1
        if abs(error(i))>aa
            aa=error(i);
        end
    end
    max_error=aa;
    %hold on
    %plot(n,max_error,'r');
    %plot(x0,y_root,'r'); 
    %plot(x0,z,'g');
    %plot(x0,error,'b');
    %hold off
    return
end
    