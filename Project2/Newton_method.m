function [x0 , ea ,iter ]=Newton_method(fx , dfx ,x0 , tol)
nMax=100;
for iter= 0:nMax
    x1 = x0 -fx(x0)/dfx(x0);
    
    if( abs(fx(x1)) < tol)
        break;
    end
    
    if( abs(x1)>1.0e-15)
        ea= abs((x1-x0)/x1);
    else
        ea= abs(x1);
    end
    
    if( ea< tol)
        break;
    end
    x0 = x1;
end

ea= abs((x1-x0)/x1);
end