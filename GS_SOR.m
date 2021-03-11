function [x, res, conv, n] = GS_SOR(A,b,guess,tol,omega,max_iter=1e4)
  x = guess;
  n = 1; % iteration counter
  while n < max_iter
    x_old = x;  % store old solution vector
    for i=1:length(b)
      % gauss-seidel with SOR update
      x(i) = omega*(b(i) - A(i,:)*x(:) + A(i,i)*x(i))/A(i,i) + ...
        (1-omega)*x_old(i);
    endfor
    res(n) = norm(A*x-b,inf);  % compute residual
    conv(n) = norm(x-x_old,inf);  % compute iterative convergence
    if res(n) < tol && conv(n) < tol
      break
    endif
    if res(n) > 1e15
      printf("DIVERGED!!")
      break
    endif
    n++;
  endwhile
endfunction
