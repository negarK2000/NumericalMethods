function []=gauss_jordan_elim(A0,B)
clear
clc

A=[A0 B];
[n,n2]=size(A)
%pivoting matrix A
for i=1:n-1
    for j=i+1:n
        if abs(A(j,i))>abs(A(i,i))
            T=A(j,:);
            A(j,:)=A(i,:);
            A(i,:)=T;
        end 
    end
end
%-------------------------------------------------
for k=1:n-1
    for i=k+1:n
        m=A(i,k)/A(k,k);
        for j=k:n+1
            A(i,j)=A(i,j)-m*A(k,j);
        end
    end
end
x(n)=A(n,n+1)/A(n,n);
for j=n-1:-1:1
    sum=0;
    for i=1:n-j
        sum=sum+A(j,n+1-i)*x(n+1-i);
    end
    x(j)=(A(j,n+1)-sum)/A(j,j);
end
disp('the answer is:')
disp(['x=  ' num2str(x)])