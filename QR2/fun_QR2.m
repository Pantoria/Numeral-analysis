function H = fun_QR2(H)

n = length(H);
m = n-1;
s = H(m,m) + H(n,n);
t = H(m,m) * H(n,n) - H(m,n) * H(n,m);
x = H(1,1) * H(1,1) + H(1,2) * H(2,1) - s * H(1,1) + t;
y = H(2,1) * (H(1,1) + H(2,2)-s);
z = H(2,1) * H(3,2);

for k = 0:n-3
    Hk = zeros(n,n);
    Hk0 = fun_Householder([x,y,z]');
    if k == 0
        Hk(1:3,1:3) = Hk0;
        Hk(4:n,4:n) = diag(ones(n-3,1));
        H = Hk*H*Hk;
    else
        if k < n-3
            Hk(1:k,1:k) = diag(ones(k,1));
            Hk(k+1:k+3,k+1:k+3) = Hk0;
            Hk(k+4:n,k+4:n) = diag(ones(n-k-3,1));
            H = Hk * H * Hk;
        else
            Hk(1:k,1:k) = diag(ones(k,1));
            Hk(k+1:k+3,k+1:k+3) = Hk0;
            H = Hk * H * Hk;
        end
    end
    
    x = H(k+2,k+1);
    y = H(k+3,k+1);
    if k < n-3
        z = H(k+4,k+1);
    end
end

Hk = zeros(n,n);
Hk0 = fun_Householder([x,y]');
Hk(n-1:n,n-1:n) = Hk0;
Hk(1:n-2,1:n-2) = diag(ones(n-2,1));
H = Hk * H * Hk;

