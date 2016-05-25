function [ error , recon] = EKRLS(in_vector, noise_vector)
%**************************************************************
%--------------------------------------------------------------
% Extended Kernel Recursive Least Squares Filtering
%--------------------------------------------------------------
%**************************************************************

% Filter Parameters
ordr    = 4;                % filter order
lambda  = 1.0;              % forgetting factor
laminv  = 1/lambda;
delta   = 1.0;              % initialization parameter
q = 0;
beta = 0;
alpha=1;

% Filter Initialization
weights       = zeros(ordr,1);    % filter coefficients
P       = delta*eye(ordr);  % inverse correlation matrix
error       = in_vector*0;      % error signal
A = alpha*eye(ordr);

for m = ordr:length(in_vector)

    % Acquire chunk of data
    y = noise_vector(m:-1:m-ordr+1);

    % Error signal equation
    error(m) = in_vector(m)-weights'*y;
    
    % Parameters for efficiency
    Pi = P*y;
    
    % Filter gain vector update
    k = A*((Pi)/(beta+lambda+y'*Pi));

    % Inverse correlation matrix update
    P = A*((P - k*y'*P)*laminv)*A'+beta*q*eye(ordr);

    % Filter coefficients adaption
    weights = A*weights + k*error(m);
   
end

% Signal Reconstruction
for m = ordr:length(in_vector)

    % Acquire chunk of data
    y = noise_vector(m:-1:m-ordr+1);

    % Error signal equation
    recon(m) = in_vector(m)-weights'*y;
end

end

