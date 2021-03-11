function[A] = diag_dom_checker(A)

% setting an initial condition
dominant = true;
n = size(A,1);
col_vect = sum(A,2);
##fprintf("**********************************************************\n");
##disp(A);
##fprintf("**********************************************************\n");
##disp(col_vect);
##fprintf("**********************************************************\n");
% this gave me giga-ebola because the solution was so much simpler than i realized
% basically just collapsing the matrix into a column by adding each row
% then we subtract our diagonal element, A(i,i) 
for i=1:n
    
    row = abs(col_vect(i)-A(i,i));
##    fprintf("**********************************************************\n");
##    disp(col_vect(i));
##    fprintf("\n");
##    disp(abs(A(i,i)));
##    fprintf("\n");
##    disp(row);
##    fprintf("**********************************************************\n");
    
  % if our boi is less than the sum then we not gucci
  if abs(A(i,i)) < row
    dominant = false;
    fprintf('\n ======================================== \n\n');
    fprintf('\nMatrix A is not diagonally dominant\n\n');
    fprintf('\n ======================================== \n\n');
    break
  endif
endfor

% since dominant was declared true, if that didn't get changed we are gucci
if dominant == true
  fprintf('\n ======================================== \n\n');
  fprintf('\nMatrix A is diagonally dominant\n\n');
  fprintf('\n ======================================== \n\n');
endif

end