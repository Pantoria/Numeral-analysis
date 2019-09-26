%Totest the error
tic
n = 100;
A = rand(n);
b = rand(n,1);

x_t = A\b;
x = fun_col_gauss(A,b);

disp(norm(x_t-x,2));
toc