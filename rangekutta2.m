function[x_root,y_root,exact,error]=rangekutta2(n)
    f=@(t,y) sin(t)-y;
    a=0;b=1;init=1;
    g=@(t) (sin(t)-cos(t)+3*exp(-t))/2;
    h=(b-a)/n;
    t=a:h:b;
    y(1)=init;
    c=[0,1/3,2/3,1];
    w=[1/8,3/8,3/8,1/8];
    A=[1/3 0 0; -1/3 1 0; 1 -1 1;];
    for i=1:n
       aa=0;
       for j=1:4 
          k(j)=h*f(t(i)+c(j)*h,y(i)+aa);
          aa=0;
          if j~=4
             for p=1:j
                  aa=aa+A(j,p)*k(p);
             end
          end
       end
       y(i+1)=y(i);
       for j=1:4
           y(i+1)=y(i+1)+w(j)*k(j);
       end
    end
    x_root=t;
    y_root=y;
    z=g(t);
    exact=z;
    error=abs(y-z);
    return;
end