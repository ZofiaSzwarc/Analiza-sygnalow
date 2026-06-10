//rozwiązanie równania ładowania
function Uc =f1(t,u0,C,R,a)
    Uc = u0 - u0*(1-a)*((%e)**(-t/(R*C)))
endfunction

//rozwiązanie równania rozładowania
function Ucr =f2(t,u1,C,R)
    Ucr = u1*((%e)**(-t/(R*C)))
endfunction

R = 1000;
a = 0.1;
b = 0.9;
C = 100e-6;
u0 = 5; 

t = 0:0.005:0.6;
UL = f1(t,u0,C,R,a);

u1 = UL($)
tr = 0.6:0.005:1.0;
UR = f2(tr-0.6,u1,C,R);

clf();
plot(t, UL, "b-", "linewidth", 2);
plot(tr,UR, "b-", "linewidth", 2);
xtitle("Wykres ładowania i rozładowania kondensatora 100 uF", "Czas t[s]", "Napięcie Uc [V]");
xgrid();
