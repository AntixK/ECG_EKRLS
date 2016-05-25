function [ out_vector ] = Add_PLI ( in_vector , coeff, t,mains_signal)
%**************************************************************
%--------------------------------------------------------------
% 		  ADD POWER LINE INTERFERENCE NOISE
%--------------------------------------------------------------
%**************************************************************
% Part of ECG De-Noising using EKRLS Project
% Function Description - This routine is for adding the Power Line Interference
% noise to the input pure ECG data - in_vector with varible  coefficient
% Input Parameters - 
% 		-> in_vector = Input Vector (Pure ECG)
%		-> coeff = The SNR of the resultant in Decibels
%		-> mains_signal = The Power Line Interference noise vector
% Output Prameters -
%		-> out_vector = The resultant vector with the added 
%                       Power Line Interference noise
%-----------------------------------------------------------------------  
   
    out_vector = in_vector + coeff*mains_signal;


end

