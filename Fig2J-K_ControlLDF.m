%controls that Alberto did
%noted as bio_summ_all3_control.mat (4 control animals, -ChR2 negative)
%main variables are 
%dyn1l05a(0.25mW,5hz,30ms)
%dyn1l05b (0.25mW,5hz,10ms)  ***
%dyn1l020a (0.25mW, 5hz, 30ms)
%dyn1l020b 0.25 mW, 10hz, 10ms)
%dyn1l040a (0.25 mW, 20hz, 30ms)
%dyn2l20a (1mW, 10hz, 30ms) ***
%dyn4l20a (2mW, 10hz, 30ms)  ***

a=30ms, b=10ms, dyn1=5Hz, dyn2=10Hz, dyn4=20Hz, 05=0.25mW (5mW at unit), 20=1mW (20mW at unit), 40=2mW (40mW at unit)


%control
tt=dyn1l20b_bioall.tt;

%Mean
dyn1l05a_bioallpercent=([dyn1l05b_bioall.FLUX]-1)*100; 
dyn1l05b_bioallpercent=([dyn1l05b_bioall.FLUX]-1)*100; 

dyn1l20a_bioallpercent=([dyn1l20a_bioall.FLUX]-1)*100; 
dyn1l20b_bioallpercent=([dyn1l20b_bioall.FLUX]-1)*100; 

dyn1l40a_bioallpercent=([dyn1l20a_bioall.FLUX]-1)*100; 

dyn2l20a_bioallpercent=([dyn1l20a_bioall.FLUX]-1)*100; 
dyn4l20a_bioallpercent=([dyn1l20a_bioall.FLUX]-1)*100; 

%check plots 
plot(tt, dyn1l05b_bioallpercent)
plot(tt, dyn4l20a_bioallpercent)


mean_dyn1l05a_bioall=(mean(dyn1l05a_bioallpercent,2));
mean_dyn1l05b_bioall=(mean(dyn1l05b_bioallpercent,2));

mean_dyn1l20a_bioall=(mean(dyn1l20a_bioallpercent,2));
mean_dyn1l20b_bioall=(mean(dyn1l20b_bioallpercent,2));

mean_dyn1l40a_bioall=(mean(dyn1l40a_bioallpercent,2));

mean_dyn2l20a_bioall=(mean(dyn2l20a_bioallpercent,2));
mean_dyn4l20a_bioall=(mean(dyn4l20a_bioallpercent,2));


% OR (if don't want to use _bioallpercent use the below equation
% mean_dyn1l05b_bioall=((mean(dyn1l05b_bioallFLUX,2)-1)*100);

plot(tt, mean_dyn1l20b_bioall)
plot(tt, mean_dyn1l05b_bioall)


%SEM
dyn1l05a_SEM=(std(dyn1l05a_bioall.FLUX,[],2)./(sqrt(size(dyn1l05a_bioall.FLUX,2))))*100;
dyn1l05b_SEM=(std(dyn1l05b_bioall.FLUX,[],2)./(sqrt(size(dyn1l05b_bioall.FLUX,2))))*100;

dyn1l20a_SEM=(std(dyn1l20a_bioall.FLUX,[],2)./(sqrt(size(dyn1l20a_bioall.FLUX,2))))*100;
dyn1l20b_SEM=(std(dyn1l20b_bioall.FLUX,[],2)./(sqrt(size(dyn1l20b_bioall.FLUX,2))))*100;

dyn1l40a_SEM=(std(dyn1l40a_bioall.FLUX,[],2)./(sqrt(size(dyn1l40a_bioall.FLUX,2))))*100;

dyn2l20a_SEM=(std(dyn2l20a_bioall.FLUX,[],2)./(sqrt(size(dyn2l20a_bioall.FLUX,2))))*100;
dyn4l20a_SEM=(std(dyn4l20a_bioall.FLUX,[],2)./(sqrt(size(dyn4l20a_bioall.FLUX,2))))*100;

%check plot
plotmsd4(tt, [mean_dyn1l05a_bioall mean_dyn1l05b_bioall], ...
                       [dyn1l05a_SEM dyn1l05b_SEM]);
                   
%% Max Time

% tt=dyn1l20a_bioall.tt;
%   ts=dyn1l20a_bioall.ts;
% plot(ts,(mean(dyn1l20a_bioall.fluxs2,2)-1)*100,ts,(mean(dyn2l20a_bioall.fluxs2,2)-1)*100,tt,(mean(dyn4l20a_bioall.FLUX2,2)-1)*100)
%   xlabel('Time (s)'), ylabel('LDF (CBF; %)'), 


%Pre-Stim
tstartP=-4;
tstopP=-1;

tt=dyn1l05a_bioall.tt;
Ptmpii=find((tt>=-4)&(tt<-1));
Pre_dyn1l05a_MaxTime=mean(dyn1l05a_bioallpercent(Ptmpii,:),1);




Prea_amp=mean(dyn1l20a_bioall.FLUX(tmpii,:),1);

(((mean(Prea_amp))-1)*100)


tmpii=find((tt>=4)&(dyn1l20a_bioall.tt<5.5));


Pre_dyn1l05a_MaxTime=dyn1l05a_bioallpercent(tt>=tstartP&tt<tstopP,:);
Pre_mean_dyn1l05a_MaxTime=((mean(Pre_dyn1l05a_MaxTime,1)));

Pre_dyn1l05a_MaxTime_SEM=nanstd(Pre_mean_dyn1l05a_MaxTime)/sqrt(size(Pre_mean_dyn1l05a_MaxTime,2));


Pre_dyn1l05b_MaxTime=dyn1l05b_bioall.FLUX(tt>=tstartP&tt<tstopP,:);
Pre_mean_dyn1l05b_MaxTime=mean(Pre_dyn1l05b_MaxTime,1);
Pre_mean_dyn1l05b_MaxTimePerc=((Pre_mean_dyn1l05b_MaxTime-1)*100);

Pre_dyn1l05b_MaxTime_SEM=nanstd(Pre_mean_dyn1l05b_MaxTimePerc)/sqrt(size(Pre_mean_dyn1l05b_MaxTimePerc,2));


  
% dyn1l05b_MaxTime=dyn1l05b_bioall.FLUX(tt>=tstart&tt<tstop,:);
% mean_dyn1l05b_MaxTime=mean(dyn1l05b_MaxTime,1);
% mean_dyn1l05b_MaxTimePerc=((mean_dyn1l05b_MaxTime-1)*100);
% 
% dyn1l05b_MaxTime_SEM=nanstd(mean_dyn1l05b_MaxTimePerc)/sqrt(size(mean_dyn1l05b_MaxTimePerc,2));


%bar graph

bar([nanmean(Pre_dyn1l05a_MaxTime) nanmean(Pre_dyn1l05b_MaxTime)])
hold on
errorbar([nanmean(Pre_dyn1l05a_MaxTimePerc)],[Pre_dyn1l05b_MaxTime_SEM], 'k.')
errorbar([nanmean(Pre_dyn1l05b_MaxTimePerc)],[Pre_dyn1l05b_MaxTime_SEM], 'k.')

scatter(ones(1,length(Pre_mean_dyn1l05b_MaxTime)),Pre_mean_dyn1l05b_MaxTime,'o')
scatter(ones(1,length(Pre_mean_dyn1l05b_MaxTimePerc)).*2,Pre_mean_dyn1l05b_MaxTimePerc,'o')


%Post-Stim  
tstart=1;
tstop=3;

dyn1l05b_MaxTime=dyn1l05b_bioall.FLUX(tt>=tstart&tt<tstop,:);
mean_dyn1l05b_MaxTime=mean(dyn1l05b_MaxTime,1);
mean_dyn1l05b_MaxTimePerc=((mean_dyn1l05b_MaxTime-1)*100);

dyn1l05b_MaxTime_SEM=nanstd(mean_dyn1l05b_MaxTimePerc)/sqrt(size(mean_dyn1l05b_MaxTimePerc,2));

bar([nanmean(mean_dyn1l05b_MaxTimePerc)])
hold on
errorbar([nanmean(mean_dyn1l05b_MaxTimePerc)],[dyn1l05b_MaxTime_SEM], 'k.')
scatter(ones(1,length(mean_dyn1l05b_MaxTimePerc)),mean_dyn1l05b_MaxTimePerc,'o')



scatter(ones(1,length(all_dyn1wh2S_max)).*2,all_dyn1wh2S_max,'o')

scatter(ones(1,length(all_dyn1l1p0cSwh_max)).*3,all_dyn1l1p0cSwh_max,'o')