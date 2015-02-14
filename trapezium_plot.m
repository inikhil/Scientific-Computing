function[]=trapezium_plot()
    [x_root,y_root,exact,error]=trapezium(100);
    figure('Name', 'plots of rangekutta');
    plot(x_root,y_root,'r');
    hold on
    plot(x_root,exact,'b');
    hold off;
    figure('Name', 'errorplot');
    plot(x_root,error,'g');
    
end