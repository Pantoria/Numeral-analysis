function x=fun_forwardsub(A,b)
%Teaching assitant:Liu Zexuan
%Input -A is an n x n lower-triangular nonsigular matrix
%Input -b is an n x 1 vector
%Output -x is the solution to the linear system Ax=b
%Solve out x
n = length(b);
for k=1:n-1
    b(k) = b(k)/A(k,k);
    b(k+1:n) = b(k+1:n)-b(k)*A(k+1:n,k);
end
b(n) = b(n)/A(n,n);
x = b;