function y = Crank_Nicolson(f1, f2, g, M, N, T, exact)

dt = T/M;
dx = 1/N;
x = 0:dx:1;
t = 0:dt:T;
lambda = dt/(dx^2);

len_x = length(x);
len_t = length(t);

for i=1:len_t
    
    for j=1:len_x
        
        exact_sol(i,j) = exact(x(j), t(i));
    end
end

for i=2:len_t
    U(i,1) = f1(t(i));
    U(i, len_x) = f2(t(i));
end

for i=1:len_x
    U(1,i) = g(x(i));
end

A = sparse(N-1, N-1);

for j=2:M+1
    
    A(1,1) = (1+lambda);
    A(1,2) = (-lambda)/2;
    A(N-2,N-1) = (-lambda)/2;
    A(N-1,N-1) = (1+lambda);
    R(1) = (lambda/2)*(U(j-1,1)+U(j-1,3)+U(j,1)) + (1-lambda)*U(j-1,2);
    R(N-1) = (lambda/2)*(U(j-1,len_x)+U(j-1,len_x-2)+U(j,len_x)) + (1-lambda)*U(j-1,len_x-1);
    
    for i=2:N-2
        A(i,i-1) = (-lambda)/2;
        A(i,i) = (1+lambda);
        A(i,i+1) = (-lambda)/2;
        R(i) = (lambda/2)*(U(j-1,i) + U(j-1,i+2)) + (1-lambda)*U(j-1,i+1);
    end
    
    U(j,2:len_x-1) = A\R';
end

U
exact_sol
error = abs(U-exact_sol);
surfc(error)