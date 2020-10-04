% exercise 1
clear all



%% exercise 6
clear all 

a = 0;
b = 1;
xlast = 4;
n = 8;

allinone(a,b,xlast,n)

%% exercise 7
clear all 

x0 = 0;     % Initial value of x 
y0 = 1;     % Initial value of y
xlast = 1;  % Last value of x in the interval [0,1]

minimal1(x0,y0,xlast);

%%
t0 = 0;
x0 = 0;
t1 = 3*10^(-3);
dt = 200000;

allinone(t0,x0,t1,dt)