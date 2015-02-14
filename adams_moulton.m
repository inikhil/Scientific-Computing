function y=adams_moulton(f, init, a, b, n)

TOL = 10^-6;
h = (b-a)/n;
t = a:h:b;
f_exact = @(x) 0.5*(sin(x)-cos(x) + 3*exp(-x));
init_val = adams_bashforth(f, init, a, b, n);
y(1:3) = init_val(1:3);
MAX = 1000;
for i=4:n+1
    iteration = 1;
    y(i) = init_val(i);
    yold = y(i);
    y(i) = y(i-1) + (h/24)*(9*f(t(i),yold) + 19*f(t(i-1),y(i-1)) -5*f(t(i-2),y(i-2)) + f(t(i-3),y(i-3)));
    while(iteration < MAX || abs(yold-y(i)) > TOL)
        yold = y(i);
        y(i) = y(i-1) + (h/24)*(9*f(t(i),yold) + 19*f(t(i-1),y(i-1)) -5*f(t(i-2),y(i-2)) + f(t(i-3),y(i-3)));
        iteration = iteration+1;
    end
end

plot(t,y,'g');
hold on;

plot(t, f_exact(t),'r');
hold off;