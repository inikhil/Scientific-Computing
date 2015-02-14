function [root]= lab3_7(x0,y0)
    %x0=[0.0,0.1,0.3,0.6,1.0];
    %y0=[-6.00000,-5.89483,-5.65014,-5.17788,-4.28172];
    t=length(x0)+1;
    for j=1:t
        k=1;
        for i=1:t-1
            if j==1
                a(i,j)=x0(i);
            else if j==2
                    a(i,j)=y0(i);
                else
                    if i<=j-2
                        a(i,j)=0;
                    else
                        a(i,j)=(a(i,j-1)-a(i-1,j-1))/(a(i,1)-a(k,1));
                        k=k+1;
                    end
                end
            end
        end
    end
    syms x;
    l(1)=sym(1);
    for i = 2:t-1
        l(i)= l(i-1) * (x-x0(i-1));
    end;
    g=y0(1);
    for i = 2: t-1
        l(i)=l(i)*a(i,i+1);
        g=g+l(i);
    end;
    g=expand(g);
    ezplot(g,[0,1]);
    root=subs(g,[0.8:.1:.9]);
    return;
            
end