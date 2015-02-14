function[root]=implicit_parabolic()
    m=7;n=4;con=(m*m)/n;
    f=@(x,t) exp(-pi*pi*t)*sin(pi*x);
    %if con>0.5
     %   disp('Unstable solution end');
   %else 
        for i =1:m+1
            x(1,i)=sin((pi*(i-1))/m);
        end
        for j=2:n+1
            x(j,1)=0;
            x(j,m+1)=0;
            A=zeros(m-1,m-1);
            A(1,1)=2*con+1;A(1,2)=-con;
            for k=2:m-2
                A(k,k-1)=-con;
                A(k,k)=2*con+1;
                A(k,k+1)=-con;
            end
            A(m-1,m-2)=-con;A(m-1,m-1)=2*con+1;
           % display(A);
            u(1)=x(j-1,2)-x(j,1);
            for i=3:m-1
                u(i-1)=x(j-1,i);
            end
            u(m-1)=x(j-1,m)-x(j,m+1);
            %display(u);
            v=A\u';
            %disp(v);
            for i=1:m-1
                x(j,i+1)=v(i);
            end
        end
        display(x);
        surf([0:(1/m):1],[0:(1/n):1], x);
        for i=1:n+1
            for j=1:m+1
                y(i,j)=f((j-1)/m,(i-1)/n);
            end
        end
        figure
        display(y);
        surf([0:(1/m):1],[0:(1/n):1], y);
    %end
end