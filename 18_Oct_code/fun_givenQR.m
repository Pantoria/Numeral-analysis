function [Q,R]=fun_givenQR(A)

[m,n]=size(A); %ÁÐÊý

R=A;
Q=eye(m);

for i=1:n-1 
    for j=i+1:m 
        x=R(:,i);
        rt=fun_givens(x,i,j);
        %r=blkdiag(eye(i-1),rt)
        Q=Q*rt';
        R=rt*R;
    end
end
