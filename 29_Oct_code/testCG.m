% ��������һ������ϡ���������󣬱ȽϹ����ݶȷ���Gauss_Seidei���������ٶ��ϵĲ��졣
%Ϊ�˷��㣬��������һ�����ԽǾ���
clc
clear
profile on
m =10000;
e = ones (m,1);
A = spdiags ([ e,4*e,e ],[-1,0,1],m,m);
%full(A)
true_x = rand(m,1);
b = A * true_x;
x0 = rand(m,1);
eps = 1.0e-10;

%����һǧ��׵ķ����飬CG�����ڱ�����Ҫ�����롣��ʱ��Gauss_Seidel����������
[x_CG] = fun_CG(x0,A,b,eps);
error_CG = norm(x_CG - true_x,2);

%������Gauss_Seidel�������ٶ�c
[x_G] = fun_gsltr(A,b);
error_G = norm(x_G - true_x,2);

% MATLAB���������һǧ��״��ģ����������Ҳ���������㣬�ɼ���������㹦�ܵ�ǿ��
x_matlab = A\b;
error_matlab = norm(x_matlab - true_x,2);
profile viewer
p = profile('info');
profsave(p,'profile_results')