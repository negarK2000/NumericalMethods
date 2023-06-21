function [a]= Matrix_A(n)
%To form the coefficients matrix for solving at=b
a=zeros(n);
j=1;
k=1;
for i=1:n
    a(i,i)=-4;
    if(i~=sqrt(n)*j)
       a(i,i+1)= 1;
    else
        j=j+1;
    end
    %.....................
    if(i~=1)
        if(i~=sqrt(n)*k+1)
        a(i,i-1)=1;
    else
        k=k+1;
        end
    end
    %.....................
    if(i>sqrt(n))
        a(i,i-sqrt(n))=1;
    end
    %.....................
    if(i<=n-sqrt(n))
        a(i,i+sqrt(n))=1;
    end
end