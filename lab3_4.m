function [root]=lab3_4(x0)
  syms x;
  z0=x0.*x0;
  y0=(1+z0);
  y0=1./y0;
  hold on
  plot(x0,y0,'g');
   %x0 = [0,-1,1];
   %y0=[1,2,3];
  f=1;
  t=length(x0);
  for i=1:t
      f=f*(x-x0(i));
  end
  for i=1:t
      l(i)=f / (x-x0(i));
  end;
  for i=1:t
      for j=1:t
          if i~=j
              l(i)= l(i) /(x0(i)-x0(j));
          end
      end
  end;
  l=expand(l);
  g=0;
  for i=1:t
      g=g+l(i)*y0(i);
  end
    ezplot(g,[-4,4]);
    %xx=[-2:.5:2];
    %root=subs(g,xx);
    hold off
  root=g;
end
