function[]=boundary()
   %syms y(x);
   %dsolve(diff(y) == y + 1)
   %dsolve('Dy = y + 1','x')
   %dsolve('D2y == x*y','x')
   %syms a y(x)
   % Dy = diff(y);
   % dsolve('D2y+2*Dy+y == x', y(0) == 0, y(1)==0);
   % f = dsolve(diff(y,2)+diff(y)+y == x,y(0) == 0, y(1)==0);
   % subs(f,2)
   %syms u(x,y) t; 
   %dsolve('D2u+D2y', u(x,0)==0,u(x,1)==x,u(0,y)==0,u(1,y)==y)
end