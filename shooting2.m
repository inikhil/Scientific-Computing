function[m]=shooting2(n,a,b,k)
%take k=1.8546 for first part
%take k= -0.287 for second part
h=1/n;
xi=0:h:1;
fv=@(x,y,v)exp(x)+y*cos(x)-(x+1)*v;
%fv=@(x,y,v)x-y-2*v;
fy=@(v)v;
yi(1)=a;
vi(1)=k;
for i=1:n
    kv1(i)=h*fv(xi(i),yi(i),vi(i));
    ky1(i)=h*fy(vi(i));
    kv2(i)=h*fv(xi(i)+h*0.5,yi(i),vi(i)+0.5*kv1(i));
    ky2(i)=h*fy(vi(i)+0.5*h);
    kv3(i)=h*fv(xi(i)+h*0.5,yi(i),vi(i)+0.5*kv2(i));
    ky3(i)=h*fy(vi(i)+0.5*h);
    kv4(i)=h*fv(xi(i)+h,yi(i),vi(i)+kv3(i));
    ky4(i)=h*fy(vi(i)+h);
    vi(i+1)=vi(i)+(1/6)*kv1(i)+(2/6)*kv2(i)+(2/6)*kv3(i)+(1/6)*kv4(i);
    yi(i+1)=yi(i)+(1/6)*ky1(i)+(2/6)*ky2(i)+(2/6)*ky3(i)+(1/6)*ky4(i);
end
m=yi(n+1)-b;
plot(xi,yi);


