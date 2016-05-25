function [out_vector] = White_Noise_Gen( in_vector, SNR_dB,wn )
%**************************************************************
%--------------------------------------------------------------
% 		WHITE NOISE GENERATION AND ADDITION
%--------------------------------------------------------------
%**************************************************************
% Part of ECG De-Noising using EKRLS Project
% FUNCTION DESCRIPTION - This routine is for adding the White
% noise to the input pure ECG data - in_vector with varible SNR
% Input Parameters - 
% 		-> in_vector = Input Vector (Pure ECG)
%		-> SNR_dB = The SNR of the resultant in Decibels
%		-> wn = The White noise vector
% Output Prameters -
%		-> out_vector = The resultant vector with the added 
%                       White noise
%----------------------------------------------------------------
	gain = 1;
    L = length(in_vector);
    SNR_lin = 10^(SNR_dB/10);
    
    Es = sum((abs(in_vector)).^2)/L;
    
    n_var = sqrt(Es/SNR_lin);
    n = n_var*wn/gain;
    
    out_vector = in_vector + n;

end

