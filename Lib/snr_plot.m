function [  ] = snr_plot( noisy_data,filt_data,tle,flag )
%**************************************************************
%--------------------------------------------------------------
% 			SIGNAL-TO-NOISE RATIO PLOT
%--------------------------------------------------------------
%**************************************************************
% Part of ECG De-Noising using EKRLS Project
% FUNCTION DESCRIPTION - This routine is for plotting the SNR
% plot with respect to the input noise in the ECG data.
% Input Parameters - 
% 		-> noisy_data  = The original noisy ECG signal
%		-> filt_data = The filtered ECG signal 
%		-> tle       = The tile string for the plot
%		-> flag      = Flag for algorithms (0=LMS, 1=RLS, 2=EKRLS)
%
%-----------------------------------------------------------------------

	if(flag == 1)
		str = ' RLS filtered Signal';
	elseif(flag==0)
		str = ' LMS filtered Signal';
	elseif(flag == 2)
		str = ' EKRLS filtered Signal';
	end
	
	s1 =sum((filt_data(350:5000) - noisy_data(350:5000)).^2);
	s2 =sum(filt_data.^2);
	x = log10(sqrt(s1/s2))*10;
	y = snr(noisy_data);
	
	fig = figure('name',tle);
		bar([y,x],'FaceColor',[0 .5 .5]);
		text(1,y-2, num2str(y),'FontSize',12,'FontWeight','bold')
		text(2, x+2, num2str(x),'FontSize',12,'FontWeight','bold')
		set(gca, 'xtick',[1,2],  'xticklabel',{'Noisy Signal', str});
		title(tle);
		ylabel('SNR (dB) ');
		ylim([y-5 x+5]);

	if(evalin('base', 'SAV_flag'))
		indx =  evalin('base', 'indx');
		print(fig,strcat('Plot_Images\',num2str(indx),'_',tle),'-dpng','-r0');
		indx =indx +1;
		assignin('base','indx',indx);
	end
        
end

