function[root]=q4(v)
    v=matlabFunction(v)
    t=[0:0.1:10];
    ve=v(t);
    x(1)=-18;
    for i=1:length(t)-1
       x(i+1)=x(i)+0.5 * 0.1* (v(t(i+1))+v(t(i)));
       a(i)=(v(t(i+1))-v(t(i)))/0.1;
    end
    a(length(t))=v(t(length(t)))-v(t(length(t)-1));
    
    plot(t,x);
    hold on
    plot(t,ve,'r');
    plot(t,a,'g');
    legend('Position','Velocity','acceleration','location','northwest');
end