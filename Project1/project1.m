% Madisyn Messmore, EML 3034C Project One
% Due Friday, 01/29

% The Essential Two Lines, as Given By Our Lord and Savior, Rodrigo
clc, close all, clear
format long

% Our "anonymous" function f(x) because we love good logic
f = @(x) exp(-0.5*x)*(sin(2*x)+ cos(2*x));
% The exact first derivative of f(x)
df = @(x) exp(-0.5*x)*((1.5*cos(2*x))- (2.5*sin(2*x)));

% Defining the x value to approximate the first derivative
x = 1.0;

% A for-loop for all values of delta
for i = 1:20
  
    del(i) = 10^(-i);
    
    % Backward Finite Difference
    y_diff_backward(i) = (f(x) - f(x-del(i)))/del(i);
    y_diff_backward_error(i) = abs(y_diff_backward(i) - df(x));
    
    % Forward Finite Difference
    y_diff_forward(i) = (f(x+del(i))-f(x))/del(i);
    y_diff_forward_error(i) = abs(y_diff_forward(i) - df(x));
    
    % Central Finite Difference
    y_diff_central(i) = (f(x + del(i)) - f(x - del(i)))/(2*del(i));
    y_diff_central_error(i) = abs(y_diff_central(i) - df(x));

end

% Comparison of all methods with a graph
figure
hold on
plot(log10(del),log10(y_diff_forward_error))
plot(log10(del),log10(y_diff_backward_error))
plot(log10(del),log10(y_diff_central_error))
xlabel('\Delta'), ylabel('Error')
title('Error on Forward, Backward, and Central')
legend('Forward','Backward','Central')
grid on, hold off

% Cool lil Bonus Part: building the table of results Manual Edition
table = zeros(size(del,2),4);
table(:,1) = del';
table(:,2) = y_diff_forward_error';
table(:,3) = y_diff_backward_error';
table(:,4) = y_diff_central_error';
disp(table)

% Single Precision Time Y'all - gotta clear the double junk
clear

% Defining the anonymous functions again now that the vars have been cleared
f = @(x) 0.5 - 0.5*x*sin(2*x);
df = @(x) -0.5*sin(2*x)-x*cos(2*x);

% Select x value to evaluate derivative
x = single(1.25);

for i = single(1:20)
  del(i) = single(10^(-i));
  
  % Backward Finite Difference
  y_diff_backward(i) = single((f(x) - f(x-del(i)))/del(i));
  y_diff_backward_error(i) = single(abs(y_diff_backward(i) - df(x)));
  
  % Forward Finite Difference
  y_diff_forward(i) = single((f(x+del(i))-f(x))/del(i));
  y_diff_forward_error(i) = single(abs(y_diff_forward(i) - df(x)));
  
  % Central Finite Difference
  y_diff_central(i) = single((f(x + del(i)) - f(x - del(i)))/(2*del(i)));
  y_diff_central_error(i) = single(abs(y_diff_central(i) - df(x)));
  
end

% Comparison of all methods with a graph: Round 2
figure
hold on
plot(log10(del),log10(y_diff_forward_error))
plot(log10(del),log10(y_diff_backward_error))
plot(log10(del),log10(y_diff_central_error))
xlabel('\Delta'), ylabel('Error')
title('Error on Forward, Backward, and Central')
legend('Forward','Backward','Central')
grid on, hold off

% Table using Octave/Matlab notation: AKA lame
table = [del', y_diff_forward_error', y_diff_backward_error', y_diff_central_error'];
disp(table)

