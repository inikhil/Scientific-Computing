function[e]=EBVP(a,b,c,d,n)
format short;
if (b-a)~=(d-c)
    stop
end
h=(b-a)\n;
x=a:(b-a)/n:b;
y=c:(d-c)/n:d;
U=zeros(n+1,n+1);
U1=zeros(n+1,n+1);
f=inline('0','x','y');
f1=inline('0','x');
f2=inline('x','x');
g1=inline('0','y');
g2=inline('y','y');
for i=1:n+1
    U(i,1)=f1(x(i));
    U(i,n+1)=f2(x(i));
    U(1,i)=g1(y(i));
    U(n+1,i)=g2(y(i));
end
%U
A=zeros((n-1)^2,(n-1)^2);
B=zeros((n-1)^2,1);
for i=1:n-1
    for j=1:n-1
        k=((i-1)*(n-1))+j;
        B(k)=h*h*f(x(i+1),y(j+1));
        if i==1
            B(k)=B(k)-U(1,j+1);
        else
            A(k,k-n+1)=1;
        end
        if i==n-1
            B(k)=B(k)-U(n+1,j+1);
        else
            A(k,k+n-1)=1;
        end
        if j==1
            B(k)=B(k)-U(i+1,1);
        else
            A(k,k-1)=1;
        end
        if j==n-1
            B(k)=B(k)-U(i+1,n+1);
        else
            A(k,k+1)=1;
        end
        A(k,k)=-4;
    end    
end
%sparse(A);
X=A\B;
for i=1:(n-1)
    for j=1:(n-1)
        U(i+1,j+1)=X(((i-1)*(n-1))+j,1);
    end
end
for i=1:(n+1)
    for j=1:(n+1)
        U1(i,j)=x(i)*y(j);
    end
end
er=abs(1-(U./U1));
%A
%B
%X
%U
%U1
%x
%y
figure(ceil(rand(1)*9999999));
surfc(x,y,er);
%figure(ceil(rand(1)*9999999));
%contour(x,y,U);
%figure(ceil(rand(1)*9999999));
%contour(x,y,U1);
figure(ceil(rand(1)*9999999));
surfc(x,y,U);