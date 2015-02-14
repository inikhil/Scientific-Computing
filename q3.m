function[root]=q3()
    t=[0:1:5];
    v=[2,4,8,4,0,-2];x(1)=4;
    for i=1:5
        x(i+1)=x(i)+0.5*(t(i+1)-t(i))*(v(i)+v(i+1));
        a(i)=(v(i+1)-v(i));
    end
    a(6)=v(6)-v(5);
    plot(t,x);
    hold on
    plot(t,v,'r');
    plot(t,a,'g');
    legend('Position','Velocity','acceleration','location','northwest');
    root=x;
end