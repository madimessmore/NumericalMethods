% Madisyn Messmore, EML 3034C Project Two

% The Essential Two Lines, as Given By Our Lord and Savior, Rodrigo
clc, close all, clear
format long

% add some spice and flavor to our variables

% Our Functions
% I have two versions of each function because it didn't like my first attempt at each lol
##f = @(x) x.^-0.5  + 2*log10((0.0005/3.7)+(2.51/((1.182*10^5)*x.^0.5)));
##f = @(x) x.^(-0.5)  + 2.*log10((r./3.7)+(2.51./(rey_num.*x.^0.5)));
##df = @(x) -0.5*x.^-1.5 - ((((2.51/(1.182*10^5))*log10(e))/((0.0005/3.7)+(2.51/((1.182*10^5)*x.^0.5))))*x.^-1.5);
##df = @(x) -0.5.*x.^-1.5 - ((((2.51./rey_num)*0.4342944819)/((r./3.7)+(2.51./(rey_num*x.^0.5))))*x.^(-1.5));

f = @(x) (x.^2) - (2.*x) + 1;
df = @(x) (2.*x) - 2;


% Define Tolerance
tol = 10^-5;

% Initial Guesses
initial_guess1 = 4;
initial_guess2 = 4.5;
##a = 1;
##b = 2;

% Using octave's built in root finder
##octave_root = fzero(f, [0 2]);

##% Plot Function
##x = 0:0.001:.05;
##y = zeros(size(x,2));

% Generate the Graph of the Function
##figure('name', 'Finding the Root of f(x)')
##hold on
##scatter(octave_root,0,100,'k','o','filled')
##plot(x,f(x),'b',x,y,'r'), grid on
##title('Function f(x)')
##ylabel('f(x)')
##xlabel('x')
##hold off

% Calling the Newton-Raphson Method
newton_raphson(f, df, initial_guess1, tol);

% Calling the secant methods
secant(f, initial_guess1, initial_guess2, tol);

%call head loss function
##head_loss(f,df,r,rey_num,pipe_length,velo,grav,diam,octave_root);
##
##% Checking the Methods
##fprintf('\nOctave built-in root finder answer:\n');
##fprintf('x = %.6e\n\n', octave_root);
