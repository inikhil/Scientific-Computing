function[T_res,X,U]=Crank_Nicolson(g,f1,f2,x,t,N,M,T) 
  x_del=1/N;
  t_del=T/M;
  h= (t_del)/((x_del)^2);
  U=zeros(N+1,M+1);
  T_res=0:t_del:T;
  X=0:x_del:1;
  A=sparse(N-1,N-1,3*N-5);
  R=zeros(N-1,1);
  
  for i=1:N+1
      U(i,1)=subs(g,x,X(i));
  end
  
  for i=1:M+1
     U(1,i)=subs(f1,t,T_res(i));
     U(N+1,i)=subs(f2,t,T_res(i));
  end
      
  for i=2:M+1                     %time step
      R(1)=(1-h)*U(2,i-1)+(h/2)*(U(1,i-1)+U(3,i-1))+(h/2)*U(1,i);
      A(1,1)=(h+1);
      A(1,2)=-h/2;
          
      R(N-1)=(1-h)*U(N,i-1)+(h/2)*(U(N-1,i-1)+U(N+1,i-1))+(h/2)*U(N+1,i);
      A(N-1,N-1)=(h+1);
      A(N-1,N-2)=-h/2;
      
      for j=2:N-2                 %x step
          %U(j,i+1)=h*U(j+1,i)-(2*h-1)*U(j,i)+h*U(j-1,i);
         
      R(j)=(1-h)*U(j+1,i-1)+(h/2)*(U(j,i-1)+U(j+2,i-1));
      A(j,j-1)=-h/2;
      A(j,j+1)=-h/2;
      A(j,j)=(h+1);
             
      end
      
      %spy(A);
      U(2:N,i)=A\R;
  end
end