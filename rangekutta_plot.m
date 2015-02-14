function[]=rangekutta_plot()
    [x_root,y_root,exact,error]=rangekutta2(10);
    figure('Name', 'plots of rangekutta');
    plot(x_root,y_root,'r');
    %ylim([0,10]);
    hold on
    plot(x_root,exact,'b');
    hold on;
    %figure('Name', 'errorplot');
    plot(x_root,error,'g');
    legend('y_root','excat','error');
    
    
end