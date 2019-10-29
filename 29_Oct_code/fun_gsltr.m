function x = fun_gsltr(A,b)

u = 1e-10;
D = diag(diag(A));
g = D \ b;
T = D \ (A-D);
x = b;

while norm(x-g+T*x)>u
   for i = 1:length(b)
       x1 = g - T*x;
       x(i) = x1(i);
   end
end
end
