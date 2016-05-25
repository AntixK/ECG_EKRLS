function [  ] = em_plot( org_data,filt_data,noise,tle,flag )
%**************************************************************
%--------------------------------------------------------------
% 					ERROR MAGNITUDE PLOT
%--------------------------------------------------------------
%**************************************************************
% Part of ECG De-Noising using EKRLS Project
% Function Description - This routine is for plotting the error magnitude 
% plot with respect to the input noise in the ECG data.
% Input Parameters - 
% 		-> org_data  = The original pure ECG signal
%		-> filt_data = The filtered ECG signal 
%		-> noise     = The corresponding  noise vector
%		-> tle       = The tile string for the plot
%		-> flag      = Flag for algorithms (0=LMS, 1=RLS, 2=EKRLS)
%
%-----------------------------------------------------------------------  

	er = org_data - filt_data';
	if(flag ==1)
		str = 'RLS Error';
	elseif(flag==0)
		str = 'LMS Error';
	 elseif(flag==2)
		str = ' EKRLS Error';
	end

	fig = figure('name',tle);
		subplot(2,1,1);
			plot(noise,'r');
			xlabel('Samples n');
			ylabel('Source Noise');
			title(' Source Noise Plot');
			grid on

		subplot(2,1,2);
			plot(er);
			title(tle);
			xlabel('Samples n');
			ylabel(str);
			grid on
			ylim([-100 200])

	if(evalin('base', 'SAV_flag'))
		indx =  evalin('base', 'indx');
		print(fig,strcat('Plot_Images\',num2str(indx),'_',tle),'-dpng','-r0');
		indx =indx +1;
		assignin('base','indx',indx);
	end
end

