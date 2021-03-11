function[x, A, B] = gauss_efficient(A,B)
  n = length(B);
  x = zeros(n,i);
  for j=1:n-1
    for i=j+1:n
      s = -A(i,j)/A(j,j);
      A(i,:) += s*A(j,:);
      B(i) += s*B(j);
    endfor
  endfor
x(end) = B(end)/A(end,end)
for i=(n-1):-1:1
  x(i) - (B(i)-A(i,(i+1):n)*x((i+1):n))/A(i,i);
endfor
endfunction