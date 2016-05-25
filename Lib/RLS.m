function [ error , recon] = RLS(in_vector, noise_vector)
%--------------------------------------------------------------------------
% Filtering
%--------------------------------------------------------------------------

% RLS parameters
ordr    = 4;                % filter order
lambda  = 0.998;              % forgetting factor
laminv  = 1/lambda;
delta   = 1.0;              % initialization parameter

% Initialise the filter
weights       = zeros(ordr,1);    % filter coefficients
P            = delta*eye(ordr);  % inverse correlation matrix
error       = in_vector*0;      % error signal

for m = ordr:length(in_vector)

    % Acquire chunk of data
    y = noise_vector(m:-1:m-ordr+1);

    % Error signal equation
    error(m) = in_vector(m)-weights'*y;
    
    % Parameters for efficiency
    Pi = P*y;
    
    % Filter gain vector update
    k = (Pi)/(lambda+y'*Pi);

    % Inverse correlation matrix update
    P = (P - k*y'*P)*laminv;

    % Filter coefficients adaption
    weights = weights + k*error(m);

    % Counter to show filter is working
    %if mod(m,1000) == 0
    %    disp([num2str(m/1000) ' of ' num2str(floor(length(x)/1000))])
    %end
    
end

% Signal Reconstruction
for m = ordr:length(in_vector)

    % Acquire chunk of data
    y = noise_vector(m:-1:m-ordr+1);

    % Error signal equation
    recon(m) = in_vector(m)-weights'*y;
end

end

