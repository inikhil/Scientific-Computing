function[]=graph1()
    n=100;i=1;
     while i~=10
        n1(i)=n;
       [x_root,y_root,error,max_error(i)]=ivp_impliciteuler_single1(n);
       n=2*n;
       i=i+1;
     end
     fileID=fopen('tab.txt','w');
     fprintf(fileID,'%6s %6s %6s\r\n','n','max_err','logmax');
     %for i=1:100
         %log_error(i)=log2(max_error(i)/max_error(2*i));
         %X=[n1(i),max_error(i),log_error(i)];
      %   disp(X);
         %fprintf(fileID,'%d %12.8f %12.8f\n',X);
    % end
    % semilogx(n1,max_error,'b');
     %hold on
     loglog(n1,max_error,'r');
     hold on
     x=logspace(2,5);
     y=logspace(-3,-6);
     loglog(x,y,'g')
     %loglog(max_error,max_error,'g');
     return;
end