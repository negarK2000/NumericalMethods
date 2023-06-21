% solve tridiagonal matrix

% A = coefficients matrix
% d = right hand side vector
% n = the number of unknowns
% x = solution vector

clear
clc

clear all
n=input('enter n for equations: ');
A=input('input coefficient matrix: ');
d=input('input answer matrix: ');
w=zeros(n,1);
q=zeros(n,1);
g=zeros(n,1);
w(1,1)=A(1,1);
g(1,1)=d(1,1)/w(1,1);
for i=2:n
    q(i-1,1)=A(i-1,i)/w(i-1,1);
    w(i,1)=A(i,i)-A(i,i-1)*q(i-1,1);
    g(i,1)=(d(i,1)-A(i,i-1)*g(i-1,1))/w(i,1);
end
x(n,1)=g(n,1);
for i=n-1:-1:1
    x(i,1)=g(i,1)-q(i,1)*x(i+1,1);
end
x