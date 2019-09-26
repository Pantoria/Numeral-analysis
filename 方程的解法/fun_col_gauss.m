function [x] = fun_col_gauss(A,b)
%Teaching assitant:Liu Zexuan
%Input  -A is an n x n nonsigular matrix
%Output -P is the transform matrix
%Output -L is a lower-triangular nonsigular matrix
%Output -U is a upper-triangular nonsigular matrix



[~,n]=size(A);
B=[A b];
for i=1:n-1
	[~,j]=max(abs(B(i:n,i)));
%exchange col
	C=B(i,:);
	B(i,:)=B(j+i-1,:); 
	B(j+i-1,:)=C;
%singular condition
    if A(i,i)==0
        fprintf( 'A is singular. no unique solution');
        break
    end
	for k=i+1:n
        temp=B(k,i)/B(i,i);
        B(k,i+1:n+1)=B(k,i+1:n+1)-temp*B(i,i+1:n+1);
	end 
end

x=fun_backsub(B(1:n,1:n),B(1:n,n+1));

