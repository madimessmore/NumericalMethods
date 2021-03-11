function [] = bisection(f, initial_guess1, initial_guess2, tol)
  
  % Define initial guess
  x(1) = a;
  x(2) = b;
  
  % Define initial iterative convergence
  conv(2) = abs((x(2)-x(1))/2);
  
  % Define the initial residual
  res(1) = abs(f((x(1)+x(2))/2));
  
  % Define counter for number of iterations
  k = 1;
  
  %Print function output title and iterations 0 and 1
  fprintf('\n=======================================================\n');
  fprintf('\t\t   Bisection Method\n\n');
  fprintf('iteration    x    residual   convergence\n');
  fprintf('------------------------------------------------------\n');
  fprintf('     %i    %.6e    %.4e    %.4e\n',k-1,x(1),res(1),conv(1));
  
  % infinite loop time bois (at least until conditions are met)
  while (1)
    
    %computing new approximation of the root
    x(k+1) = x(k) - f(x(k))*(x(k)-x(k-1))/(f(x(k))-f(x(k-1)));
    %compute iterative convergence using new and old approx
    conv(k+1) = abs(x(k+1)-x(k));
    %compute residual using new approx
    res(k+1) = abs(f(x(k+1)));
    
    %print current iteration's root, convergence, and residual vals
    fprintf('    %i    %.6e   %.4e    %.4e\n',k,x(k+1),res(k+1),conv(k+1));
    
    %checkin if residual and iterative convergence met tolerance
    if (res(k+1) <= tol && conv(k+1) <= tol)
      
      %if true, we breakin out of dis farming tool
      break;
      
    end
    
    %check if residual and iterative are becoming too thicc
    if (res(k+1) >= 10^8 || conv(k+1) >= 10^8)
      
      %if true, then we do be diverging (big sad) so we gotta bust out
      fprintf('Error: Secant Method Diverged');
      break;
      
    end
    
    %increase counter for iterations
    k++
    
  end
  
  fprintf('=================================================\n');
  
  %define the vector containing total number of iterations
  iter = 0:1:k;
  
  %plot the iterative convergence and residual
  figure('name','Secant Method');
  subplot(2,1,1);
  plot(iter, conv, 'r'), grid on
  title('Secant Method');
  xlabel('Number of Iterations');
  ylabel('Iterative Convergence');
  
  subplot(2,1,2)
  plot(iter, res, 'b'), grid on
  title('Secant Method');
  xlabel('Number of Iterations');
  ylabel('Residual');
  
end