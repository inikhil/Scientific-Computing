function y = adams_bashforth(f, init, a, b, n)

%syms x;
%f_exact = matlabFunction(0.5*(sin(x)-cos(x) + 3*exp(-x)));
init_val = runge_kutta_4(f, init, a, b, n);
%f = matlabFunction(f);
h = (b-a)/n;
t = a:h:b;
y(1:4) = init_val(1:4);

for i=5:n+1
    y(i) = y(i-1) + (h/24)*(55*f(t(i-1), y(i-1)) - 59*f(t(i-2), y(i-2)) + 37*f(t(i-3), y(i-3)) - 9*f(t(i-4), y(i-4)));
end

%figure(2);
%plot(t, y, 'g');
%hold on;

%figure(2);
%plot(t, f_exact(t), 'r');
%hold off;