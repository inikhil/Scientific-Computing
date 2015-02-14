function[x_root,y_root,exact,error]=rangekutta(n)
    f=@(t,y) sin(t)-y;
    a=0;b=1;init=1;
    g=@(t) (sin(t)-cos(t)+3*exp(-t))/2;
    h=(b-a)/n;
    x0=a:h:b;
    y(1)=init;
    w1=1/2;w2=1/2;c2=1;a21=1;
    for i=1:n
        k1=h*f(x0(i),y(i));
        k2=h*f(x0(i)+c2*h,y(i)+a21*k1);
        y(i+1)=y(i)+w1*k1+w2*k2;
    end
    x_root=x0;
    y_root=y;
    z=g(x0);
    exact=z;
    error=abs(y-z);
    return;
end