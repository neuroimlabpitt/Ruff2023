%Whisker (cap vessels <9 um in diameter) 
WhiskerCap_GCaMPexp=[];
allnames={
'Tser4887_cfr_v2.mat' 
'Tser4776_cfr_v2.mat'
'Tser5798_cfr_V2.mat'
'Tser5800_cfr_V2.mat'
'Tser5880_cfr_V2.mat'
'Tser5943_cfr_V2.mat'
'Tser5203_cfr_V2.mat'
};
groupname='WhiskerCap_GCaMPexp';

all_WhiskerPerCap=[];
all_WhiskerPerPericyte=[];

for ii = 1:length(allnames)
    
    load(allnames{ii})
    
    all_WhiskerPerCap=[all_WhiskerPerCap total_rr1aPercentCap]; 
    all_WhiskerPerPericyte=[all_WhiskerPerPericyte total_yproj2maxPercentPericyte];
end

% save(groupname,'allnames','all_WhiskerPerCap', 'all_WhiskerPerPericyte','tt');

%% MEAN

all_WhiskerPerCap_Mean=(mean(all_WhiskerPerCap,2));
all_WhiskerPerPericyte_Mean=(mean(all_WhiskerPerPericyte,2));


%% SEM

all_WhiskerPerCap_SEM=(std(all_WhiskerPerCap,[],2)./(sqrt(size(all_WhiskerPerCap,2))));
all_WhiskerPerPericyte_SEM=(std(all_WhiskerPerPericyte,[],2)./(sqrt(size(all_WhiskerPerPericyte,2))));

%%
save(groupname,'allnames','all_WhiskerPerCap', 'all_WhiskerPerPericyte','all_WhiskerPerCap_Mean',...
'all_WhiskerPerPericyte_Mean','all_WhiskerPerCap_SEM','all_WhiskerPerPericyte_SEM','tt');


%% combined traces
figure, plotmsd4(tt, [mysmooth(all_WhiskerPerCap_Mean) mysmooth(all_WhiskerPerPericyte_Mean)], ...
                       [mysmooth(all_WhiskerPerCap_SEM) mysmooth(all_WhiskerPerPericyte_SEM)])

figure, plotmsd4(tt, [smooth(all_WhiskerPerCap_Mean) smooth(all_WhiskerPerPericyte_Mean)], ...
                       [smooth(all_WhiskerPerCap_SEM) smooth(all_WhiskerPerPericyte_SEM)])