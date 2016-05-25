function [  ] = prd_plot( org_data,noisy_data,filt_data,tle,flag )
%**************************************************************
%--------------------------------------------------------------
% 		PERCENTAGE ROOT MEAN SQUARE DIFFERENCE PLOT
%--------------------------------------------------------------
%**************************************************************
% Part of ECG De-Noising using EKRLS Project
% Function Description - This routine is for plotting the PRD
% plot with respect to the input noise in the ECG data.
% Input Parameters - 
% 		-> org_data  = The original pure ECG signal
%		-> filt_data = The filtered ECG signal 
%		-> noisy_data= The corresponding  noisy data vector
%		-> tle       = The tile string for the plot
%		-> flag      = Flag for algorithms (0=LMS, 1=RLS, 2=EKRLS)
%
%-----------------------------------------------------------------------  

	if(flag == 1)
		str = ' RLS filtered Signal';
	elseif(flag==0)
		str = ' LMS filtered Signal';
	elseif(flag==2)
		str = ' EKRLS filtered Signal';
	end
	
	s1 =sum((org_data(350:5000) - filt_data(350:5000)).^2);
	s2 =sum(org_data.^2);
	x = sqrt(s1/s2)*100;

	s1 =sum((org_data(350:5000) - noisy_data(350:5000)).^2);
	y = sqrt(s1/s2)*100;
	
	fig = figure('name',tle);
		hold on
		bar([y x],'FaceColor',[0.7 0.7 0.4])
		text(1,y+20, num2str([y]),'FontSize',12,'FontWeight','bold')
		text(2, x+20, num2str([ x]),'FontSize',12,'FontWeight','bold')
		set(gca, 'xtick',[1,2],  'xticklabel',{'Noisy Signal', str});
		title(tle);
		ylabel('Percentage Root Mean Difference ');
		ylim([0,y+30]);

	if(evalin('base', 'SAV_flag'))
		indx =  evalin('base', 'indx');
		print(fig,strcat('Plot_Images\',num2str(indx),'_',tle),'-dpng','-r0');
		indx =indx +1;
		assignin('base','indx',indx);
	end

end

