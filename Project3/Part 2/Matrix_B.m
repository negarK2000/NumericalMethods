function [b]= Matrix_B(n,tu,tl,tr,td)
%To form the right hand side vector for solving at=b
b=zeros(n,1);
for i=1:n
    %above row
    if(i==1)
        b(i)=tu+tl;
    end
    if(i>1&&i<sqrt(n))
        b(i)=tu;
    end
    if(i==sqrt(n))
        b(i)=tu+tr;
    end
    %bellow row
    if(i==n-sqrt(n)+1)
        b(i)=tl+td;
    end
    if(i>n-sqrt(n)+1&&i<n)
        b(i)=td;
    end
    if(i==n)
        b(i)=td+tr;
    end
end
q=sqrt(n)+1;
p=sqrt(n);
z=n-sqrt(n);
o=2*sqrt(n);
%Right side column
for i=q:p:z
    b(i)=tl;
end
%Left side column
for i=o:p:z
    b(i)=tr;
end
b=b*(-1);