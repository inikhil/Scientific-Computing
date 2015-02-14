function[]=q6(n)
%g=@(x)(x-x^2)*exp(x);
f=@(x,y)x/y + y/x;
fx1=@(x)x*log(x);
fx2=@(x)x*log(4*x^2);
fy1=@(y)y*log(y);
fy2=@(y)(2*y)*log(2*y);
h=1/n;
xi=0:h:2;
yi=0:h:2;
A=sparse((n+1)^2,(n+1)^2);
u=sparse((n+1)^2,(n+1)^2);
d=zeros(n+1,1);
R=zeros(n+1,1);
for k=1:(n+1)^2
    i=mod(k-1,n+1) +1;
    j=floor((k-1)/(n+1)) +1;
    if i==1
        A(k,k)=1;
        R(k)=fy1(yi(j));
    elseif i==n+1
        A(k,k)=1;
        R(k)=fy2(yi(j));
    elseif j==1
        A(k,k)=1;
        R(k)=fx1(xi(i));
    elseif j==n+1
        A(k,k)=1;
        R(k)=fx2(xi(i));    
    else
        A(k,k)=4;
        A(k,k-1)=1;
        A(k,k+1)=1;
        A(k,k-n)=1;
        A(k,k+n);
        R(k)=(h^2)*f(xi(i),yi(j));
    end
end
d=A\R;
for k=1:(n+1)^2
    i=mod(k-1,n+1) +1;
    j=floor((k-1)/(n+1)) +1;
    u(i,j)=d(k);
end
surf(u)