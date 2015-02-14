function[root]=new_cotes(f,a,b,n)
    syms x;
    h=(b-a)/n;
    x0=[a:h:b];
    for i = 1:length(x0)
        l(i)=sym(1);
    end
    ans=0;
    for i=1:length(x0)
        for j=1:length(x0)
            if i~=j
                l(i)=l(i)*(x-x0(j))/(x0(i)-x0(j));
            end
        end
         w(i)=eval(int(l(i),a,b));
         ans=ans+w(i)*subs(f,x0(i));
    end
  %  for i = 1:length(x0)
  %      w(i)=eval(int(l(i),a,b));
  %  end
   % ans=0;
    %for i = 1:length(x0)
     %   ans=ans+w(i)*subs(f,x0(i));
   % end
   % root=ans;
    %ans=sum(x0.*subs(f,x0));
    root=ans;
 