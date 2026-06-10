function udot=f(t,uc,u0,C,R)
    udot=(u0-uc)/(C*R)
endfunction


R = 1000;
a = 0.1;
b = 0.9;
C = 100e-6;

//dane do wykresu ładowania
u0 = 5;
t0 = 0;
uc0 = a*u0;
t = 0:0.005:0.6;
uc = ode(uc0,t0,t,list(f,u0,C,R));

//dane do wykresu rozładowania
u1 = 0;
uc1 = uc($);
t1 = 0.6;
tr = 0.6:0.005:1.2;
ucr = ode(uc1,t1,tr,list(f,u1,C,R));


clf();
plot(t, uc, "r-", "linewidth", 2);
plot(tr,ucr, "r-", "linewidth", 2);
xtitle("Wykres ładowania i rozładowania kondensatora 100 uF z użyciem funkcji ODE", "Czas t[s]", "Napięcie Uc [V]");
xgrid();
