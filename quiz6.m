% The Essential Two Lines, as Given By Our Lord and Savior, Rodrigo
clc, close all, clear
format long

% reading the files given containing matrices A and B
%A = dlmread('A.txt');
%B = dlmread('B.txt');

%making homemade matrices for initial testing
A = [4.,2,1; 5,9,2; 5,2,8;];
B = [1;2;3];

% functions and their partials
f1 = (@x) cos(x) - x;
f2 = (@x) x - sin(x);

% Initial guesses
guess_1 = [3,2];
guess_2 = [3,2];

% vars for finite difference
del = 0.01;

% Printing out our original matrices as-is
printf('\nOriginal A and B:\n');
printf('A = \n');
disp(A);
printf('B = \n');
disp(B);

jacobian = jac(A);
jac_determinant = det(jacobian);
jacobi_app = jacobi(A);

fprintf("\n\n The Jacobian: \n\n");
fprintf('%.6e\n',jacobian);
fprintf("\n\n The Approximated Jacobian: \n\n");
fprintf('%.6e\n',jacobi_app);