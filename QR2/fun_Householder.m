function H=fun_Householder(x)
n=length(x);
H=diag(ones(n,1));
if(norm(x,inf)~=0)
    x=x/norm(x,inf);
    a=x(2:n)'*x(2:n);
else
    a=0;
end

if a==0
    return;
else
    b=sqrt(x(1)^2+a);
    if x(1)<=0
        v1=x(1)-b;
    else
        v1=-a/(x(1)+b);
    end
    x(1)=v1;
    H=H-2/(v1^2+a)*(x*x');
end



