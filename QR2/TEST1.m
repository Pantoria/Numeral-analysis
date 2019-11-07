n=20;
p=-ones(n-2,1);
P1=diag(p,-1);
P2=diag(p,1);
T=4*eye(n-1)+P1+P2;
s=-eye(n-1);
S=zeros((n-1)^2);

for i=1:(n-1)*(n-2)
    S(n-1+i,i)=-1;
    S(i,n-1+i)=-1;
end

for i=1:n-1
    S((i-1)*(n-1)+1:i*(n-1),(i-1)*(n-1)+1:i*(n-1))=T;
end

x0=zeros((n-1)^2,1);
e=1*10-15;
b=rand((n-1)^2,1);
x=fun_CG(x0,S,b,e);
x1=S\b;
err=norm(x1-x,2);

disp("The 2-norm error is:");
disp(err);
    
    