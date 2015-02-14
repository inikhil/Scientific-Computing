function[]=elliptic_pde()
    syms x y;
    f =@(x,y) x/y +y/x;
    m=0.25;n=0.25;
    x_var=[1:m:2];
    y_var=[1:n:2];
    M=length(x_var);N=length(y_var);
    k=(N-2)*(M-2);
    A=zeros(k,k);
    for i=1:k
        A(i,i)=-4;
        if i-1>0
            A(i,i-1)=1;
        end
         if i+1<=k
            A(i,i+1)=1;
         end
         if i-M+2>0
            A(i,i+2-M)=1;
         end
         if i+M-2<=k
            A(i,i+M-2)=1;
         end
    end
    figure('Name','Dot_matrix')
    spy(A)
    
end