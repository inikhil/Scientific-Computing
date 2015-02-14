function [root]=lab3_1(f,x0)
   jac=matlabFunction(jacobian(f));
   fx = matlabFunction(f);
   m=0;
   while m~=1
        x= x0 - jac(x0(1) , x0(2)) \ fx(x0(1),x0(2));
        if(norm(x-x0)<=10^-6)
            m=1;
        end;
        x0=x;
   end
   root=x;
end
