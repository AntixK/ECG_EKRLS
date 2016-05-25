function [out_vector] = ADD_BWN( in_vector, SNR_dB,bwn )
%**************************************************************
%--------------------------------------------------------------
% 			ADDING BASELINE WANDER NOISE
%--------------------------------------------------------------
%**************************************************************
% Part of ECG De-Noising using EKRLS Project
% Function Description - This routine is for adding the Baseline
% wander noise to the input pure ECG data - in_vector with varible SNR
% Input Parameters - 
% 		-> in_vector = Input Vector (Pure ECG)
%		-> SNR_dB = The SNR of the resultant in Decibels
%		-> bwn = The Baseline wander noise vector
% Output Prameters -
%		-> out_vector = The resultant vector with the added 
%                       Baseline wander noise
%-----------------------------------------------------------------------
    gain = 200; %Gain as given in the .info file
    L = length(in_vector);
    SNR_lin = 10^(SNR_dB/10);
    
    Es = sum((abs(in_vector)).^2)/L;
    
    n_var = sqrt(Es/SNR_lin);
    
    n = n_var*bwn/gain;
    
    out_vector = in_vector + n;

end



