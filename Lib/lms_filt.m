function [recons] = lms_filt( org_data, noisy_data, mu )
%UNTITLED4 Summary of this function goes here
%   Detaild explanation goes here
sysorder = 5;

%This function is submitted to make inverse Z-transform (Matlab central file exchange)
%The first sysorder weight value

% if you use ldiv this will give h :filter weights to be

%begin of algorithm
w = zeros ( sysorder  , 1 ) ;
for n = sysorder : length(org_data)
	u = noisy_data(n-sysorder+1:n) ;
    y(n)= w' * u;
    p = u'*u;
    e(n) = (org_data(n) - y(n));

% Start with big mu for speeding the convergence then slow down to reach the correct weights
%     if n < 500
%         mu=0.32;
%     else
%         mu=0.15;
%     end

w = w + mu * (u *e(n)./p);
end 

%LMS Reconstruction
for n =  sysorder : length(noisy_data)
	u = org_data(n:-1:n-sysorder+1) ;
    y(n) = w' * u ;
    recons(n) = org_data(n) - y(n) ;
end 
recons =  recons;

end

