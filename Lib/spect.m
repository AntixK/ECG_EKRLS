function [ ] = spect( raw_vect, filt_vect,FS ,tle,flag)
%**************************************************************
%--------------------------------------------------------------
% 			  SPECTROGRAM PLOT
%--------------------------------------------------------------
%**************************************************************
% Part of ECG De-Noising using EKRLS Project
% FUNCTION DESCRIPTION - This routine is for plotting the PSD
% plot with respect to the input noise in the ECG data.
% Input Parameters - 
% 		-> raw_vect  = The original noisy ECG signal
%		-> filt_vect = The filtered ECG signal 
%		-> FS        = Sampling Frequency
%		-> tle       = The tile string for the plot
%		-> flag      = Flag for algorithms (0=LMS, 1=RLS, 2=EKRLS)
%
%-----------------------------------------------------------------------
	if(flag == 1)
		str = 'Spectrogram of RLS filtered Signal';
	elseif(flag==0)
		str = 'Spectrogram of LMS filtered Signal';
	elseif(flag == 2)
		str = ' Spectrogram of EKRLS filtered Signal';
	end

	fig = figure('name','Spectrogram','units','normalized','outerposition',[0 0 1 1]);
		subplot(2,1,1);
			spectrogram(raw_vect,100,80,100,FS,'yaxis');
			shading interp
			view(130,60);
			colormap autumn
			title(tle);
		
		subplot(2,1,2);
			spectrogram(filt_vect,100,80,100,FS,'yaxis');
			shading interp
			view(130,60);
			colormap autumn
			title(str);

	if(evalin('base', 'SAV_flag'))
		indx =  evalin('base', 'indx');
		print(fig,strcat('Plot_Images\',num2str(indx),'_',tle),'-dpng','-r0');
		indx =indx +1;
		assignin('base','indx',indx);
	end

end

