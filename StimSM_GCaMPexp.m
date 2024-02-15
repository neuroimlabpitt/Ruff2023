%% Photostim pericyte relaxation across animals
StimVSMC_GCaMPexpV2=[];
allnames={	
'Tser4798_cfr_V2.mat'
'Tser4777_cfr_V2.mat'
'Tser5078_cfr_V2.mat'
'Tser5213_cfr_V2.mat'
};
groupname='StimVSMC_GCaMPexpV2';

all_yproj2max_percentSM=[];


for ii = 1:length(allnames)
    
    load(allnames{ii})
    
    all_yproj2max_percentSM=[all_yproj2max_percentSM yproj2max_percent_FinalSM]; 
   
end


%% MEAN

all_yproj2max_percentSM_Mean=(mean(all_yproj2max_percentSM,2));


%% SEM

all_yproj2max_percentSM_SEM=(std( all_yproj2max_percentSM,[],2)./(sqrt(size( all_yproj2max_percentSM,2))));


save(groupname,'allnames', 'all_yproj2max_percentSM','all_yproj2max_percentSM_Mean', 'all_yproj2max_percentSM_SEM','tt');

%% Trace Graph

figure, plotmsd4(tt, all_yproj2max_percentSM_Mean, all_yproj2max_percentSM_SEM)

figure, plotmsd4(tt, [all_yproj2max_percentSM_Mean all_rr1a_percentArt_Mean],...
                    [all_yproj2max_percentSM_SEM all_rr1a_percentArt_SEM])

figure, plotmsd4(tt, [(all_yproj2max_percentSM_Mean*-1) all_rr1a_percentArt_Mean],...
                    [(all_yproj2max_percentSM_SEM*-1) all_rr1a_percentArt_SEM])

figure, plotmsd4(tt, [(all_yproj2max_percentPericyte_Mean*-1) all_rr1a_percentCap_Mean],...
                    [(all_yproj2max_percentPericyte_SEM*-1) all_rr1a_percentCap_SEM])

                
figure, plotmsd4(tt, [all_yproj2max_percentSM_Mean all_yproj2max_percentPericyte_Mean all_rr1a_percentArt_Mean all_rr1a_percentCap_Mean],...
                    [all_yproj2max_percentSM_SEM all_yproj2max_percentPericyte_SEM all_rr1a_percentArt_SEM all_rr1a_percentCap_SEM])

figure, plotmsd4(tt, [mysmooth(all_yproj2max_percentSM_Mean) mysmooth(all_yproj2max_percentPericyte_Mean) mysmooth(all_rr1a_percentArt_Mean) mysmooth(all_rr1a_percentCap_Mean)],...
                    [mysmooth(all_yproj2max_percentSM_SEM) mysmooth(all_yproj2max_percentPericyte_SEM) mysmooth(all_rr1a_percentArt_SEM) mysmooth(all_rr1a_percentCap_SEM)])
%%
figure, plotmsd4(tt, [mysmooth(all_yproj2max_percentSM_Mean) mysmooth(all_yproj2max_percentPericyte_Mean)],...
                    [mysmooth(all_yproj2max_percentSM_SEM) mysmooth(all_yproj2max_percentPericyte_SEM)]);
%combined traces
figure, plotmsd4(tt, [mysmooth(all_yproj2max_percentSM_Mean) mysmooth(all_yproj2max_percentPericyte_Mean)],...
                    [mysmooth(all_yproj2max_percentSM_SEM) mysmooth(all_yproj2max_percentPericyte_SEM)]);


figure, plotmsd4(tt, [mysmooth(mean_rr1a_percent(:,1)) mysmooth(mean_rr1a_percentC(:,1)) mysmooth(mean_rr1a_percentW(:,1))], ...
                       [mysmooth(mean_rr1aSEM_percent(:,1)) mysmooth(mean_rr1aSEM_percentC(:,1)) mysmooth(mean_rr1aSEM_percentW(:,1))])