function lab3_3()
   x=[-0.1:.1:1.1];
   y=log(1+x);
   p=[0.02957206 -0.12895295 0.28249626 -0.48907554 0.99910735 0 ];
   z=polyval(p,x);
   fprintf(' x f(x)  p(x) Error \n');
   for i= 1:13
       fprintf( '%f %f %f %f\n', x(i), y(i), z(i), y(i)-z(i));
   end
   plot(x,y,'b')
   hold on
   plot(x,z,'r')
   hold off
end