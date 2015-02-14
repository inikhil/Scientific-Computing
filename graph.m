function[]=graph1()
     for n=1:1000
        [amx_error]=ivp_impliciteuler_single(n);
     end
     return;
end