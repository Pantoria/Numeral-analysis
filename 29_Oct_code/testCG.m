% 我们来造一个大型稀疏正定矩阵，比较共轭梯度法和Gauss_Seidei方法迭代速度上的差异。
%为了方便，不妨构造一个三对角矩阵。
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

%测试一千万阶的方程组，CG方法在本机需要若干秒。此时，Gauss_Seidel方法卡死。
[x_CG] = fun_CG(x0,A,b,eps);
error_CG = norm(x_CG - true_x,2);

%来看看Gauss_Seidel方法的速度c
[x_G] = fun_gsltr(A,b);
error_G = norm(x_G - true_x,2);

% MATLAB对于特殊的一千万阶大规模方程组的求解也几乎是秒算，可见其矩阵运算功能的强大。
x_matlab = A\b;
error_matlab = norm(x_matlab - true_x,2);
profile viewer
p = profile('info');
profsave(p,'profile_results')