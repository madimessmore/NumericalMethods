% Madisyn Messmore, EML 3034C Project Three

% The Essential Two Lines, as Given By Our Lord and Savior, Rodrigo
clc, close all, clear
format long

##% reading the files given containing matrices A and B
##A = dlmread('A.txt');
##B = dlmread('B.txt');

%making homemade matrices for initial testing
##A = [15,3,-9; 6,-9,-2.9; 8,3,11.1;];
##B = [1;2;3];
##sol = [1;3;5];

% Printing out our original matrices as-is
printf('\nOriginal A and B:\n');
printf('A = \n');
disp(A);
printf('B = \n');
disp(B);

% Checking A for diagonal dominance
dom = diag_dom_checker(A);
% dom2 = diagonal_dominance(A);

[x, A_tri, B_tri, iters] = gauss(A,B);

% printing the gauss
printf('\nUpper Triangulated A and B:\n');
printf('A_tri = \n');
disp(A_tri);
printf('B_tri = \n');
disp(B_tri);
printf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n')
printf('Iterations = %i\n\n', iters)
printf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n')


% I don't like the way it outputs in the command window so i made her give me the
% answer in a csv
##csvwrite('triangle_matrix.csv',A_tri);
##csvwrite('triangle_vect.csv', B_tri);

% printing the residual
fprintf('\nAnswer:\n');
fprintf('x = \n');
disp(x);
res = A*x - B;
fprintf('res = \n');
disp(res);
fprintf('Residual norm = %.6e\n', norm(res,Inf));

%also exporting my x vector because the command window gives me aids
##csvwrite('x.csv',x);

