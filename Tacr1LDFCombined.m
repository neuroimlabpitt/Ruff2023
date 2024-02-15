Tacr1ChR2AllLDF=[];
allnames={	
'MOUSE_NOSK1_20170314_cfr_v1'
'MOUSE_NOSK3_20170327_cfr_v1'
'MOUSE_NRK1CHR2A_20171129_cfr_v1'
'20181017_MOUSE_NK1RGsetup2_cfr_v1'
'20190605_MOUSE_1224_NG2_cfr_v1'
};
groupname='Tacr1ChR2AllLDF';

allmean_dyn1l1p0aS=[];
allmean_dyn1l1p0bS=[];
allmean_dyn1l1p0cS=[];

allmean_dyn2l1p0bS=[];
allmean_dyn4l1p0bS=[];
allmean_dyn8l1p0bS=[];

for ii = 1:length(allnames)
    
    load(allnames{ii})
    
    allmean_dyn1l1p0aS=[allmean_dyn1l1p0aS mean_dyn1l1p0aS];
    allmean_dyn1l1p0bS=[allmean_dyn1l1p0bS mean_dyn1l1p0bS];
    allmean_dyn1l1p0cS=[allmean_dyn1l1p0cS mean_dyn1l1p0cS];
    
    allmean_dyn2l1p0bS=[allmean_dyn2l1p0bS mean_dyn2l1p0bS];
    allmean_dyn4l1p0bS=[allmean_dyn4l1p0bS mean_dyn4l1p0bS];
    allmean_dyn8l1p0bS=[allmean_dyn8l1p0bS mean_dyn8l1p0bS];
end

save(groupname,'allmean_dyn1l1p0aS','allmean_dyn1l1p0bS','allmean_dyn1l1p0cS','allmean_dyn2l1p0bS','allmean_dyn4l1p0bS','allmean_dyn8l1p0bS','tt')

%%
Peak amp range

%Pre
tmpiii=find((tt>=(-4))&(tt<(-2)));
dyn1l1p0aS_peakPre=(allmean_dyn1l1p0aS(tmpiii,:)); %values of each animal in given time frame (not collapsed)
dyn1l1p0bS_peakPre=(allmean_dyn1l1p0bS(tmpiii,:)); 
dyn1l1p0cS_peakPre=(allmean_dyn1l1p0cS(tmpiii,:));

dyn2l1p0bS_peakPre=(allmean_dyn2l1p0bS(tmpiii,:)); 
dyn4l1p0bS_peakPre=(allmean_dyn4l1p0bS(tmpiii,:)); 
dyn8l1p0bS_peakPre=(allmean_dyn8l1p0bS(tmpiii,:)); 


% dyn1l1p0aS_peakPercent=(dyn1l1p0aS_peakPre-1)*100; %converted to percent
% dyn1l1p0bS_peakPercent=(dyn1l1p0bS_peakPre-1)*100;  
% dyn1l1p0cS_peakPercent=(dyn1l1p0cS_peakPre-1)*100;  
% 
% dyn2l1p0bS_peakPercent=(dyn2l1p0bS_peakPre-1)*100;
% dyn4l1p0bS_peakPercent=(dyn4l1p0bS_peakPre-1)*100;
% dyn8l1p0bS_peakPercent=(dyn8l1p0bS_peakPre-1)*100;


dyn1l1p0aS_Mean=mean(dyn1l1p0aS_peakPre,1);  %mean of percent of each animal
dyn1l1p0bS_Mean=mean(dyn1l1p0bS_peakPre,1); 
dyn1l1p0cS_Mean=mean(dyn1l1p0cS_peakPre,1);

dyn2l1p0bS_Mean=mean(dyn2l1p0bS_peakPre,1); 
dyn4l1p0bS_Mean=mean(dyn4l1p0bS_peakPre,1); 
dyn8l1p0bS_Mean=mean(dyn8l1p0bS_peakPre,1); 


dyn1l1p0aS_SEM=(std(dyn1l1p0aS_Mean)./(sqrt(size(dyn1l1p0aS_Mean,2))));  %SEM
dyn1l1p0bS_SEM=(std(dyn1l1p0bS_Mean)./(sqrt(size(dyn1l1p0bS_Mean,2))));
dyn1l1p0cS_SEM=(std(dyn1l1p0cS_Mean)./(sqrt(size(dyn1l1p0cS_Mean,2))));

dyn2l1p0bS_SEM=(std(dyn2l1p0bS_Mean)./(sqrt(size(dyn2l1p0bS_Mean,2))));
dyn4l1p0bS_SEM=(std(dyn4l1p0bS_Mean)./(sqrt(size(dyn4l1p0bS_Mean,2))));
dyn8l1p0bS_SEM=(std(dyn8l1p0bS_Mean)./(sqrt(size(dyn8l1p0bS_Mean,2))));

bar([nanmean(dyn1l1p0aS_Mean) nanmean(dyn1l1p0bS_Mean) nanmean(dyn1l1p0cS_Mean)]) %dose dependent ex
hold on
errorbar([nanmean(dyn1l1p0aS_Mean) nanmean(dyn1l1p0bS_Mean) nanmean(dyn1l1p0cS_Mean)], [dyn1l1p0aS_SEM dyn1l1p0bS_SEM dyn1l1p0cS_SEM], 'k.')

scatter(ones(1,length(dyn1l1p0aS_Mean)),dyn1l1p0aS_Mean,'o')
scatter(ones(1,length(dyn1l1p0bS_Mean)).*2,dyn1l1p0bS_Mean,'o')
scatter(ones(1,length(dyn1l1p0cS_Mean)).*3,dyn1l1p0cS_Mean,'o')


bar([nanmean(dyn2l1p0bS_Mean) nanmean(dyn4l1p0bS_Mean) nanmean(dyn8l1p0bS_Mean)]) %dose-dependent ex
hold on
errorbar([nanmean(dyn2l1p0bS_Mean) nanmean(dyn4l1p0bS_Mean) nanmean(dyn8l1p0bS_Mean)], [dyn2l1p0bS_SEM dyn4l1p0bS_SEM dyn8l1p0bS_SEM], 'k.')

scatter(ones(1,length(dyn2l1p0bS_Mean)),dyn2l1p0bS_Mean,'o')
scatter(ones(1,length(dyn4l1p0bS_Mean)).*2,dyn4l1p0bS_Mean,'o')
scatter(ones(1,length(dyn8l1p0bS_Mean)).*3,dyn8l1p0bS_Mean,'o')

groupname='ControlMiceLDF_Pre'
save(groupname,'dyn1l1p0aS_Mean','dyn1l1p0bS_Mean', 'dyn1l1p0cS_Mean', 'dyn2l1p0bS_Mean','dyn4l1p0bS_Mean',...
'dyn8l1p0bS_Mean','dyn1l1p0aS_SEM','dyn1l1p0bS_SEM', 'dyn1l1p0cS_SEM', 'dyn2l1p0bS_SEM', 'dyn4l1p0bS_SEM', 'dyn8l1p0bS_SEM', 'tt')

%Post 1_4
%added P to make it POST
tmpii=find((tt>=2)&(tt<4));
dyn1l1p0aS_peakPreP=(allmean_dyn1l1p0aS(tmpii,:)); %values of each animal in given time frame (not collapsed)
dyn1l1p0bS_peakPreP=(allmean_dyn1l1p0bS(tmpii,:)); 
dyn1l1p0cS_peakPreP=(allmean_dyn1l1p0cS(tmpii,:));

dyn2l1p0bS_peakPreP=(allmean_dyn2l1p0bS(tmpii,:)); 
dyn4l1p0bS_peakPreP=(allmean_dyn4l1p0bS(tmpii,:)); 
dyn8l1p0bS_peakPreP=(allmean_dyn8l1p0bS(tmpii,:)); 


dyn1l1p0aS_MeanP=mean(dyn1l1p0aS_peakPreP,1);  %mean of percent of each animal
dyn1l1p0bS_MeanP=mean(dyn1l1p0bS_peakPreP,1); 
dyn1l1p0cS_MeanP=mean(dyn1l1p0cS_peakPreP,1);

dyn2l1p0bS_MeanP=mean(dyn2l1p0bS_peakPreP,1); 
dyn4l1p0bS_MeanP=mean(dyn4l1p0bS_peakPreP,1); 
dyn8l1p0bS_MeanP=mean(dyn8l1p0bS_peakPreP,1); 


dyn1l1p0aS_SEMP=(std(dyn1l1p0aS_MeanP)./(sqrt(size(dyn1l1p0aS_MeanP,2))));  %SEM
dyn1l1p0bS_SEMP=(std(dyn1l1p0bS_MeanP)./(sqrt(size(dyn1l1p0bS_MeanP,2))));
dyn1l1p0cS_SEMP=(std(dyn1l1p0cS_MeanP)./(sqrt(size(dyn1l1p0cS_MeanP,2))));

dyn2l1p0bS_SEMP=(std(dyn2l1p0bS_MeanP)./(sqrt(size(dyn2l1p0bS_MeanP,2))));
dyn4l1p0bS_SEMP=(std(dyn4l1p0bS_MeanP)./(sqrt(size(dyn4l1p0bS_MeanP,2))));
dyn8l1p0bS_SEMP=(std(dyn8l1p0bS_MeanP)./(sqrt(size(dyn8l1p0bS_MeanP,2))));

bar([nanmean(dyn1l1p0aS_MeanP) nanmean(dyn1l1p0bS_MeanP) nanmean(dyn1l1p0cS_MeanP)]) %dose dependent ex
hold on
errorbar([nanmean(dyn1l1p0aS_MeanP) nanmean(dyn1l1p0bS_MeanP) nanmean(dyn1l1p0cS_MeanP)], [dyn1l1p0aS_SEMP dyn1l1p0bS_SEMP dyn1l1p0cS_SEMP], 'k.')

scatter(ones(1,length(dyn1l1p0aS_MeanP)),dyn1l1p0aS_MeanP,'o')
scatter(ones(1,length(dyn1l1p0bS_MeanP)).*2,dyn1l1p0bS_MeanP,'o')
scatter(ones(1,length(dyn1l1p0cS_MeanP)).*3,dyn1l1p0cS_MeanP,'o')


bar([nanmean(dyn2l1p0bS_MeanP) nanmean(dyn4l1p0bS_MeanP) nanmean(dyn8l1p0bS_MeanP)]) %dose-dependent ex
hold on
errorbar([nanmean(dyn2l1p0bS_MeanP) nanmean(dyn4l1p0bS_MeanP) nanmean(dyn8l1p0bS_MeanP)], [dyn2l1p0bS_SEMP dyn4l1p0bS_SEMP dyn8l1p0bS_SEMP], 'k.')

scatter(ones(1,length(dyn2l1p0bS_MeanP)),dyn2l1p0bS_MeanP,'o')
scatter(ones(1,length(dyn4l1p0bS_MeanP)).*2,dyn4l1p0bS_MeanP,'o')
scatter(ones(1,length(dyn8l1p0bS_MeanP)).*3,dyn8l1p0bS_MeanP,'o')

groupname='ControlMiceLDF_Post'
save(groupname,'dyn1l1p0aS_MeanP','dyn1l1p0bS_MeanP', 'dyn1l1p0cS_MeanP', 'dyn2l1p0bS_MeanP','dyn4l1p0bS_MeanP',...
'dyn8l1p0bS_MeanP','dyn1l1p0aS_SEMP','dyn1l1p0bS_SEMP', 'dyn1l1p0cS_SEMP', 'dyn2l1p0bS_SEMP', 'dyn4l1p0bS_SEMP', 'dyn8l1p0bS_SEMP', 'tt')

