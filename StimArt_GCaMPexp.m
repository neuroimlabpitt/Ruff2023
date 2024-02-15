%% Photostim arteriole vasodilation across animals
%5hz 5 ms (vessels >9 um in diameter) 
StimVessel_GCaMPexpV2=[];
allnames={	
'Tser4798_cfr_V2.mat'
'Tser4772_cfr_v2.mat'
'Tser4777_cfr_V2.mat'
'Tser5078_cfr_V2.mat'
'Tser5213_cfr_V2.mat'
'Tser5075_cfr_V2.mat'
};
groupname='StimVessel_GCaMPexpV2';

all_rr1a_percentArt=[];
all_rr1a_micronsArt=[];


for ii = 1:length(allnames)
    
    load(allnames{ii})
    
    all_rr1a_percentArt=[all_rr1a_percentArt rr1a_percent_FinalArt]; 
    all_rr1a_micronsArt=[all_rr1a_micronsArt rr1a_microns_FinalArt];
   
end

%% MEAN

all_rr1a_percentArt_Mean=(mean(all_rr1a_percentArt,2));
all_rr1a_micronsArt_Mean=(mean(all_rr1a_micronsArt,2));

%% SEM

all_rr1a_percentArt_SEM=(std(all_rr1a_percentArt,[],2)./(sqrt(size(all_rr1a_percentArt,2))));
all_rr1a_micronsArt_SEM=(std(all_rr1a_micronsArt,[],2)./(sqrt(size(all_rr1a_micronsArt,2))));


save(groupname,'allnames','all_rr1a_percentArt', 'all_rr1a_micronsArt','all_rr1a_percentArt_Mean', 'all_rr1a_percentArt_SEM','all_rr1a_micronsArt_Mean',...
    'all_rr1a_micronsArt_SEM','tt');

%% Trace Graph

figure, plotmsd4(tt, all_rr1a_percentArt_Mean, all_rr1a_percentArt_SEM)
figure, plotmsd4(tt, all_rr1a_micronsArt_Mean, all_rr1a_micronsArt_SEM)


figure, plotmsd4(tt, [all_rr1a_percentCap_Mean all_rr1a_percentArt_Mean],...
                    [all_rr1a_percentCap_SEM all_rr1a_percentArt_SEM]);
                
figure, plotmsd4(tt, [mysmooth(all_rr1a_percentCap_Mean) mysmooth(all_rr1a_percentArt_Mean)],...
                    [mysmooth(all_rr1a_percentCap_SEM) mysmooth(all_rr1a_percentArt_SEM)]);


%combined traces
% %figure, plotmsd4(tt, [mysmooth(mean_rr1a_percent(:,1)) mysmooth(mean_rr1a_percentC(:,1)) mysmooth(mean_rr1a_percentW(:,1))], ...
%                        [mysmooth(mean_rr1aSEM_percent(:,1)) mysmooth(mean_rr1aSEM_percentC(:,1)) mysmooth(mean_rr1aSEM_percentW(:,1))]