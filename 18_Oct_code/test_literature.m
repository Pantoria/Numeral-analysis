A1 = [3, 1; 1, 2];
A2 = [1, 2; 3, 1];
b = 5*ones(2,1);

x1 = fun_jaccobiltr(A1, b);
x2 = fun_jaccobiltr(A2, b);
x3 = fun_gsltr(A1, b);
x4 = fun_gsltr(A2, b);

disp("jaccobi: norm(x1-A1\b)");
disp(norm(x1-A1\b));
disp("jaccobi: norm(x2-A2\b)");
disp(norm(x2-A2\b));
disp("gauss-seidel: norm(x3-A1\b)");
disp(norm(x3-A1\b));
disp("gauss-seidel: norm(x4-A2\b)");
disp(norm(x4-A1\b));