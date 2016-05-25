function [ ] = Declare_flags()
%**************************************************************
%--------------------------------------------------------------
% 				DECLARE FLAGS
%--------------------------------------------------------------
%**************************************************************
% Part of ECG De-Noising using EKRLS Project
% Function Description - This routine is for declaring all the required
% flags in the base workspace so that they can be accessed easily
%
%-----------------------------------------------------------------------  

	assignin('base','SAV_flag',logical(0));
	assignin('base','indx',1);
	assignin('base','WN_flag',logical(0));
	assignin('base','PLI_flag',logical(0));
	assignin('base','BWN_flag',logical(0));
	assignin('base','EMN_flag',logical(0));
	assignin('base','MAN_flag',logical(0));
	assignin('base','SPEC_flag',logical(0));
	assignin('base','PRD_flag',logical(0));
	assignin('base','EM_flag',logical(0));
	assignin('base','PSD_flag',logical(0));
	assignin('base','SNR_flag',logical(0));
	assignin('base','RLS_flag',logical(0));
	assignin('base','EKRLS_flag',logical(0));
	assignin('base','LMS_flag',logical(0));
	assignin('base','data1',logical(0));
	assignin('base','data2',logical(0));
	assignin('base','data3',logical(0));

end

