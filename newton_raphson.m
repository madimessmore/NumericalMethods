% Define the Function
function[]=newton_raphson(f, df, initial_guess, tol)

  %initial guess
  x(1) = initial_guess;
  %iterative convergence
  conv(1) = initial_guess;
  %initial residual
  res(1) = abs(f(x(1)));
  %counter for number of iterations
  k = 1;
  
  %print function output title and iteration 0
  fprintf('\n======================================\n');
  fprintf('\t      Newton-Raphson Method\n\n')
  fprintf('iteration     x     residual    convergence\n');
  fprintf('     %i    %.6e    %.4e    %.4e\n',k-1,x(1),res(1),conv(1));
  
  
  %creating an infinite iterative while loop that breaks on condition
  while (1)
      %compute new approximation of the roots
      x(k+1) = x(k) - f(x(k))/df(x(k));
      %compute iterative converge using new and old
      conv(k+1) = abs(x(k+1)-x(k));
      %compute residual using the new approx
      res(k+1) = abs(f(x(k+1)));
      
      %print current iteration's root, converge, and residual
      fprintf('     %i     %.6e    %.4e     %.4e\n',k,x(k+1),res(k+1),conv(k+1));
      
      %check if residual and iterative convergence met the tolerance
      if (res(k+1) <= tol && conv(k+1) <= tol)
        
        %if it does, we bussin out
        break;
        
      end
      
      %check if residual and iterative convergence are getting too thicc
      if (res(k+1) >= 10^8 || conv(k+1)>= 10^8)
        
        %if true, its diverging and we gotta get out and warn the homies
        fprintf('Error: Newton-Raphson Method Diverged');
        break;
        
      end
      
      %increase counter for iterations
      k++
      
    end
    
    fprintf('==================================================\n');
    
    %define vector containing total number of iterations
    iter = 0:1:k;
    
   %plot the iterative convergence and residual
  figure('name','Newton-Raphson Method');
  subplot(2,1,1);
  plot(iter, conv, 'r'), grid on
  title('Newton-Raphson Method');
  xlabel('Number of Iterations');
  ylabel('Iterative Convergence');
  
  subplot(2,1,2)
  plot(iter, res, 'b'), grid on
  title('Newton-Raphson Method');
  xlabel('Number of Iterations');
  ylabel('Residual');
  
end
  
% The end, get vectored
