function[root]= q1(f,g,x0)
    f1 = matlabFunction(f);
    f2= matlabFunction(diff(f));
    %plot(x0,f2(x0),'b');
    %hold on
    n=length(x0);
    fwd = zeros(1,n-1);
    bwd=zeros(1,n-1);
    cen=zeros(1,n-2)
    h=0.1;
    for i = 2:n
        fwd(i-1)=(f1(x0(i))-f1(x0(i-1)))/h;
    end
    
    er_fwd=f2(x0(1:n-1))-fwd;
    
    %fwd(n)=0;
   % plot(x0(1:n-1),fwd,'g');
    %plot(x0,bwd,'r');
    for i = n:-1:2
        bwd(i-1)=(f1(x0(i))-f1(x0(i-1)))/h;
    end
    er_bwd=f2(x0(2:n))-bwd;
    
  %  plot(x0(2:n),bwd,'r');
        
    for i=2:n-1
        cen(i-1)=(f1(x0(i+1))-f1(x0(i-1)))/(2*h);
    end
   %  plot(x0(2:n-1),cen,'y');
     
     er_cen=f2(x0(2:n-1))-cen;
     
     plot(x0(1:n-1),er_fwd,'g');
     hold on
     plot(x0(2:n),er_bwd,'r');
      plot(x0(2:n-1),er_cen,'y');
    hold off 
end