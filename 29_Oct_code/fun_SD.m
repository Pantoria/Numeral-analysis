function [x]=fun_SD(A,b,e)

[n,~] = size(A);
x = zeros(n,1);
r = b;
k = 0;

while 1
    if norm(r)<e
        break
    else
        k = k + 1;
        alpha = r'*r / (r'*A*r);
        x = x + alpha*r;
        r = b - A*x;
    end
end

end