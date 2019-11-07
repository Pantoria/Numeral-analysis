u=1e-15;
n=8;
A=rand(n);
a=eig(A);
b=fun_EigQR(A,u);
err=norm(sort(a)-sort(b),2);
disp("The 2-norm error is:");
disp(err);