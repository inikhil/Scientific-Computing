function[root]=q2(f)
    f=matlabFunction(f);
    n=13;
    a = 0.5;b=1;j=1;t=0;
    h=(b-a)/n;
    for i = a:h:b
        x0(j)=i;j=j+1;
    end
    
    %Trapezoidal rule
    for i=1:length(x0)-1
        t=t+((x0(i+1)-x0(i))/2)*(f(x0(i))+f(x0(i+1)));
    end
    display(t);
    %Midpoint rule
    t=0;
    for i=1:length(x0)-1
        t=t+(x0(i+1)-x0(i))*f((x0(i)+x0(i+1))/2);
    end
    %root=t;
    display(t);
    %simson 1/3rd rule
    t=0;
    for i=1:length(x0)-1
        t=t+((x0(i+1)-x0(i))/6)*(f(x0(i))+f(x0(i+1))+4*f((x0(i)+x0(i+1))/2));
    end
    %root=t
    display(t);
    %simson 3/8th rule
    t=0;
    for i=1:length(x0)-1
        t=t+((x0(i+1)-x0(i))/8)*(f(x0(i))+f(x0(i+1))+3*f((2*x0(i)+x0(i+1))/3)+3*f((x0(i)+2*x0(i+1))/3));
    end
    root=t;
    display(t);
end