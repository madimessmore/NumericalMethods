function[x, A, B, iters] = gauss(A,B)
  printf("Converting A to upper triangular:\n")
  n = length(B); % getting number of equations
  x = zeros(n,1); % allocating memory
  iters = 1;
  for i=1:n-1
    s = A(i+1:n,i)/A(i,i); %calculating the multiplier
    A(i+1:n,:) -= s.*A(i,:); %applying ERO to the row of A
    B(i+1:n) -= s.*B(i); % applying ERO to B
    disp(A)
    printf("\n")
  endfor
  
  % backsub - basically getting the unknowns from the bottom
  x(end)=B(end)/A(end,end);
  for i=(n-1):-1:1
    x(i) = (B(i)-A(i,(i+1):n)*x((i+1):n))/A(i,i);
    iters++;
  endfor
endfunction

% note: this is the not-so-efficient version of the function
% but i like it so i really dont give a hoot