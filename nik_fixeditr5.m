function [root]=nik_fixeditr5(f)
       x0=1;
       t=0;
       x1=2;
       while t~=1
           x1=f(x0);
           if(abs(x1-x0) < 10^-4)
               break;
           end
           x0=x1;
       end
      root=x1;
      return;
end