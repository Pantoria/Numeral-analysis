function[x]=fun_CG(x,A,b,e)
k=0;
r=b-A*x;
rho=r'*r;

while (rho^0.5>e*norm(b,2) && k<=1000)
    k=k+1;
    if k==1
        p=r;
    else
        beta=rho/rho1;
        p=r+beta*p;
    end

    w=A*p;
    alpha=rho/(p'*w);
    x=x+alpha*p;
    r=r-alpha*w;
    rho1=rho;
    rho=r'*r;
end
