function[root_x,root_y]=ivp_impliciteuler_single(f,a,b,init,g)
    n=10;
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
    root_x=x0;
    root_y=y;
    error=z-y;
    hold on
    plot(root_x,root_y,'r'); 
    plot(root_x,z,'g');
    %plot(root_x,error,'b');
    hold off
    return
end
    