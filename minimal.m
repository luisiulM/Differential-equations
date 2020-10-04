% Study the IVP y' = f(x,y), y(a) = b
% on the interval [a,xlast]

function N = minimal(a,b,xlast)
n = 0;     % Initial number of steps

Y_1 = 100;   % These are just some arbitrary values, just so the while loop runs.
Y_2 = 0;     % Y_1 stands for Y(N) and Y_2 stands for Y(N+1)

while abs(Y_1 - Y_2) > 10^(-10)
    n = n + 1;
    Y_1 = rk(a,b,xlast,n);   % update Y(N)
    Y_2 = rk(a,b,xlast,n+1); % update Y(N+1)
end
N = n   % Give the minimal positive integer such that |Y(N)-Y(N+1)| < 10^(-10)
end


% Differential Equation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function yp=f(x,y)
yp = y;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Runge-Kutta with output Y(n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%