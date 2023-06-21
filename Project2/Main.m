clear
clc
format long
global A B

hp=input('Enter Step Size for Pressure\nFor Example hp=100\nhp= ');
ht=input('Enter Step Size for Temperature\nFor Example ht=1\nht= ');

p=1:hp:670e3;
t1=380-ht;
t2=380+ht;
t=t1:ht:t2;

pc=33.6e5;
tc=469.8;
w=0.251;
r=8.314;
tol=1e-10;

%...........SRK............

a=0.42747*r^2*tc^2/pc;
b=0.08664*r*tc/pc;

tr=zeros(1,max(size(t)));
alfa=zeros(1,max(size(t)));
z=zeros(1,max(size(t)));
ea=zeros(1,max(size(t)));
iter=zeros(1,max(size(t)));

diff=zeros(1,max(size(p)));
func=zeros(1,max(size(p)));

for j=1:max(size(p))
    
    for i=1:max(size(t))
    tr(i)=t(i)/tc;
    alfa(i)=(1+(0.48508+1.55171*w-0.15613*w^2)*(1-tr(i)^0.5)).^2;
    A=a*alfa(i)*p(j)/(r^2*t(i)^2);
    B=b*p(j)/(r*t(i));
    
    [z(i) , ea(i) ,iter(i)]=Newton_method(@fx_SRK, @dfx_SRK, 1 , tol);
     
    end
    diff(j)=(z(3)-z(1))/2/ht;
    func(j)=diff(j) * 1/p(j);
    
end

%...........Antegral............

Hr=zeros(1,max(size(p)));
antegral=zeros(1,max(size(p)));

for j=1:max(size(p))
    x = 1;
    sum = func(1);
    
    for i=2:j-1
       x = x + hp;
       sum = sum + 2*func(i);
    end

    sum = sum + func(j);
    antegral(j) = sum * hp/2;
    Hr(j)=r*t(2)^2*(-1)*antegral(j);
    
end

%...........Plot.................

xp=p/1000;
plot(xp,Hr);
xlabel('Pressure [kpa]');
ylabel('Enthalpy [J/mol]');
xlim([xp(1),xp(max(size(p)))]);
ylim([Hr(max(size(p))),Hr(1)]);
grid;