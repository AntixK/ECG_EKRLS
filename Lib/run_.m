function [ ] =run_( )
clc;

	indx =  evalin('base', 'indx');
	indx = 1;
	assignin('base','indx',indx);
	rmdir('Plot_Images','s');
	mkdir('Plot_Images');
	 
	% import data
		RLS_flag = evalin('base','RLS_flag');
		LMS_flag = evalin('base','LMS_flag');
		EKRLS_flag = evalin('base','EKRLS_flag');

		WN_flag  = evalin('base','WN_flag');
		EMN_flag = evalin('base','EMN_flag');
		MAN_flag = evalin('base','MAN_flag');
		BWN_flag = evalin('base','BWN_flag');
		PLI_flag = evalin('base','PLI_flag');

		PRD_flag  = evalin('base','PRD_flag');
		SPEC_flag = evalin('base','SPEC_flag');
		EM_flag   = evalin('base','EM_flag');

		SNR_flag = evalin('base','SNR_flag');
		PSD_flag = evalin('base','PSD_flag');
		data1 = evalin('base','data1');
		data2 = evalin('base','data2');
		data3 = evalin('base','data3');

		load('ECG_database.mat');
		Data1 = Org_Data1(2,:);
		Data2 = Org_Data2(2,:);
		Data3 = Org_Data3(2,:);

		if(data1 == true)
			Data1 = Data1;
		elseif (data2 == true)
			Data1 = Data2;
		elseif(data3 == true)
			 Data1 = Data3;
		end

	% Add white noise to signal
	WN_data = White_Noise_Gen(Data1, -20,wn);
	% Add PLI to signal 
	PLI_data = Add_PLI(Data1, 20, TIME,mains_signal);
	% Get Wander noise signal 
	BWN_data = ADD_BWN(Data1, -10,bwn);
	% Get Muscle artifact signal 
	EMN_data = ADD_EMN(Data1, -20,emn);
	% Get electrode movement noise signal 
	MAN_data = ADD_MAN(Data1,-20,man);

	
%% RLS ALGORITHM
if(RLS_flag == true)
    
    if(WN_flag == true)
        [e_wn, wn_filt] = RLS(WN_data', wn');        
        Plots(Data1, WN_data,wn_filt,e_wn,'ECG Signal with White Noise',1);  
		
        if(SPEC_flag == true)            
            spect(WN_data,wn_filt,FS,'Spectrogram of ECG Signal with White Noise',1);
        end 
		
        if(PSD_flag == true)
            PSD(WN_data, wn_filt,FS,' Periodogram of White Noise ECG Signal',1);
        end
        
        if(SNR_flag == true)
            snr_plot(WN_data, wn_filt, ' Bar plot of SNR improvement in White Noise ECG',1);
        end
        
        if(PRD_flag == true)
            prd_plot(Data1, WN_data, wn_filt, ' Bar plot of PRD improvement in White Noise ECG',1);
        end
        
        if(EM_flag == true)
            em_plot(Data1,  e_wn, wn ,' RLS Error Plot of White Noise ECG',1);
        end
        
    end
    
    if(PLI_flag == true)
        [e_pli, pli_filt] = RLS(PLI_data', mains_signal');        
        Plots(Data1, PLI_data,pli_filt,e_pli,'ECG Signal with Power Line Interference Noise',1); 
		
        if(SPEC_flag == true)            
            spect(PLI_data,pli_filt, FS,'Spectrogram of ECG Signal with PLI Noise',1);
        end     
		
        if(PSD_flag == true)
            PSD(PLI_data, pli_filt, FS,' Periodogram of Power Line Interference Noise ECG Signal',1);
        end 
        
        if(SNR_flag == true)
            snr_plot(PLI_data, pli_filt, ' Bar plot of SNR improvement in PLI ECG',1);
        end 
        
        if(PRD_flag == true)
            prd_plot(Data1,PLI_data, pli_filt, ' Bar plot of PRD improvement in PLI ECG',1);
        end
        
        if(EM_flag == true)
            em_plot(Data1,  e_pli, mains_signal ,'RLS Error Plot of PLI ECG',1);
        end
    end
    
    if(BWN_flag == true)
        [e_bwn, bwn_filt] = RLS(BWN_data', bwn');        
        Plots(Data1, BWN_data,bwn_filt,e_bwn,'ECG Signal with Baseline Wander Noise',1);   
		
        if(SPEC_flag == true)            
            spect(BWN_data,bwn_filt, FS,'Spectrogram of ECG Signal with Baseline Wander Noise ',1);
        end
        
        if(PSD_flag == true)
            PSD(BWN_data, bwn_filt, FS,' Periodogram of Baseline Wander Noise ECG Signal',1);
        end
        
         if(SNR_flag == true)
            snr_plot(BWN_data, bwn_filt, ' Bar plot of SNR improvement in BWN ECG',1);
         end 
        
         if(PRD_flag == true)
            prd_plot(Data1,BWN_data, bwn_filt, ' Bar plot of PRD improvement in BWN ECG',1);
         end 
        
         if(EM_flag == true)
            em_plot(Data1,  e_bwn, bwn ,' RLS Error Plot of Baseline Wander Noise ECG',1);
        end
    end
    
    if(EMN_flag == true)
       [e_emn, emn_filt] = RLS(EMN_data', emn');        
       Plots(Data1, EMN_data,emn_filt,e_emn,'ECG Signal with Electrode Movement Noise',1);  
	   
        if(SPEC_flag == true)            
            spect(EMN_data,emn_filt, FS,'Spectrogram of ECG Signal with Electrode Movement Noise',1);
        end
        
        if(PSD_flag == true)
            PSD(EMN_data, emn_filt, FS,'  Periodogram of Electrode Movement Noise ECG Signal',1);
        end
        
        if(SNR_flag == true)
            snr_plot(EMN_data, emn_filt, ' Bar plot of SNR improvement in EMN ECG',1);
        end 
        
        if(PRD_flag == true)
            prd_plot(Data1,EMN_data, emn_filt, ' Bar plot of PRD improvement in EMN ECG',1);
        end 
        
        if(EM_flag == true)
            em_plot(Data1,  e_emn, emn ,' RLS Error Plot of Electrode Movement Noise ECG',1);
        end
    end
    
    if(MAN_flag == true)
        [e_man, man_filt] = RLS(MAN_data', man');        
        Plots(Data1, MAN_data,man_filt,e_man,'ECG Signal with Muscle Artifact Noise',1);
        
        if(SPEC_flag == true)            
            spect(MAN_data,man_filt, FS,'Spectrogram of ECG Signal with Muscle Artifact Noise',1);
        end
        
        if(PSD_flag == true)
            PSD(MAN_data, man_filt, FS,'  Periodogram of Muscle Artifact Noise ECG Signal',1);
        end

        if(SNR_flag == true)
            snr_plot(MAN_data, man_filt, ' Bar plot of SNR improvement in MAN ECG',1);
        end         
        
        if(PRD_flag == true)
            prd_plot(Data1, MAN_data, man_filt, ' Bar plot of PRD improvement in MAN ECG',1);
        end     
        
        if(EM_flag == true)
            em_plot(Data1,  e_man, man ,'RLS Error Plot of Muscle Artifact Noise ECG',1);
        end
    end
    
end

%% LMS ALGORITHM

if(LMS_flag == true)
    
    if(WN_flag == true)
        [ wn_filt_lms] = lms_filt(Data1', WN_data',0.001);        
        Plots(Data1, WN_data,wn_filt_lms,wn_filt_lms','ECG Signal with White Noise',0);  
		
        if(SPEC_flag == true)            
            spect(WN_data,wn_filt_lms,FS,'Spectrogram of ECG Signal with White Noise',0);
        end 
		
        if(PSD_flag == true)
            PSD(WN_data, wn_filt_lms,FS,' Periodogram of White Noise ECG Signal',0);
        end
        
        if(SNR_flag == true)
            snr_plot(WN_data, wn_filt_lms, ' Bar plot of SNR improvement in White Noise ECG',0);
        end
        
        if(PRD_flag == true)
            prd_plot(Data1, WN_data, wn_filt_lms, ' Bar plot of PRD improvement in White Noise ECG',0);
        end
        
        if(EM_flag == true)
            em_plot(Data1,  wn_filt_lms', wn ,' LMS Error Plot of White Noise ECG',0);
        end
        
    end
    
    if(PLI_flag == true)
        [pli_filt_lms] = lms_filt(Data1', PLI_data',0.0002);        
        Plots(Data1, PLI_data,pli_filt_lms,pli_filt_lms','ECG Signal with Power Line Interference Noise',0); 
		
        if(SPEC_flag == true)            
            spect(PLI_data,pli_filt_lms, FS,'Spectrogram of ECG Signal with PLI Noise',0);
        end     
		
        if(PSD_flag == true)
            PSD(PLI_data, pli_filt_lms, FS,' Periodogram of Power Line Interference Noise ECG Signal',0);
        end 
        
        if(SNR_flag == true)
            snr_plot(PLI_data, pli_filt_lms, ' Bar plot of SNR improvement in PLI ECG',0);
        end 
        
        if(PRD_flag == true)
            prd_plot(Data1,PLI_data, pli_filt_lms, ' Bar plot of PRD improvement in PLI ECG',0);
        end
        
        if(EM_flag == true)
            em_plot(Data1,  pli_filt_lms', mains_signal ,'LMS Error Plot of PLI ECG',0);
        end
    end
    
    if(BWN_flag == true)
        [ bwn_filt_lms] = lms_filt(Data1', BWN_data',0.001);        
        Plots(Data1, BWN_data,bwn_filt_lms,bwn_filt_lms','ECG Signal with Baseline Wander Noise',0);   
		
        if(SPEC_flag == true)            
            spect(BWN_data,bwn_filt_lms, FS,'Spectrogram of ECG Signal with Baseline Wander Noise ',0);
        end
        
        if(PSD_flag == true)
            PSD(BWN_data, bwn_filt_lms, FS,' Periodogram of Baseline Wander Noise ECG Signal',0);
        end
        
         if(SNR_flag == true)
            snr_plot(BWN_data, bwn_filt_lms, ' Bar plot of SNR improvement in BWN ECG',0);
         end 
        
         if(PRD_flag == true)
            prd_plot(Data1,BWN_data, bwn_filt_lms, ' Bar plot of PRD improvement in BWN ECG',0);
         end 
        
         if(EM_flag == true)
            em_plot(Data1,  bwn_filt_lms', bwn ,' LMS Error Plot of Baseline Wander Noise ECG',0);
        end
    end
    
    if(EMN_flag == true)
       [emn_filt_lms] = lms_filt(Data1', EMN_data',0.001);        
       Plots(Data1, EMN_data,emn_filt_lms,emn_filt_lms','ECG Signal with Electrode Movement Noise',0);  
	   
        if(SPEC_flag == true)            
            spect(EMN_data,emn_filt_lms, FS,'Spectrogram of ECG Signal with Electrode Movement Noise',0);
        end
        
        if(PSD_flag == true)
            PSD(EMN_data, emn_filt_lms, FS,'  Periodogram of Electrode Movement Noise ECG Signal',0);
        end
        
        if(SNR_flag == true)
            snr_plot(EMN_data, emn_filt_lms, ' Bar plot of SNR improvement in EMN ECG',0);
        end 
        
        if(PRD_flag == true)
            prd_plot(Data1,EMN_data, emn_filt_lms, ' Bar plot of PRD improvement in EMN ECG',0);
        end 
        
        if(EM_flag == true)
            em_plot(Data1, emn_filt_lms', emn ,' LMS Error Plot of Electrode Movement Noise ECG',0);
        end
    end
    
    if(MAN_flag == true)
        [man_filt_lms] = lms_filt(Data1', MAN_data',0.0002);        
        Plots(Data1, MAN_data,man_filt_lms,man_filt_lms','ECG Signal with Muscle Artifact Noise',0);
        
        if(SPEC_flag == true)            
            spect(MAN_data,man_filt_lms, FS,'Spectrogram of ECG Signal with Muscle Artifact Noise',0);
        end
        
        if(PSD_flag == true)
            PSD(MAN_data, man_filt_lms, FS,'  Periodogram of Muscle Artifact Noise ECG Signal',0);
        end

        if(SNR_flag == true)
            snr_plot(MAN_data, man_filt_lms, ' Bar plot of SNR improvement in MAN ECG',0);
        end         
        
        if(PRD_flag == true)
            prd_plot(Data1, MAN_data, man_filt_lms, ' Bar plot of PRD improvement in MAN ECG',0);
        end     
        
        if(EM_flag == true)
            em_plot(Data1,  man_filt_lms', man ,'LMS Error Plot of Muscle Artifact Noise ECG',0);
        end
    end
    
end


%% EKRLS ALGORITHM

if(EKRLS_flag == true)
    
    if(WN_flag == true)
        [e_wn, wn_filt_ekrls] = EKRLS(WN_data', wn');        
        Plots(Data1, WN_data,wn_filt_ekrls,e_wn,'ECG Signal with White Noise',2);  
		
        if(SPEC_flag == true)            
            spect(WN_data,wn_filt_ekrls,FS,'Spectrogram of ECG Signal with White Noise',2);
        end 
		
        if(PSD_flag == true)
            PSD(WN_data, wn_filt_ekrls,FS,' Periodogram of White Noise ECG Signal',2);
        end
        
        if(SNR_flag == true)
            snr_plot(WN_data, wn_filt_ekrls, ' Bar plot of SNR improvement in White Noise ECG',2);
        end
        
        if(PRD_flag == true)
            prd_plot(Data1, WN_data, wn_filt_ekrls, ' Bar plot of PRD improvement in White Noise ECG',2);
        end
        
        if(EM_flag == true)
            em_plot(Data1,  e_wn, wn ,' EKRLS Error Plot of White Noise ECG',2);
        end
        
    end
    
    if(PLI_flag == true)
        [e_pli, pli_filt_ekrls] = EKRLS(PLI_data', mains_signal');        
        Plots(Data1, PLI_data,pli_filt_ekrls,e_pli,'ECG Signal with Power Line Interference Noise',2); 
		
        if(SPEC_flag == true)            
            spect(PLI_data,pli_filt_ekrls, FS,'Spectrogram of ECG Signal with PLI Noise',2);
        end     
		
        if(PSD_flag == true)
            PSD(PLI_data, pli_filt_ekrls, FS,' Periodogram of Power Line Interference Noise ECG Signal',2);
        end 
        
        if(SNR_flag == true)
            snr_plot(PLI_data, pli_filt_ekrls, ' Bar plot of SNR improvement in PLI ECG',2);
        end 
        
        if(PRD_flag == true)
            prd_plot(Data1,PLI_data, pli_filt_ekrls, ' Bar plot of PRD improvement in PLI ECG',2);
        end
        
        if(EM_flag == true)
            em_plot(Data1,  e_pli, mains_signal ,'EKRLS Error Plot of PLI ECG',2);
        end
    end
    
    if(BWN_flag == true)
        [e_bwn, bwn_filt_ekrls] = EKRLS(BWN_data', bwn');        
        Plots(Data1, BWN_data,bwn_filt_ekrls,e_bwn,'ECG Signal with Baseline Wander Noise',2);   
		
        if(SPEC_flag == true)            
            spect(BWN_data,bwn_filt_ekrls, FS,'Spectrogram of ECG Signal with Baseline Wander Noise ',2);
        end
        
        if(PSD_flag == true)
            PSD(BWN_data, bwn_filt_ekrls, FS,' Periodogram of Baseline Wander Noise ECG Signal',2);
        end
        
         if(SNR_flag == true)
            snr_plot(BWN_data, bwn_filt_ekrls, ' Bar plot of SNR improvement in BWN ECG',2);
         end 
        
         if(PRD_flag == true)
            prd_plot(Data1,BWN_data, bwn_filt_ekrls, ' Bar plot of PRD improvement in BWN ECG',2);
         end 
        
         if(EM_flag == true)
            em_plot(Data1,  e_bwn, bwn ,' EKRLS Error Plot of Baseline Wander Noise ECG',2);
        end
    end
    
    if(EMN_flag == true)
       [e_emn, emn_filt_ekrls] = EKRLS(EMN_data', emn');        
       Plots(Data1, EMN_data,emn_filt_ekrls,e_emn,'ECG Signal with Electrode Movement Noise',2);  
	   
        if(SPEC_flag == true)            
            spect(EMN_data,emn_filt_ekrls, FS,'Spectrogram of ECG Signal with Electrode Movement Noise',2);
        end
        
        if(PSD_flag == true)
            PSD(EMN_data, emn_filt_ekrls, FS,'  Periodogram of Electrode Movement Noise ECG Signal',2);
        end
        
        if(SNR_flag == true)
            snr_plot(EMN_data, emn_filt_ekrls, ' Bar plot of SNR improvement in EMN ECG',2);
        end 
        
        if(PRD_flag == true)
            prd_plot(Data1,EMN_data, emn_filt_ekrls, ' Bar plot of PRD improvement in EMN ECG',2);
        end 
        
        if(EM_flag == true)
            em_plot(Data1,  e_emn, emn ,' EKRLS Error Plot of Electrode Movement Noise ECG',2);
        end
    end
    
    if(MAN_flag == true)
        [e_man, man_filt_ekrls] = EKRLS(MAN_data', man');        
        Plots(Data1, MAN_data,man_filt_ekrls,e_man,'ECG Signal with Muscle Artifact Noise',2);
        
        if(SPEC_flag == true)            
            spect(MAN_data,man_filt_ekrls, FS,'Spectrogram of ECG Signal with Muscle Artifact Noise',2);
        end
        
        if(PSD_flag == true)
            PSD(MAN_data, man_filt_ekrls, FS,'  Periodogram of Muscle Artifact Noise ECG Signal',2);
        end

        if(SNR_flag == true)
            snr_plot(MAN_data, man_filt_ekrls, ' Bar plot of SNR improvement in MAN ECG',2);
        end         
        
        if(PRD_flag == true)
            prd_plot(Data1, MAN_data, man_filt_ekrls, ' Bar plot of PRD improvement in MAN ECG',2);
        end     
        
        if(EM_flag == true)
            em_plot(Data1,  e_man, man ,'EKRLS Error Plot of Muscle Artifact Noise ECG',2);
        end
    end
    
end