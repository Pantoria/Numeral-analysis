function x=fun_backsub(A,b)
%Teaching assitant:Liu Zexuan
%Input -A is an n x n upper-triangular nonsigular matrix
%Input -b is an n x 1 vector
%Output -x is the solution to the linear system Ax=b
%Solve out x
n = length(b);
for k=n:-1:2
    b(k) = b(k)/A(k,k);
    b(1:k-1) = b(1:k-1)-b(k)*A(1:k-1,k);
end
b(1) = b(1)/A(1,1);
x = b;