% Study the IVP y' = f(x,y), y(a) = b
% on the interval [a,xlast] with n steps

function errors=allinone(a,b,xlast,n)
  %[Xsol,Ysol]=soln(a,b,xlast,n);  
  [X1,Y1]=euler(a,b,xlast,n);
  %[X2,Y2]=impeuler(a,b,xlast,n);
  %[X3,Y3]=rk(a,b,xlast,n);
  plot(X1,Y1)
  %plot(Xsol,Ysol,'g',X1,Y1,'r',X2,Y2,'b',X3,Y3,'oc');
  %legend('Exact solution', 'Euler', 'Improved Euler', 'Runge-Kutta')
  %xlabel('x-axis')
  %ylabel('y-axis')
  %title('Solutions of the IVP yp = y + x^2, y(0) = 1.')
  %errors=[(Ysol(n+1)-Y1(n+1))/Ysol(n+1),(Ysol(n+1)-Y2(n+1))/Ysol(n+1),(Ysol(n+1)-Y3(n+1))/Ysol(n+1)];
end

function yp=f(x,y)
yp = (50/(5*10^(-3))) * (sin(5000*x) - y);
end


function [X,Y]=euler(x,y,x1,n)
h = (x1 - x)/n;
X=x;
Y=y;
for i=1:n
  x=x+h;
  y=y+h*f(x,y);
  X=[X;x];
  Y=[Y;y];
end
end



function [X,Y]=impeuler(x,y,x1,n)
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
end



function [X,Y]=soln(x,y,x1,n)
h = (x1-x)/n;
X=x:h:x1;
Y = - X.^2 - 2.*X + 3*exp(X) - 2;
end