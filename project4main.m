% Project 4
clc, clear, close all, format long

##A = dlmread('fin_data_A_matrix_SP_2021.txt');
##b = dlmread('fin_data_b_vector_SP_2021.txt');
A = [8,-2,5;2,4,1;4,-1,6];
b = [5;0;4];

% initial guess
guess = zeros(length(b),1);
guess(:) = 150;

tol = 10^-4;
omega = 1;  % SOR parameter

[x, res, conv, num_iters] = GS_SOR(A,b,guess,tol,omega);
printf("using omega = %.2f", omega)
printf('\nnum iters to converge = %i\n',num_iters)
printf('x = \n')
disp(x)
printf('\nres = %.6e\n', res(end))
printf('\nres after 3 = %.6e\n', res(3))
printf('conv = %.6e\n\n', conv(end))
printf("===================================\n")

% run GS SOR for different omegas and save number of iterations
%  to convergence for each omega
omegas = 0.1 : 0.1 : 1.9;  % remember, start : step : stop
for i = 1:length(omegas)
  [x, res, conv, iters] = GS_SOR(A,b,guess,tol,omegas(i));
  iters_to_conv(i) = iters;
  printf('omega = %.2f took %i iterations\n',omegas(i),iters_to_conv(i))
end

% plot omega vs number of iterations to convergence
figure(1)  % number your figures as below so you can always reference it later
plot(omegas, iters_to_conv), grid on
title("Finding the optimal Omega")
xlabel("Relaxation Param, Omega")
ylabel("Number of Iterations to Convergence")


% plot residual norm at each iteration for different omegas
% we could automate this but since only a few lines.. 
%  probably faster and simpler to copy/paste
%  different story if we wanted to do this many times..
 
% use "semilogy" instead of "plot" to plot y axis using log10 scale
% feel free to use "plot" instead of "semilogy" so your plots look like
%  in lecture (decaying exponential)

figure(2)
hold on
[x, res, conv, iters] = GS_SOR(A,b,guess,tol,0.8);
semilogy(1:iters, res)
[x, res, conv, iters] = GS_SOR(A,b,guess,tol,1.5);
semilogy(1:iters, res)
[x, res, conv, iters] = GS_SOR(A,b,guess,tol,1.8);
semilogy(1:iters, res)
title("Residual at each iteration for various omegas")
xlabel("iteration")
ylabel("residual infinity norm")
legend("0.8", "1.5", "1.8")
