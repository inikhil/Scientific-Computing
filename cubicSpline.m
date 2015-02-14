function [ pol ] = cubicSpline(inp_x, inp_y, inp_d)
    n = length(inp_x);
    h = zeros(1, n-1);
    for i = 1:n-1
        h(i) = inp_x(i+1) - inp_x(i);
    end
    
    a = zeros(n);
    a(1, 1) = h(1) / 3; a(1, 2) = h(1) / 6; a(n, n-1) = h(n-1) / 6; a(n, n) = h(n-1) / 3;
    for i = 2:n-1
        a(i, i-1) = h(i-1) / 6;
        a(i, i) = (h(i) + h(i-1)) / 3;
        a(i, i+1) = h(i) / 6;
    end
    
    d = zeros(1, n);
    d(1) = (inp_y(2) - inp_y(1)) / h(1) - inp_d(1);
    d(n) = inp_d(n) - (inp_y(n) - inp_y(n-1)) / h(n-1);
    for i = 2:n-1
        d(i) = ((inp_y(i+1) - inp_y(i)) / h(i)) - ((inp_y(i) - inp_y(i-1)) / h(i-1));
    end
    
    m = a \ d';
    m = m';
    syms x;
    c = (inp_y(1) / h(1)) - (h(1) * m(1) / 6);
    dc = (inp_y(2) / h(1)) - (h(1) * m(2) / 6);
    pol = ((inp_x(2) - x)^3 * m(1) + (x - inp_x(1))^3 * m(2)) / (6 * h(1)) + (c * (inp_x(2) - x)) + (dc * (x - inp_x(1)));
    pol = expand(pol);
end