%modified 08.03.2020; 08.06.2020
Tacr1ChR2AllLDF=[];
allnames={	
'MOUSE_NOSK1_20170314_cfr_v1'
'MOUSE_NOSK3_20170327_cfr_v1'
'MOUSE_NRK1CHR2A_20171129_cfr_v1'
'20181017_MOUSE_NK1RGsetup2_cfr_v1'
'20190605_MOUSE_1224_NG2_cfr_v1'
};
groupname='Tacr1ChR2AllLDFv2';

all_dyn1l1p0aS=[];
all_dyn1l1p0bS=[];
all_dyn1l1p0cS=[];
all_dyn2l1p0bS=[];
all_dyn4l1p0bS=[];
all_dyn8l1p0bS=[];

all_dyn1l1p0aS_Pre=[];
all_dyn1l1p0bS_Pre=[];
all_dyn1l1p0cS_Pre=[];
all_dyn2l1p0bS_Pre=[];
all_dyn4l1p0bS_Pre=[];
all_dyn8l1p0bS_Pre=[];
    
all_dyn1l1p0aS_Post=[];
all_dyn1l1p0bS_Post=[];
all_dyn1l1p0cS_Post=[];
all_dyn2l1p0bS_Post=[];
all_dyn4l1p0bS_Post=[];
all_dyn8l1p0bS_Post=[];

%mean_X_Pre is the mean CBF of 10 trials from each animal over 2 sec prior
%to light stim

for ii = 1:length(allnames)
    
    load(allnames{ii})
    
    all_dyn1l1p0aS=[all_dyn1l1p0aS mean_dyn1l1p0aS]; 
    all_dyn1l1p0bS=[all_dyn1l1p0bS mean_dyn1l1p0bS];
    all_dyn1l1p0cS=[all_dyn1l1p0cS mean_dyn1l1p0cS];
    all_dyn2l1p0bS=[all_dyn2l1p0bS mean_dyn2l1p0bS];
    all_dyn4l1p0bS=[all_dyn4l1p0bS mean_dyn4l1p0bS];
    all_dyn8l1p0bS=[all_dyn8l1p0bS mean_dyn8l1p0bS]
    
    all_dyn1l1p0aS_Pre=[all_dyn1l1p0aS_Pre mean_dyn1l1p0aS_Pre]; 
    all_dyn1l1p0bS_Pre=[all_dyn1l1p0bS_Pre mean_dyn1l1p0bS_Pre];
    all_dyn1l1p0cS_Pre=[all_dyn1l1p0cS_Pre mean_dyn1l1p0cS_Pre];
    all_dyn2l1p0bS_Pre=[all_dyn2l1p0bS_Pre mean_dyn2l1p0bS_Pre];
    all_dyn4l1p0bS_Pre=[all_dyn4l1p0bS_Pre mean_dyn4l1p0bS_Pre];
    all_dyn8l1p0bS_Pre=[all_dyn8l1p0bS_Pre mean_dyn8l1p0bS_Pre];
    
    all_dyn1l1p0aS_Post=[all_dyn1l1p0aS_Post mean_dyn1l1p0aS_Post]; 
    all_dyn1l1p0bS_Post=[all_dyn1l1p0bS_Post mean_dyn1l1p0bS_Post];
    all_dyn1l1p0cS_Post=[all_dyn1l1p0cS_Post mean_dyn1l1p0cS_Post];
    all_dyn2l1p0bS_Post=[all_dyn2l1p0bS_Post mean_dyn2l1p0bS_Post];
    all_dyn4l1p0bS_Post=[all_dyn4l1p0bS_Post mean_dyn4l1p0bS_Post];
    all_dyn8l1p0bS_Post=[all_dyn8l1p0bS_Post mean_dyn8l1p0bS_Post];
end

save(groupname,'all_dyn1l1p0aS','all_dyn1l1p0bS','all_dyn1l1p0cS','all_dyn2l1p0bS','all_dyn4l1p0bS','all_dyn8l1p0bS',...
'all_dyn1l1p0aS_Pre','all_dyn1l1p0bS_Pre','all_dyn1l1p0cS_Pre','all_dyn2l1p0bS_Pre','all_dyn4l1p0bS_Pre','all_dyn8l1p0bS_Pre',...
'all_dyn1l1p0aS_Post','all_dyn1l1p0bS_Post','all_dyn1l1p0cS_Post','all_dyn2l1p0bS_Post','all_dyn4l1p0bS_Post','all_dyn8l1p0bS_Post','tt')


%% CBF Trace Across Time
MEAN_dyn1l1p0aS=mean(all_dyn1l1p0aS,2); %mean across all animals PRE
MEAN_dyn1l1p0bS=mean(all_dyn1l1p0bS,2);  
MEAN_dyn1l1p0cS=mean(all_dyn1l1p0cS,2); 
MEAN_dyn2l1p0bS=mean(all_dyn2l1p0bS,2); 
MEAN_dyn4l1p0bS=mean(all_dyn4l1p0bS,2); 
MEAN_dyn8l1p0bS=mean(all_dyn8l1p0bS,2); 

%SEM
dyn1l1p0aS_SEM=(std(all_dyn1l1p0aS,[],2)./(sqrt(size(all_dyn1l1p0aS,2))));
dyn1l1p0bS_SEM=(std(all_dyn1l1p0bS,[],2)./(sqrt(size(all_dyn1l1p0bS,2))));
dyn1l1p0cS_SEM=(std(all_dyn1l1p0cS,[],2)./(sqrt(size(all_dyn1l1p0cS,2))));

dyn2l1p0bS_SEM=(std(all_dyn2l1p0bS,[],2)./(sqrt(size(all_dyn2l1p0bS,2))));
dyn4l1p0bS_SEM=(std(all_dyn4l1p0bS,[],2)./(sqrt(size(all_dyn4l1p0bS,2))));
dyn8l1p0bS_SEM=(std(all_dyn8l1p0bS,[],2)./(sqrt(size(all_dyn8l1p0bS,2))));

%5hz
plotmsd4(tt, [MEAN_dyn1l1p0aS MEAN_dyn1l1p0bS MEAN_dyn1l1p0cS], ...
                       [dyn1l1p0aS_SEM dyn1l1p0bS_SEM dyn1l1p0cS_SEM])
 %10, 20, 40Hz                  
plotmsd4(tt, [MEAN_dyn2l1p0bS MEAN_dyn4l1p0bS MEAN_dyn8l1p0bS], ...
                       [dyn2l1p0bS_SEM dyn4l1p0bS_SEM dyn8l1p0bS_SEM])
                   
                   
%Trace excluding stim
                   
excludeStart=-0.3;
excludeEnd=1.5;
 
plotmsd4Exclude(tt, [MEAN_dyn1l1p0aS  MEAN_dyn1l1p0bS MEAN_dyn1l1p0cS], ...
                       [dyn1l1p0aS_SEM dyn1l1p0bS_SEM dyn1l1p0cS_SEM],find(tt>excludeStart&tt<excludeEnd));
%Trace smoothed                   
MEAN_dyn1l1p0aS_sm=smooth(MEAN_dyn1l1p0aS(:,1),75); 
MEAN_dyn1l1p0bS_sm=smooth(MEAN_dyn1l1p0bS(:,1),75);
MEAN_dyn1l1p0cS_sm=smooth(MEAN_dyn1l1p0cS(:,1),75);  
MEAN_dyn2l1p0bS_sm=smooth(MEAN_dyn2l1p0bS(:,1),75); 
MEAN_dyn4l1p0bS_sm=smooth(MEAN_dyn4l1p0bS(:,1),75);
MEAN_dyn8l1p0bS_sm=smooth(MEAN_dyn8l1p0bS(:,1),75);

dyn1l1p0aS_SEMsm=smooth(dyn1l1p0aS_SEM(:,1),75); 
dyn1l1p0bS_SEMsm=smooth(dyn1l1p0bS_SEM(:,1),75); 
dyn1l1p0cS_SEMsm=smooth(dyn1l1p0cS_SEM(:,1),75); 

dyn2l1p0bS_SEMsm=smooth(dyn2l1p0bS_SEM(:,1),75); 
dyn4l1p0bS_SEMsm=smooth(dyn4l1p0bS_SEM(:,1),75);  
dyn8l1p0bS_SEMsm=smooth(dyn8l1p0bS_SEM(:,1),75);

excludeStart=-0.3;
excludeEnd=1.5;

%5HzAll.fig
plotmsd4Exclude(tt, [MEAN_dyn1l1p0aS_sm  MEAN_dyn1l1p0bS_sm MEAN_dyn1l1p0cS_sm], ...
                       [dyn1l1p0aS_SEMsm dyn1l1p0bS_SEMsm dyn1l1p0cS_SEMsm],find(tt>excludeStart&tt<excludeEnd));

%needed to extend these parameters beyond 0-1 to remove the lag of the light artifact 
excludeStart=-0.3;
excludeEnd=1.35;     

plotmsd4Exclude(tt, MEAN_dyn1l1p0aS_sm, dyn1l1p0aS_SEMsm,find(tt>excludeStart&tt<excludeEnd));

%best (greatest CBF effect)
plotmsd4(tt, MEAN_dyn1l1p0aS_sm, dyn1l1p0aS_SEMsm);

%% (w/) Control
%control values calculated in ControlAll.scrm


excIDX=find(tt>excludeStart&tt<excludeEnd); %get IDX to exclude


MEAN_dyn1l1p0aS_sm_Exc=MEAN_dyn1l1p0aS_sm;
MEAN_dyn1l1p0aS_sm_Exc(excIDX)=nan;
    
dyn1l1p0aS_SEMsm_Exc = dyn1l1p0aS_SEMsm;
dyn1l1p0aS_SEMsm_Exc(excIDX)=nan;

mean_tmpdata1aS_sm_Exc=mean_tmpdata1aS_sm;
mean_tmpdata1aS_sm_Exc(excIDX)=nan;

tmpdata1aS_SEMsm_Exc=tmpdata1aS_SEMsm;
tmpdata1aS_SEMsm_Exc(excIDX)=nan;


%with control (smoothed) 
plotmsd4Exclude(tt, [MEAN_dyn1l1p0aS_sm mean_tmpdata1aS_sm], [dyn1l1p0aS_SEMsm tmpdata1aS_SEMsm],find(tt>excludeStart&tt<excludeEnd));

ExcludeMEAN_dyn1l1p0aS_sm=(MEAN_dyn1l1p0aS_sm,(find(tt>excludeStart&tt<excludeEnd));

plotmsd4Exclude(tt, mean_tmpdata1aS_sm, tmpdata1aS_SEMsm,find(tt>excludeStart&tt<excludeEnd));

plotmsd4Exclude(tt, [MEAN_dyn1l1p0aS_sm mean_tmpdata1cS_sm], [dyn1l1p0aS_SEMsm tmpdata1cS_SEMsm],find(tt>excludeStart&tt<excludeEnd));
    
%10_40HzAll.fig                   
plotmsd4Exclude(tt, [MEAN_dyn2l1p0bS_sm  MEAN_dyn4l1p0bS_sm MEAN_dyn8l1p0bS_sm], ...
                       [dyn2l1p0bS_SEMsm dyn4l1p0bS_SEMsm dyn8l1p0bS_SEMsm],find(tt>excludeStart&tt<excludeEnd));
                   
plotmsd4Exclude(tt, MEAN_dyn4l1p0bS_sm, dyn4l1p0bS_SEMsm,find(tt>excludeStart&tt<excludeEnd));
figure, plotmsd4Exclude(tt, MEAN_dyn2l1p0bS_sm, dyn2l1p0bS_SEMsm,find(tt>excludeStart&tt<excludeEnd));

%greatest CBF effect with same control
plotmsd4Exclude(tt, [MEAN_dyn4l1p0bS_sm mean_tmpdata4bS_sm], ...
                       [dyn4l1p0bS_SEMsm tmpdata4bS_SEMsm],find(tt>excludeStart&tt<excludeEnd));

%greatest CBF effect with lowest(but at greatest) control 
plotmsd4Exclude(tt, [MEAN_dyn4l1p0bS_sm mean_tmpdata8bS_sm], ...
                       [dyn4l1p0bS_SEMsm tmpdata8bS_SEMsm],find(tt>excludeStart&tt<excludeEnd));


%% For Bar graphs
MEAN_dyn1l1p0aS_Pre=mean(all_dyn1l1p0aS_Pre,2); %mean across all animals PRE
MEAN_dyn1l1p0bS_Pre=mean(all_dyn1l1p0bS_Pre,2);  
MEAN_dyn1l1p0cS_Pre=mean(all_dyn1l1p0cS_Pre,2); 
MEAN_dyn2l1p0bS_Pre=mean(all_dyn2l1p0bS_Pre,2); 
MEAN_dyn4l1p0bS_Pre=mean(all_dyn4l1p0bS_Pre,2); 
MEAN_dyn8l1p0bS_Pre=mean(all_dyn8l1p0bS_Pre,2); 

MEAN_dyn1l1p0aS_Post=mean(all_dyn1l1p0aS_Post,2); %mean across al animals POST
MEAN_dyn1l1p0bS_Post=mean(all_dyn1l1p0bS_Post,2);  
MEAN_dyn1l1p0cS_Post=mean(all_dyn1l1p0cS_Post,2); 
MEAN_dyn2l1p0bS_Post=mean(all_dyn2l1p0bS_Post,2); 
MEAN_dyn4l1p0bS_Post=mean(all_dyn4l1p0bS_Post,2); 
MEAN_dyn8l1p0bS_Post=mean(all_dyn8l1p0bS_Post,2); 


% tmpdata1aS_Mean=mean(tmpdata1aS_peakPercent,1);  %mean of percent of each
% animals used for controls
% tmpdata1bS_Mean=mean(tmpdata1bS_peakPercent,1); 
% tmpdata1cS_Mean=mean(tmpdata1cS_peakPercent,1);
% 
% tmpdata2bS_Mean=mean(tmpdata2bS_peakPercent,1); 
% tmpdata4bS_Mean=mean(tmpdata4bS_peakPercent,1); 
% tmpdata8bS_Mean=mean(tmpdata8bS_peakPercent,1); 

dyn1l1p0aS_PreSEM=(std(all_dyn1l1p0aS_Pre)./sqrt(size(all_dyn1l1p0aS_Pre,2)));
dyn1l1p0bS_PreSEM=(std(all_dyn1l1p0bS_Pre)./sqrt(size(all_dyn1l1p0bS_Pre,2)));
dyn1l1p0cS_PreSEM=(std(all_dyn1l1p0cS_Pre)./sqrt(size(all_dyn1l1p0cS_Pre,2)));
dyn2l1p0bS_PreSEM=(std(all_dyn2l1p0bS_Pre)./sqrt(size(all_dyn2l1p0bS_Pre,2)));
dyn4l1p0bS_PreSEM=(std(all_dyn4l1p0bS_Pre)./sqrt(size(all_dyn4l1p0bS_Pre,2)));
dyn8l1p0bS_PreSEM=(std(all_dyn8l1p0bS_Pre)./sqrt(size(all_dyn8l1p0bS_Pre,2)));

dyn1l1p0aS_PostSEM=(std(all_dyn1l1p0aS_Post)./sqrt(size(all_dyn1l1p0aS_Post,2)));
dyn1l1p0bS_PostSEM=(std(all_dyn1l1p0bS_Post)./sqrt(size(all_dyn1l1p0bS_Post,2)));
dyn1l1p0cS_PostSEM=(std(all_dyn1l1p0cS_Post)./sqrt(size(all_dyn1l1p0cS_Post,2)));
dyn2l1p0bS_PostSEM=(std(all_dyn2l1p0bS_Post)./sqrt(size(all_dyn2l1p0bS_Post,2)));
dyn4l1p0bS_PostSEM=(std(all_dyn4l1p0bS_Post)./sqrt(size(all_dyn4l1p0bS_Post,2)));
dyn8l1p0bS_PostSEM=(std(all_dyn8l1p0bS_Post)./sqrt(size(all_dyn8l1p0bS_Post,2)));


% tmpdata1aS_SEM=(std(tmpdata1aS_Mean)./(sqrt(size(tmpdata1aS_Mean,2))));  %SEM
% tmpdata1bS_SEM=(std(tmpdata1bS_Mean)./(sqrt(size(tmpdata1bS_Mean,2))));
% tmpdata1cS_SEM=(std(tmpdata1cS_Mean)./(sqrt(size(tmpdata1cS_Mean,2))));
% 
% tmpdata2bS_SEM=(std(tmpdata2bS_Mean)./(sqrt(size(tmpdata2bS_Mean,2))));
% tmpdata4bS_SEM=(std(tmpdata4bS_Mean)./(sqrt(size(tmpdata4bS_Mean,2))));
% tmpdata8bS_SEM=(std(tmpdata8bS_Mean)./(sqrt(size(tmpdata8bS_Mean,2))));


%5Hz Tacr1 only Bar
bar([nanmean(all_dyn1l1p0cS_Post) nanmean(all_dyn1l1p0bS_Post) nanmean(all_dyn1l1p0aS_Post)]) %dose dependent ex
hold on
errorbar([nanmean(all_dyn1l1p0cS_Post) nanmean(all_dyn1l1p0bS_Post) nanmean(all_dyn1l1p0aS_Post)], [dyn1l1p0cS_PostSEM dyn1l1p0bS_PostSEM dyn1l1p0aS_PostSEM], 'k.')
scatter(ones(1,length(all_dyn1l1p0cS_Post)),all_dyn1l1p0cS_Post,'o')
scatter(ones(1,length(all_dyn1l1p0bS_Post)).*2,all_dyn1l1p0bS_Post,'o')
scatter(ones(1,length(all_dyn1l1p0aS_Post)).*3,all_dyn1l1p0aS_Post,'o')

%5-40Hz Tacr1 only 
bar([nanmean(all_dyn2l1p0bS_Post) nanmean(all_dyn4l1p0bS_Post) nanmean(all_dyn8l1p0bS_Post)]) %dose dependent ex
hold on
errorbar([nanmean(all_dyn2l1p0bS_Post) nanmean(all_dyn4l1p0bS_Post) nanmean(all_dyn8l1p0bS_Post)], [dyn2l1p0bS_PostSEM dyn4l1p0bS_PostSEM dyn8l1p0bS_PostSEM], 'k.')
scatter(ones(1,length(all_dyn2l1p0bS_Post)),all_dyn2l1p0bS_Post,'o')
scatter(ones(1,length(all_dyn4l1p0bS_Post)).*2,all_dyn2l1p0bS_Post,'o')
scatter(ones(1,length(all_dyn8l1p0bS_Post)).*3,all_dyn8l1p0bS_Post,'o')

%5Hz control
bar([ nanmean(tmpdata1cS_MeanP) nanmean(tmpdata1bS_MeanP) nanmean(tmpdata1aS_MeanP)]) %dose dependent ex
hold on
errorbar([nanmean(tmpdata1cS_MeanP) nanmean(tmpdata1bS_MeanP) nanmean(tmpdata1aS_MeanP)], [tmpdata1cS_SEMP tmpdata1bS_SEMP tmpdata1aS_SEMP], 'k.')
scatter(ones(1,length(tmpdata1cS_MeanP)),tmpdata1cS_MeanP,'o')
scatter(ones(1,length(tmpdata1bS_MeanP)).*2,tmpdata1bS_MeanP,'o')
scatter(ones(1,length(tmpdata1aS_MeanP)).*3,tmpdata1aS_MeanP,'o')

%5-40Hz control 
bar([nanmean(tmpdata2bS_MeanP) nanmean(tmpdata4bS_MeanP) nanmean(tmpdata8bS_MeanP)]) %dose dependent ex
hold on
errorbar([nanmean(tmpdata2bS_MeanP) nanmean(tmpdata4bS_MeanP) nanmean(tmpdata8bS_MeanP)], [tmpdata2bS_SEMP tmpdata4bS_SEMP tmpdata8bS_SEMP], 'k.')
scatter(ones(1,length(tmpdata2bS_MeanP)),tmpdata2bS_MeanP,'o')
scatter(ones(1,length(tmpdata4bS_MeanP)).*2,tmpdata4bS_MeanP,'o')
scatter(ones(1,length(tmpdata8bS_MeanP)).*3,tmpdata8bS_MeanP,'o')

print -dpdf tmpdata1248bS_Tacr1Con -painters



%Bar graph 5Hz 30ms with control
figure;
model_series=[nanmean(tmpdata1aS_Mean) nanmean(all_dyn1l1p0aS_Pre) 0 nanmean(tmpdata1aS_MeanP) nanmean(all_dyn1l1p0aS_Post)];
model_error=[tmpdata1aS_SEM dyn1l1p0aS_PreSEM 0 tmpdata1aS_SEMP dyn1l1p0aS_PostSEM];
model_scatter{1,1}=tmpdata1aS_Mean; 
model_scatter{1,2}=all_dyn1l1p0aS_Pre; 
model_scatter{1,3}=0;
model_scatter{1,4}=tmpdata1aS_MeanP;
model_scatter{1,5}=all_dyn1l1p0aS_Post;
    
b=bar(model_series);
hold on
errorbar([1 2 3 4 5], model_series, model_error, 'k', 'linestyle', 'none');
for i = [1 2 4 5] 
scatter(ones(length(model_scatter{1,i}),1).*i,model_scatter{1,i},'.')
end
set(gca,'xtick',[1.5 4.5])
print -dpdf dyn1l1p0aS_Tacr1Con -painters


%Bar graph 5Hz 10ms with control
figure;
model_series=[nanmean(tmpdata1bS_Mean) nanmean(all_dyn1l1p0bS_Pre) 0 nanmean(tmpdata1bS_MeanP) nanmean(all_dyn1l1p0bS_Post)];
model_error=[tmpdata1bS_SEM dyn1l1p0bS_PreSEM 0 tmpdata1bS_SEMP dyn1l1p0bS_PostSEM];
model_scatter{1,1}=tmpdata1bS_Mean; 
model_scatter{1,2}=all_dyn1l1p0bS_Pre; 
model_scatter{1,3}=0;
model_scatter{1,4}=tmpdata1bS_MeanP;
model_scatter{1,5}=all_dyn1l1p0bS_Post;
    
b=bar(model_series);
hold on
errorbar([1 2 3 4 5], model_series, model_error, 'k', 'linestyle', 'none');
for i = [1 2 4 5] 
scatter(ones(length(model_scatter{1,i}),1).*i,model_scatter{1,i},'.')
end
set(gca,'xtick',[1.5 4.5])
print -dpdf dyn1l1p0bS_Tacr1Con -painters

%Bar graph 5Hz 2ms with control
figure;
model_series=[nanmean(tmpdata1cS_Mean) nanmean(all_dyn1l1p0cS_Pre) 0 nanmean(tmpdata1cS_MeanP) nanmean(all_dyn1l1p0cS_Post)];
model_error=[tmpdata1cS_SEM dyn1l1p0cS_PreSEM 0 tmpdata1cS_SEMP dyn1l1p0cS_PostSEM];
model_scatter{1,1}=tmpdata1cS_Mean; 
model_scatter{1,2}=all_dyn1l1p0cS_Pre; 
model_scatter{1,3}=0;
model_scatter{1,4}=tmpdata1cS_MeanP;
model_scatter{1,5}=all_dyn1l1p0cS_Post;
    
b=bar(model_series);
hold on
errorbar([1 2 3 4 5], model_series, model_error, 'k', 'linestyle', 'none');
for i = [1 2 4 5] 
scatter(ones(length(model_scatter{1,i}),1).*i,model_scatter{1,i},'.')
end
set(gca,'xtick',[1.5 4.5])

print -dpdf dyn1l1p0cS_Tacr1Con -painters

%Bar graph 10Hz 10ms with control
figure;
model_series=[nanmean(tmpdata2bS_Mean) nanmean(all_dyn2l1p0bS_Pre) 0 nanmean(tmpdata2bS_MeanP) nanmean(all_dyn2l1p0bS_Post)];
model_error=[tmpdata2bS_SEM dyn2l1p0bS_PreSEM 0 tmpdata2bS_SEMP dyn2l1p0bS_PostSEM];
model_scatter{1,1}=tmpdata2bS_Mean; 
model_scatter{1,2}=all_dyn2l1p0bS_Pre; 
model_scatter{1,3}=0;
model_scatter{1,4}=tmpdata2bS_MeanP;
model_scatter{1,5}=all_dyn2l1p0bS_Post;
    
b=bar(model_series);
hold on
errorbar([1 2 3 4 5], model_series, model_error, 'k', 'linestyle', 'none');
for i = [1 2 4 5] 
scatter(ones(length(model_scatter{1,i}),1).*i,model_scatter{1,i},'.')
end
set(gca,'xtick',[1.5 4.5])
print -dpdf dyn2l1p0bS_Tacr1Con -painters

%Bar graph 20Hz 10ms with control
figure;
model_series=[nanmean(tmpdata4bS_Mean) nanmean(all_dyn4l1p0bS_Pre) 0 nanmean(tmpdata4bS_MeanP) nanmean(all_dyn4l1p0bS_Post)];
model_error=[tmpdata4bS_SEM dyn4l1p0bS_PreSEM 0 tmpdata4bS_SEMP dyn4l1p0bS_PostSEM];
model_scatter{1,1}=tmpdata4bS_Mean; 
model_scatter{1,2}=all_dyn4l1p0bS_Pre; 
model_scatter{1,3}=0;
model_scatter{1,4}=tmpdata4bS_MeanP;
model_scatter{1,5}=all_dyn4l1p0bS_Post;
    
b=bar(model_series);
hold on
errorbar([1 2 3 4 5], model_series, model_error, 'k', 'linestyle', 'none');
for i = [1 2 4 5] 
scatter(ones(length(model_scatter{1,i}),1).*i,model_scatter{1,i},'.')
end
set(gca,'xtick',[1.5 4.5])
print -dpdf dyn4l1p0bS_Tacr1Con -painters

%Bar graph 20Hz 10ms with control (with 40Hz control???)
figure;
model_series=[nanmean(tmpdata8bS_Mean) nanmean(all_dyn4l1p0bS_Pre) 0 nanmean(tmpdata8bS_MeanP) nanmean(all_dyn4l1p0bS_Post)];
model_error=[tmpdata8bS_SEM dyn4l1p0bS_PreSEM 0 tmpdata8bS_SEMP dyn4l1p0bS_PostSEM];
model_scatter{1,1}=tmpdata8bS_Mean; 
model_scatter{1,2}=all_dyn4l1p0bS_Pre; 
model_scatter{1,3}=0;
model_scatter{1,4}=tmpdata8bS_MeanP;
model_scatter{1,5}=all_dyn4l1p0bS_Post;
    
b=bar(model_series);
hold on
errorbar([1 2 3 4 5], model_series, model_error, 'k', 'linestyle', 'none');
for i = [1 2 4 5] 
scatter(ones(length(model_scatter{1,i}),1).*i,model_scatter{1,i},'o')
end
set(gca,'xtick',[1.5 4.5])
print -dpdf dyn4l1p0bS_Tacr1Con -painters

%Bar graph 40Hz 10ms with control
figure;
model_series=[nanmean(tmpdata8bS_Mean) nanmean(all_dyn8l1p0bS_Pre) 0 nanmean(tmpdata8bS_MeanP) nanmean(all_dyn8l1p0bS_Post)];
model_error=[tmpdata8bS_SEM dyn8l1p0bS_PreSEM 0 tmpdata8bS_SEMP dyn8l1p0bS_PostSEM];
model_scatter{1,1}=tmpdata8bS_Mean; 
model_scatter{1,2}=all_dyn8l1p0bS_Pre; 
model_scatter{1,3}=0;
model_scatter{1,4}=tmpdata8bS_MeanP;
model_scatter{1,5}=all_dyn8l1p0bS_Post;
    
b=bar(model_series);
hold on
errorbar([1 2 3 4 5], model_series, model_error, 'k', 'linestyle', 'none');
for i = [1 2 4 5] 
scatter(ones(length(model_scatter{1,i}),1).*i,model_scatter{1,i},'.')
end
set(gca,'xtick',[1.5 4.5])
print -dpdf dyn8l1p0bS_Tacr1Con -painters


bar([nanmean(all_dyn1l1p0bS_Pre) nanmean(all_dyn1l1p0bS_Post)]) %dose dependent ex
hold on
errorbar([nanmean(all_dyn1l1p0bS_Pre) nanmean(all_dyn1l1p0bS_Post)], [dyn1l1p0bS_PreSEM dyn1l1p0bS_PostSEM], 'k.')
scatter(ones(1,length(all_dyn1l1p0bS_Pre)),all_dyn1l1p0bS_Pre,'o')
scatter(ones(1,length(all_dyn1l1p0bS_Post)).*2,all_dyn1l1p0bS_Post,'o')

%Tacr1
bar([nanmean(all_dyn1l1p0aS_Pre) nanmean(all_dyn1l1p0aS_Post) nanmean(all_dyn1l1p0bS_Post) nanmean(all_dyn1l1p0cS_Post)]) %dose dependent ex
hold on
errorbar([nanmean(all_dyn1l1p0aS_Pre) nanmean(all_dyn1l1p0cS_Post)], [dyn1l1p0cS_PreSEM dyn1l1p0cS_PostSEM], 'k.')
scatter(ones(1,length(all_dyn1l1p0cS_Pre)),all_dyn1l1p0cS_Pre,'o')
scatter(ones(1,length(all_dyn1l1p0cS_Post)).*2,all_dyn1l1p0cS_Post,'o')



%5Hz 30ms with control
bar([nanmean(tmpdata1aS_Mean) nanmean(all_dyn1l1p0aS_Pre) nanmean(tmpdata1aS_MeanP) nanmean(all_dyn1l1p0aS_Post)]) %dose dependent ex
hold on
errorbar([nanmean(tmpdata1aS_Mean) nanmean(all_dyn1l1p0aS_Pre) nanmean(tmpdata1aS_MeanP) nanmean(all_dyn1l1p0aS_Post)],...
    [tmpdata1aS_SEM dyn1l1p0aS_PreSEM tmpdata1aS_SEMP dyn1l1p0aS_PostSEM], 'k.')

scatter(ones(1,length(tmpdata1aS_Mean)),tmpdata1aS_Mean,'o')
scatter(ones(1,length(all_dyn1l1p0aS_Pre)).*2,all_dyn1l1p0aS_Pre,'o')
scatter(ones(1,length(tmpdata1aS_MeanP)).*3, tmpdata1aS_MeanP,'o')
scatter(ones(1,length(all_dyn1l1p0aS_Post)).*4,all_dyn1l1p0aS_Post,'o')


%%%%
%Bar graph 5Hz 10ms with control
figure;
model_series=[nanmean(tmpdata1bS_Mean) nanmean(all_dyn1l1p0bS_Pre) 0 nanmean(tmpdata1bS_MeanP) nanmean(all_dyn1l1p0bS_Post)];
model_error=[tmpdata1bS_SEM dyn1l1p0bS_PreSEM 0 tmpdata1bS_SEMP dyn1l1p0bS_PostSEM];
model_scatter{1,1}=tmpdata1bS_Mean; 
model_scatter{1,2}=all_dyn1l1p0bS_Pre; 
model_scatter{1,3}=0;
model_scatter{1,4}=tmpdata1bS_MeanP;
model_scatter{1,5}=all_dyn1l1p0bS_Post;
    
b=bar(model_series);
hold on
errorbar([1 2 3 4 5], model_series, model_error, 'k', 'linestyle', 'none');
for i = [1 2 4 5] 
scatter(ones(length(model_scatter{1,i}),1).*i,model_scatter{1,i},'.')
end
set(gca,'xtick',[1.5 4.5])


figure;
model_series=[nanmean(w) nanmean(x) 0 nanmean(y) nanmean(z)];
model_error=[w_SEM xSEM 0 ySEMP zSEM];
model_scatter{1,1}=w; 
model_scatter{1,2}=x_Pre; 
model_scatter{1,3}=0;
model_scatter{1,4}=yP;
model_scatter{1,5}=z_Post;
    
b=bar(model_series);
hold on
errorbar([1 2 3 4 5], model_series, model_error, 'k', 'linestyle', 'none');
for i = [1 2 4 5] 
scatter(ones(length(model_scatter{1,i}),1).*i,model_scatter{1,i},'.')
end
set(gca,'xtick',[1.5 4.5])






%Bar graph 5Hz 2ms with control
model_series=[nanmean(a) nanmean(all_dyn1l1p0cS_Pre); nanmean(tmpdata1cS_MeanP) nanmean(all_dyn1l1p0cS_Post)];
model_error=[tmpdata1cS_SEM dyn1l1p0cS_PreSEM; tmpdata1cS_SEMP dyn1l1p0cS_PostSEM];
% model_scatter=[tmpdata1aS_Mean all_dyn1l1p0aS_Pre; tmpdata1aS_MeanP all_dyn1l1p0aS_Post];
    
b=bar(model_series, 'grouped');
hold on
ngroups = size(model_series, 1);
nbars = size(model_series, 2);
groupwidth = min(0.8, nbars/(nbars + 1.5));
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, model_series(:,i), model_error(:,i), 'k', 'linestyle', 'none');
%     scatter(x(i).* ones(length(model_scatter(i,:)),1),model_scatter(i,:),'*')
end
hold off

%Bar graph 10Hz 10ms with control
model_series=[nanmean(tmpdata2bS_Mean) nanmean(all_dyn2l1p0bS_Pre); nanmean(tmpdata2bS_MeanP) nanmean(all_dyn2l1p0bS_Post)];
model_error=[tmpdata2bS_SEM dyn2l1p0bS_PreSEM; tmpdata2bS_SEMP dyn2l1p0bS_PostSEM];
% model_scatter=[tmpdata1aS_Mean all_dyn1l1p0aS_Pre; tmpdata1aS_MeanP all_dyn1l1p0aS_Post];
    
b=bar(model_series, 'grouped');
hold on
ngroups = size(model_series, 1);
nbars = size(model_series, 2);
groupwidth = min(0.8, nbars/(nbars + 1.5));
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, model_series(:,i), model_error(:,i), 'k', 'linestyle', 'none');
%     scatter(x(i).* ones(length(model_scatter(i,:)),1),model_scatter(i,:),'*')
end
hold off





%Controls 5Hz
bar([nanmean(tmpdata1aS_Mean) nanmean(tmpdata1aS_Mean) nanmean(tmpdata1aS_MeanP) nanmean(all_dyn1l1p0aS_Post)]) %dose dependent ex
hold on
errorbar([nanmean(tmpdata1aS_Mean) nanmean(all_dyn1l1p0aS_Pre) nanmean(tmpdata1aS_MeanP) nanmean(all_dyn1l1p0aS_Post)],...
    [tmpdata1aS_SEM dyn1l1p0aS_PreSEM tmpdata1aS_SEMP dyn1l1p0aS_PostSEM], 'k.')

scatter(ones(1,length(tmpdata1aS_Mean)),tmpdata1aS_Mean,'o')
scatter(ones(1,length(all_dyn1l1p0aS_Pre)).*2,all_dyn1l1p0aS_Pre,'o')
scatter(ones(1,length(tmpdata1aS_MeanP)).*3, tmpdata1aS_MeanP,'o')
scatter(ones(1,length(all_dyn1l1p0aS_Post)).*4,all_dyn1l1p0aS_Post,'o')



bar([nanmean(tmpdata2bS_Mean) nanmean(tmpdata4bS_Mean) nanmean(tmpdata8bS_Mean)]) %dose-dependent ex
hold on
errorbar([nanmean(tmpdata2bS_Mean) nanmean(tmpdata4bS_Mean) nanmean(tmpdata8bS_Mean)], [tmpdata2bS_SEM tmpdata4bS_SEM tmpdata8bS_SEM], 'k.')

scatter(ones(1,length(tmpdata2bS_Mean)),tmpdata2bS_Mean,'o')
scatter(ones(1,length(tmpdata4bS_Mean)).*2,tmpdata4bS_Mean,'o')




