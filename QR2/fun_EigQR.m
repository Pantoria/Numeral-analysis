function v=fun_EigQR(A,u)

n=length(A);
H=A;
for i=1:n-2
    x=H(i+1:n,i);
    Hi0=fun_Householder(x);
    Ii=diag(ones(i,1));
    Hi=zeros(n,n);
    Hi(1:i,1:i)=Ii;
    Hi(i+1:n,i+1:n)=Hi0;
    H=Hi*H*Hi;
end

while(1)
    i1=0;
    for i=2:n
        if(abs(H(i,i-1))<=(abs(H(i,i))+abs(H(i-1,i-1)))*u)
            H(i,i-1)=0;
        end
    end
    for i=n:-1:2
        if((i~=2 && H(i,i-1)~=0) && H(i-1,i-2)~=0)
            i2=i;
            for j=i2:-1:2
                if(H(j,j-1)==0)
                     i1=j;
                     H(i1:i2,i1:i2)=fun_QR2(H(i1:i2,i1:i2));
                    break;
                end
            end
            if(i1==0)
               H(1:i2,1:i2)=fun_QR2(H(1:i2,1:i2));
            end
            break;
        end
    end
    if(i==2)
        break;
    end
end

for i=2:n
    if (H(i,i-1)~=0)
        p=H(i,i)+H(i-1,i-1);
        q=H(i,i)*H(i-1,i-1)-H(i,i-1)*H(i-1,i);
        delta=p^2-4*q;
        H(i-1,i-1)=(p+sqrt(delta))/2;
        H(i,i)=(p-sqrt(delta))/2;
    end
end
v=diag(H);