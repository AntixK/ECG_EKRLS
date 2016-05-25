function [  ] = Plots( org_data, noisy_data,filt_data,e_data, tle,flag )
%**************************************************************
%--------------------------------------------------------------
% 					PLOTS
%--------------------------------------------------------------
%**************************************************************
% Part of ECG De-Noising using EKRLS Project
% Function Description - This routine is for plotting the performance of 
% the algorithms with respect to the pure and noisy data.
% Input Parameters - 
% 		-> org_data  = The original pure ECG signal
%		-> filt_data = The filtered ECG signal 
%		-> noisy_data= The corresponding  noisy vector
%		-> e_data    = The corresponding error vector
%		-> tle       = The tile string for the plot
%		-> flag      = Flag for algorithms (0=LMS, 1=RLS, 2=EKRLS)
%
%-----------------------------------------------------------------------  
		if(flag == 1)
			str = ' RLS filtered Signal';
			str2 = 'RLS Plots';
		elseif(flag==0)
		   str = ' LMS filtered Signal';
		   str2 = 'LMS Plots';						 
		elseif(flag==2)
			str = ' EKRLS filtered Signal';
			str2 = 'EKRLS Plots';
		end
		
        fig = figure('name',str2,'units','normalized','outerposition',[0 0 1 1]);
			subplot(3,1,1);
				plot(org_data,'k');
				title('Pure Signal');
				xlabel('Samples n')
				ylabel('Amplitude (mV)')
				grid on
			
			subplot(3,1,2);
				plot(noisy_data,'g');
				title(tle);
				xlabel('Samples n')
				ylabel('Amplitude (mV)')
				grid on
			
			subplot(3,1,3);
				er_filt = sum(((org_data(4500:length(org_data)) - e_data(4500:length(org_data))').^2)...
				./length(org_data(4500:length(org_data))));
				plot(filt_data,'r');
				title(str);
				xlabel(strcat('Samples n               MSE = ',num2str(er_filt)))
				ylabel('Amplitude (mV)')
				grid on
        
        if(evalin('base', 'SAV_flag'))
			indx =  evalin('base', 'indx');
            print(fig,strcat('Plot_Images\',num2str(indx),'_',tle),'-dpng','-r0');
            indx =indx +1;
            assignin('base','indx',indx);
		end
end

