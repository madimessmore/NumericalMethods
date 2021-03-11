function[]=head_loss(f,df,r,rey_num,pipe_length,velo,grav,diam,octave_root)

h_loss = octave_root.*(pipe_length./diam)*((velo.^2)/(2.*grav));

% Define Tolerance
tol = 10^-5;


fprintf('\t      Head Loss\n\n')
fprintf('\n    %.6e   \n',h_loss);

end