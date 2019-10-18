n = 500;
A = rand(n);
[Q1,R2]=fun_householderQR(A);
[Q2,R3]=qr(A);