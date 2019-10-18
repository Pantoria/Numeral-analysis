function [Q,R]=fun_householderQR(A)
u = 1e-10;
[m,n] = size(A);
Q = eye(m);

for j=1:n
    if j<m
        H = fun_Householder(A(j:m,j));
        A(j:m,j:n) = H*A(j:m,j:n);
        Q(j:m,j:n) = Q(j:m,j:n)*H;
    end
end

%A(A<u) = 0;
R = triu(A);
%Q(Q<u) = 0;