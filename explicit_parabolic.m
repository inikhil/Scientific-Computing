function[root]=explicit_parabolic()
    m=20;n=1000;con=(m*m)/n;
    f=@(x,t) exp(-pi*pi*t)*sin(pi*x);
    if con>0.5
        disp('Unstable solution end');
    else 
        for i =1:m+1
            x(1,i)=sin((pi*(i-1))/m);
        end
        for j=2:n+1
            x(j,1)=0;
            x(j,m)=0;
            for i=2:m
                 x(j,i)=con*x(j-1,i+1)-(2*con-1)*x(j-1,i)+con*x(j-1,i-1);
            end
        end
        display(x);
        surf(x);
        for i=1:n+1
            for j=1:m+1
                y(i,j)=f((j-1)/m,(i-1)/n);
            end
        end
        figure
        display(y);
        surf(y);
    end
end