% Study the IVP y' = f(x,y), y(a) = b
% on the interval [a,xlast] with n steps

function N = minimal(a,b,x1)
n = 0;     % Initial number of steps

Y_1 = 100;   % These are just some arbitrary values, just so the while loop runs.
Y_2 = 0;     % Y_1 stands for Y(N) and Y_2 stands for Y(N+1)

while abs(Y_1 - exp(1)) > 10^(-10)
    n = n + 1;
    Y_1 = impeuler(a,b,x1,n);   
    Y_2 = impeuler(a,b,x1,n+1);  
end
N = n 
end


function yp=f(x,y)
yp = y;
end


function Y = rk(x,y,x1,n)
h = (x1-x)/n;
X=x;
Y=y;
for i=1:n
  k1=f(x,y);
  k2=f(x+h/2,y+h*k1/2);
  k3=f(x+h/2,y+h*k2/2);
  k4=f(x+h,y+h*k3);
  k=(k1+2*k2+2*k3+k4)/6;
  x=x+h;
  y=y+h*k;
  X=[X;x];
  Y=[Y;y];
end
Y = Y( length(Y) );
end

function Y=impeuler(x,y,x1,n)
h = (x1 - x)/n;
X=x;
Y=y;
for i=1:n
  k1=f(x,y);
  k2=f(x+h,y+h*k1);
  k=(k1+k2)/2;
  x=x+h;
  y=y+h*k;
  X=[X;x];
  Y=[Y;y];
end
Y = Y( length(Y) );
end