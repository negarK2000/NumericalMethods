clear
clc
format long
global A1 B1

t=268.8:341.37;

p=10.^(3.9892-(1070.617./(t-40.454))).*1e5;
pc=33.6e5;
tc=469.8;
w=0.251;
r=8.314;
tol=1e-10;

%...SRK...

a1=0.42747*r^2*tc^2/pc;
b1=0.08664*r*tc/pc;


tr=zeros(1,max(size(t)));
alfa1=zeros(1,max(size(t)));

z1=zeros(1,max(size(t)));
ea1=zeros(1,max(size(t)));
iter1=zeros(1,max(size(t)));

z2=zeros(1,max(size(t)));
ea2=zeros(1,max(size(t)));
iter2=zeros(1,max(size(t)));

v_liq1=zeros(1,max(size(t)));
v_vap1=zeros(1,max(size(t)));

for i=1:max(size(t))
    tr(i)=t(i)/tc;
    alfa1(i)=(1+(0.48508+1.55171*w-0.15613*w^2)*(1-tr(i)^0.5)).^2;
    A1=a1*alfa1(i)*p(i)/(r^2*t(i)^2);
    B1=b1*p(i)/(r*t(i));
    
    [z1(i) , ea1(i) ,iter1(i) ]=Newton_method(@fx_SRK , @dfx_SRK , 0 , tol);
    [z2(i) , ea2(i) ,iter2(i) ]=Newton_method(@fx_SRK , @dfx_SRK , 1 , tol);
    
    v_liq1(i)=z1(i)*t(i)*8.314/p(i);
    v_vap1(i)=z2(i)*t(i)*8.314/p(i);
end


plot(v_liq1*1000,p*1e-5)
grid
hold on
plot(v_vap1*1000,p*1e-5)
xlabel('Volume [m^3/kg.mol]')
ylabel('pressure [bar]')
legend('liq','vap')
title 'P-V diagram SRK'
hold off

...peng_robinson...

global A2 B2

a2=0.45724*r^2*tc^2/pc;
b2=0.07780*r*tc/pc;

tr=zeros(1,max(size(t)));
alfa2=zeros(1,max(size(t)));

z3=zeros(1,max(size(t)));
ea3=zeros(1,max(size(t)));
iter3=zeros(1,max(size(t)));

z4=zeros(1,max(size(t)));
ea4=zeros(1,max(size(t)));
iter4=zeros(1,max(size(t)));

v_liq2=zeros(1,max(size(t)));
v_vap2=zeros(1,max(size(t)));

for i=1:max(size(t))
    tr(i)=t(i)/tc;
    alfa2(i)=(1+(0.37464+1.54226*w-0.26992*w^2)*(1-tr(i)^0.5)).^2;
    A2=a2*alfa2(i)*p(i)/(r^2*t(i)^2);
    B2=b2*p(i)/(r*t(i));
    
    [z3(i) , ea3(i) ,iter3(i) ]=Newton_method(@fx_peng_robinson , @dfx_peng_robinson , 0 , tol);
    [z4(i) , ea4(i) ,iter4(i) ]=Newton_method(@fx_peng_robinson , @dfx_peng_robinson , 1 , tol);
    
    v_liq2(i)=z3(i)*t(i)*8.314/p(i);
    v_vap2(i)=z4(i)*t(i)*8.314/p(i);
end

figure (2)
plot(v_liq2*1000,p*1e-5)
grid
hold on
plot(v_vap2*1000,p*1e-5)
xlabel('Volume [m^3/kg.mol]')
ylabel('pressure [bar]')
legend('liq','vap')
title 'P-V diagram Peng Robinson'
hold off

%...P-T diagram...

figure (3)
plot(t,p*1e-5)
xlabel('Temperature [K]')
ylabel('pressure [bar]')
title 'P-T diagram'
grid

%...Solution_Table...

fprintf('\n')
disp('SRK & Peng Robinson Table')
fprintf('\n')
solution=[t' p' v_liq1'  v_vap1' v_liq2' v_vap2'];
disp('       P_Saturation                     SRK                                Peng_Robinson         ')
disp('-------------------------------------------------------------------------------------------------------')
disp('          P                 V_liq1              V_vap1              V_liq2               V_vap1')
disp('-------------------------------------------------------------------------------------------------------')
disp(solution)