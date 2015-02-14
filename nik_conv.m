function [root]=nik_conv(f)
    x=-1;
    while 1==1
      x1=f(x);
      if abs(x1-x) <= 10^-6
          break;
      end
       x=x1;
    end
    root=x;
    return;
end
    
    