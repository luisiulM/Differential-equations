clear all

t = 0:0.05:1;
x = 0:0.05:5;
[X,T] = meshgrid(x,t);
N = 10;
S = 0;
for n = 1:N+1
    
   S = S + (-1)^n/n^2 * exp(-n^2*pi^2*T/250) .* cos(n*pi*X/5); 
    
end

u = 25/3 + 100/pi^2 * S;

surf(X,T,u)
xlabel('x axis')
ylabel('Time axis (t)')
zlabel('Heat equation u(x,t)')