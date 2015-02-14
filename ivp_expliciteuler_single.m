function[root_x,root_y]=ivp_expliciteuler_single(f,a,b,init,g)
    n=10;
    h=(b-a)/n;
    x0=a:h:b;
    y(1)=init;
    %z(1)=g(x0(1));
    for i=1:n
        y(i+1)=y(i)+h*f(x0(i),y(i));
     %   z(i+1)=g(x0(i+1))
    end
    z=g(x0);
    root_x=x0;
    root_y=y;
    error=z-y;
    hold on
    plot(root_x,root_y,'r'); 
    plot(root_x,z,'g');
    plot(root_x,error,'b');
    hold off
    return
end
    