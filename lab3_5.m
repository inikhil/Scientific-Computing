function [root]=lab3_5(x0,y0)
  syms x;
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
  ezplot(g,[0,8]);
  root=g;
end
