function  x = fun_jaccobiltr(A,b)

u = 1e-10;
D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;
B = D \ (L+U);
g = D \ b;
x = b;

while norm(x+B*x-g)>u
    x = g - B*x;
end

end