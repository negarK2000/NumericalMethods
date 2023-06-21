clear
clc

n=input('n= ');
tl=input('For Example: 300\nLeft Temperature= ');
tr=input('For Example: 100\nRight Temperature= ');
td=input('For Example: 500\nDown Temperature= ');
tu=input('For Example: 50\nUp Temperature= ');

x=input('For Example: [0 1]\nx range= ');
y=input('For Example: [0 1]\ny range= ');

m=n;
dx=(x(length(x))-x(1))/m;
dy=(y(length(y))-y(1))/n;

%...................................................

i=(n-1)*(n-1);
a=Matrix_A(i);
b=Matrix_B(i,tu,tl,tr,td);
t=LU_pivot(a,b);

T=zeros(n+1,m+1);

T(1,:)=tu;
T(:,1)=tl;
T(m+1,:)=td;
T(:,n+1)=tr;
T(1,1)   =(tl + tu)/2;
T(m+1,1) =(tl + td)/2;
T(1,n+1) =(tr+ tu)/2;
T(m+1,n+1)=(tr+ td)/2;

k=1;
for i=2:n
    for j=2:m
        T(i,j)=t(k);
        k=k+1;
    end
end

%...................................................
 xx=x(1):dx:x(length(x));
 yy=y(length(y)):-dy:y(1);
% [X,Y] = meshgrid(x,y);

figure
surf(xx,yy,T)
xlabel('x')
ylabel('y')
zlabel('T [C]')
colorbar

figure
[X,Y] = meshgrid(xx,yy);
Z=T;
[pp,dd]=contour(X,Y,Z);
clabel(pp,dd)
colorbar

%...................................................
xx=x(1)+dx:dx:x(length(x))-dx;
yy=y(length(y))-dy:-dy:y(1)+dy;
% [X,Y] = meshgrid(x,y);

figure
surf(xx,yy,T(2:m,2:n))
xlabel('x')
ylabel('y')
zlabel('T [C]')
colorbar

figure
[X,Y] = meshgrid(xx,yy);
Z=T(2:m,2:n);
[pp,dd]=contour(X,Y,Z);
clabel(pp,dd)
colorbar