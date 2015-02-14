function[x_root,y_root,exact,error]=trapezium(n)
    f=@(t,y) sin(t)-y;
    a=0;b=1;init=1;
    g=@(t) (sin(t)-cos(t)+3*exp(-t))/2;
    h=(b-a)/n;
    t=a:h:b;
    y(1)=init;
    % Implicit euler and explicit euler together
    max_iter=1000;
    tol=10^-6;
    for i=1:n
        a=y(i)+h*f(t(i),y(i));
        for j=1:max_iter
            a_new=y(i)+h*f(t(i),a);
            if abs(a_new-a) < tol
                break;
            end
            a=a_new;
        end
        y(i+1)=0.5*a_new+0.5*(y(i)+h*f(t(i),y(i)));
    end
    x_root=t;
    y_root=y;
    z=g(t);
    exact=z;
    error=abs(y-z);
    return;
end