function [R,y]=fun_givens(x,i,j)

u = 1e-10;
R=eye(length(x));

if abs(x(j))<u
    c = 1;
    s = 0;
else
    if abs(x(j))>abs(x(i))
        t = x(i)/x(j);
        s = 1/sqrt(1+t^2);
        c = s*t;
    else
        t = x(j)/x(i);
        c = 1/sqrt(1+t^2);
        s = c*t;
    end
end

R(i,i)=c;
R(i,j)=s;
R(j,i)=-s;
R(j,j)=c;

y=x(:);
y([i,j])=[sqrt(x(i)^2+x(j)^2),0];%sint cost
