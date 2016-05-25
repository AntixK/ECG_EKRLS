function [  ] = PSD( raw_vect, filt_vect,FS ,tle,flag)
%**************************************************************
%--------------------------------------------------------------
% 			POWER SPECTRAL DENSITY PLOT
%--------------------------------------------------------------
%**************************************************************
% Part of ECG De-Noising using EKRLS Project
% Function Description - This routine is for plotting the PSD
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
		str = 'Periodogram of RLS filtered Signal';
	elseif(flag==0)
		str = 'Periodogram of LMS filtered Signal';
	elseif(flag==2)
		str = ' Periodogram of EKRLS filtered Signal';
	end

	fig = figure('name',tle,'units','normalized','outerposition',[0 0 1 1]);
		subplot(2,1,1);
			N = length(raw_vect);
			xdft = fft(raw_vect);
			xdft = xdft(1:N/2+1);
			psdx = (1/(FS*N)) * abs(xdft).^2;
			psdx(2:end-1) = 2*psdx(2:end-1);
			freq = 0:FS/length(raw_vect):FS/2;

			plot(freq,10*log10(psdx))
			grid on
			title(tle)
			xlabel('Frequency (Hz)')
			ylabel('Power/Frequency (dB/Hz)')

		subplot(2,1,2);
			N = length(filt_vect);
			xdft = fft(filt_vect);
			xdft = xdft(1:N/2+1);
			psdx = (1/(FS*N)) * abs(xdft).^2;
			psdx(2:end-1) = 2*psdx(2:end-1);
			freq = 0:FS/length(filt_vect):FS/2;

			plot(freq,10*log10(psdx))
			grid on
			title(str)
			xlabel('Frequency (Hz)')
			ylabel('Power/Frequency (dB/Hz)')

	if(evalin('base', 'SAV_flag'))
		indx =  evalin('base', 'indx');
		print(fig,strcat('Plot_Images\',num2str(indx),'_',tle),'-dpng','-r0');
		indx =indx +1;
		assignin('base','indx',indx);
	end

end

