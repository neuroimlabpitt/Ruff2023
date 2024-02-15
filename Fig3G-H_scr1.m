

clear all
close all

smw=10;

load Fig3H_WhiskerArt_GCaMPexp

figure(1), clf,
subplot(211), plot(tt,all_WhiskerPerArt),
ylabel('Art Diameter'), xlabel('Time'), title('Whisker Stim'), dofontsize(18), set(gca,'FontSize',14),
subplot(212), plot(tt,all_WhiskerPerSm),
ylabel('SMC Calcium'), xlabel('Time'), dofontsize(18), set(gca,'FontSize',14),

all_WhiskerPerArt_orig=all_WhiskerPerArt;
all_WhiskerPerSm_orig=all_WhiskerPerSm;
all_WhiskerPerArt=tcdetrend(all_WhiskerPerArt,1,[1 20 131 150]);
all_WhiskerPerSm=tcdetrend(all_WhiskerPerSm,1,[1 20 131 150]);

tmpArt_mean=tc_stats3(all_WhiskerPerArt_Mean,tt); 
for mm=1:size(all_WhiskerPerArt,2), 
    tmpArt(:,mm)=tc_stats3(all_WhiskerPerArt(:,mm),tt); 
    tmpArts(:,mm)=tc_stats3(mysmooth(all_WhiskerPerArt(:,mm),smw),tt); 
    %tc_stats3(all_WhiskerPerArt(:,mm),tt); pause,
end;

tmpSm_mean=tc_stats3(all_WhiskerPerSm_Mean*-1,tt); 
for mm=1:size(all_WhiskerPerSm,2),
    tmpSm(:,mm)=tc_stats3(all_WhiskerPerSm(:,mm)*-1,tt); 
    tmpSms(:,mm)=tc_stats3(mysmooth(all_WhiskerPerSm(:,mm),smw)*-1,tt); 
    %tc_stats3(all_WhiskerPerSm(:,mm)*-1,tt); pause,
end;

figure(1), tc_stats3(all_WhiskerPerArt_Mean,tt); %pause,
figure(1), tc_stats3(all_WhiskerPerSm_Mean*-1,tt); %pause,

disp('WHISKER Art and Sm below:');
tmpii=find(tmpArts(12,:)<3);
[tmpArt_mean([12 16 20]) mean(tmpArts([12 16 20],tmpii),2) std(tmpArts([12 16 20],tmpii),[],2) ones(3,1)*length(tmpii)],
tmpii=find(tmpSms(12,:)<3);
[tmpSm_mean([12 16 20]) mean(tmpSms([12 16 20],tmpii),2) std(tmpSms([12 16 20],tmpii),[],2) ones(3,1)*length(tmpii)],

%clear tmp*



load Fig3H_WhiskerCap_GCaMPexp

all_WhiskerPerCap=double(all_WhiskerPerCap);
all_WhiskerPerCap_Mean=double(all_WhiskerPerCap_Mean);
all_WhiskerPerCap_SEM=double(all_WhiskerPerCap_SEM);

all_WhiskerPerCap_orig=all_WhiskerPerCap;
all_WhiskerPerPericyte_orig=all_WhiskerPerPericyte;
all_WhiskerPerCap=tcdetrend(all_WhiskerPerCap,1,[1 20 131 150]);
all_WhiskerPerPericyte=tcdetrend(all_WhiskerPerPericyte,1,[1 20 131 150]);

figure(3), clf,
subplot(211), plot(tt,double(all_WhiskerPerCap)),
ylabel('Cap Diameter'), xlabel('Time'), title('Whisker Stim'), dofontsize(18), set(gca,'FontSize',14),
subplot(212), plot(tt,all_WhiskerPerPericyte),
ylabel('Pericyte Calcium'), xlabel('Time'), dofontsize(18), set(gca,'FontSize',14),

figure(4), clf,
subplot(211),
plotmsd4(tt,[all_WhiskerPerArt_Mean all_WhiskerPerSm_Mean*-1],[all_WhiskerPerArt_SEM all_WhiskerPerArt_SEM])
ylabel('Art and SMC Changes'), xlabel('Time'), title('Whisker Stim'), dofontsize(18), set(gca,'FontSize',14),
subplot(212),
plotmsd4(tt,[all_WhiskerPerCap_Mean all_WhiskerPerPericyte_Mean*-1],[all_WhiskerPerCap_SEM all_WhiskerPerPericyte_SEM])
ylabel('Cap and Per Changes'), xlabel('Time'), dofontsize(18), set(gca,'FontSize',14),


tmpCap_mean=tc_stats3(all_WhiskerPerCap_Mean,tt); 
for mm=1:size(all_WhiskerPerCap,2), 
    tmpCap(:,mm)=tc_stats3(all_WhiskerPerCap(:,mm),tt); 
    tmpCaps(:,mm)=tc_stats3(mysmooth(all_WhiskerPerCap(:,mm),smw),tt); 
    %tc_stats3(all_WhiskerPerCap(:,mm),tt); pause,
end;

tmpPer_mean=tc_stats3(all_WhiskerPerPericyte_Mean*-1,tt); 
for mm=1:size(all_WhiskerPerPericyte,2), 
    tmpPer(:,mm)=tc_stats3(all_WhiskerPerPericyte(:,mm)*-1,tt); 
    tmpPers(:,mm)=tc_stats3(mysmooth(all_WhiskerPerPericyte(:,mm),smw)*-1,tt); 
    %tc_stats3(all_WhiskerPerPericyte(:,mm)*-1,tt); pause,
end;

figure(1), tc_stats3(all_WhiskerPerCap_Mean,tt); %pause,
figure(1), tc_stats3(all_WhiskerPerPericyte_Mean*-1,tt); %pause,

disp('WHISKER Cap and Per below:');
tmpii=find(tmpCaps(12,:)<3);
[tmpCap_mean([12 16 20]) mean(tmpCaps([12 16 20],tmpii),2) std(tmpCaps([12 16 20],tmpii),[],2) ones(3,1)*length(tmpii)],
tmpii=find(tmpPers(12,:)<3);
[tmpPer_mean([12 16 20]) mean(tmpPers([12 16 20],tmpii),2) std(tmpPers([12 16 20],tmpii),[],2) ones(3,1)*length(tmpii)],

tmpii=find(tmpArt(12,:)<3);
tmpArt([12 16],tmpii)'

tmpii=find(tmpSm(12,:)<3);
tmpSm([12 16],tmpii)'

tmpii=find(tmpCap(12,:)<3);
tmpCap([12 16],tmpii)'

tmpii=find(tmpPer(12,:)<3);
tmpPer([12 16],tmpii)'

%clear tmp*



load Fig3H_StimCap_GCaMPexpV2
load Fig3H_StimVessel_GCaMPexpV2
load Fig3G_StimPericyte_GCaMPexpV2
load Fig3G_StimVSMC_GCaMPexpV2
 
% StimCap_GCaMPexpV2 all_rr1a_percentCap all_rr1a_micronsCap
% StimVessel_GCaMPexpV2 all_rr1a_percentArt all_rr1a_micronsArt
% StimPericyte_GCaMPexpV2 all_yproj2max_percentPericyte
% StimVSMC_GCaMPexpV2 all_yproj2max_percentSM

all_StimPerCap = all_rr1a_percentCap;
all_StimPerArt = all_rr1a_percentArt;
all_StimPerPericyte = all_yproj2max_percentPericyte;
all_StimPerSm = all_yproj2max_percentSM;
nCap = size(all_StimPerCap,2);
nArt = size(all_StimPerArt,2);
nPer = size(all_StimPerPericyte,2);
nSm = size(all_StimPerSm,2);

all_StimPerArt_orig=all_StimPerArt;
all_StimPerSm_orig=all_StimPerSm;
all_StimPerArt=tcdetrend(all_StimPerArt,1,[1 20 131 150]);
all_StimPerSm=tcdetrend(all_StimPerSm,1,[1 20 131 150]);

all_StimPerCap_orig=all_StimPerCap;
all_StimPerPericyte_orig=all_StimPerPericyte;
all_StimPerCap=tcdetrend(all_StimPerCap,1,[1 20 131 150]);
all_StimPerPericyte=tcdetrend(all_StimPerPericyte,1,[1 20 131 150]);


figure(5), clf,
subplot(211), plot(tt,all_StimPerArt),
ylabel('Art Diameter'), xlabel('Time'), title('Opto Stim'), dofontsize(18), set(gca,'FontSize',14),
subplot(212), plot(tt,all_StimPerCap),
ylabel('Cap Diameter'), xlabel('Time'), dofontsize(18), set(gca,'FontSize',14),

figure(6), clf,
subplot(211), plot(tt,all_StimPerSm),
ylabel('SMC Calcium'), xlabel('Time'), title('Opto Stim'), dofontsize(18), set(gca,'FontSize',14),
subplot(212), plot(tt,all_StimPerPericyte),
ylabel('Per Calcium'), xlabel('Time'), dofontsize(18), set(gca,'FontSize',14),

figure(7), 
subplot(211),
plotmsd4(tt,[mean(all_StimPerArt,2) mean(all_StimPerSm,2)*-1],[std(all_StimPerArt,[],2)/sqrt(nArt) std(all_StimPerSm,[],2)/sqrt(nSm)])
ylabel('Art and SMC Changes'), xlabel('Time'), title('Opto Stim'), dofontsize(18), set(gca,'FontSize',14),
subplot(212),
plotmsd4(tt,[mean(all_StimPerCap,2) mean(all_StimPerPericyte,2)*-1],[std(all_StimPerCap,[],2)/sqrt(nCap) std(all_StimPerPericyte,[],2)/sqrt(nPer)])
ylabel('Cap and Per Changes'), xlabel('Time'), dofontsize(18), set(gca,'FontSize',14),


tmpOptoArt_mean=tc_stats3(mean(all_StimPerArt,2),tt); 
for mm=1:size(all_StimPerArt,2), 
    tmpOptoArt(:,mm)=tc_stats3(all_StimPerArt(:,mm),tt); 
    tmpOptoArts(:,mm)=tc_stats3(mysmooth(all_StimPerArt(:,mm),smw),tt); 
    %tc_stats3(all_OptoPerArt(:,mm),tt); pause,
end;

tmpOptoSm_mean=tc_stats3(mean(all_StimPerSm,2)*-1,tt); 
for mm=1:size(all_StimPerSm,2), 
    tmpOptoSm(:,mm)=tc_stats3(all_StimPerSm(:,mm)*-1,tt); 
    tmpOptoSms(:,mm)=tc_stats3(mysmooth(all_StimPerSm(:,mm),smw)*-1,tt); 
    %tc_stats3(all_WhiskerPerSm(:,mm)*-1,tt); pause,
end;

tmpOptoCap_mean=tc_stats3(mean(all_StimPerCap,2),tt); 
for mm=1:size(all_StimPerCap,2), 
    tmpOptoCap(:,mm)=tc_stats3(all_StimPerCap(:,mm),tt); 
    tmpOptoCaps(:,mm)=tc_stats3(mysmooth(all_StimPerCap(:,mm),smw),tt); 
    %tc_stats3(all_WhiskerPerCap(:,mm),tt); pause,
end;

tmpOptoPer_mean=tc_stats3(mean(all_StimPerPericyte,2)*-1,tt); 
for mm=1:size(all_StimPerPericyte,2), 
    tmpOptoPer(:,mm)=tc_stats3(all_StimPerPericyte(:,mm)*-1,tt); 
    tmpOptoPers(:,mm)=tc_stats3(mysmooth(all_StimPerPericyte(:,mm),smw)*-1,tt); 
    %tc_stats3(all_WhiskerPerPericyte(:,mm)*-1,tt); pause,
end;

figure(2), tc_stats3(mean(all_StimPerCap,2),tt); %pause,
figure(2), tc_stats3(mean(all_StimPerPericyte,2)*-1,tt); %pause,


disp('OPTO Art and Sm below:');
tmpii=find(tmpOptoArts(12,:)<3);
[tmpOptoArt_mean([12 16 20]) mean(tmpOptoArts([12 16 20],tmpii),2) std(tmpOptoArts([12 16 20],tmpii),[],2) ones(3,1)*length(tmpii)],
tmpii=find(tmpOptoSms(12,:)<3);
[tmpOptoSm_mean([12 16 20]) mean(tmpOptoSms([12 16 20],tmpii),2) std(tmpOptoSms([12 16 20],tmpii),[],2) ones(3,1)*length(tmpii)],

disp('OPTO Cap and Per below:');
tmpii=find(tmpOptoCaps(12,:)<3);
[tmpOptoCap_mean([12 16 20]) mean(tmpOptoCaps([12 16 20],tmpii),2) std(tmpOptoCaps([12 16 20],tmpii),[],2) ones(3,1)*length(tmpii)],
tmpii=find(tmpOptoPers(12,:)<3);    % 10 and 12 here are outliers
[tmpOptoPer_mean([12 16 20]) mean(tmpOptoPers([12 16 20],tmpii),2) std(tmpOptoPers([12 16 20],tmpii),[],2) ones(3,1)*length(tmpii)],


tmpii=find(tmpOptoArt(12,:)<3);
tmpOptoArt([12 16],tmpii)'

tmpii=find(tmpOptoSm(12,:)<3);
tmpOptoSm([12 16],tmpii)'

tmpii=find(tmpOptoCap(12,:)<3);
tmpOptoCap([12 16],tmpii)'

tmpii=find(tmpOptoPer(12,:)<3);
tmpOptoPer([12 16],tmpii)'


tmpii=find(tmpOptoArts(12,:)<3);
tmpOptoArts([12 16],tmpii)'

tmpii=find(tmpOptoSms(12,:)<3);
tmpOptoSms([12 16],tmpii)'

tmpii=find(tmpOptoCaps(12,:)<3);
tmpOptoCaps([12 16],tmpii)'

tmpii=find(tmpOptoPers(12,:)<3);
tmpOptoPers([12 16],tmpii)'



figure(11), clf,
subplot(221),
plotmsd4(tt,[all_WhiskerPerArt_Mean all_WhiskerPerCap_Mean],[all_WhiskerPerArt_SEM all_WhiskerPerCap_SEM]),
ylabel('Art and Cap Changes'), xlabel('Time'), title('Whisker Stim'), dofontsize(18), set(gca,'FontSize',14), fatlines(1),
subplot(223),
plotmsd4(tt,[all_WhiskerPerSm_Mean all_WhiskerPerPericyte_Mean],[all_WhiskerPerSm_SEM all_WhiskerPerPericyte_SEM]),
ylabel('SMC and Per Changes'), xlabel('Time'), dofontsize(18), set(gca,'FontSize',14), fatlines(1), 
subplot(222),
plotmsd4(tt,mysmooth([all_WhiskerPerArt_Mean all_WhiskerPerCap_Mean]),[all_WhiskerPerArt_SEM all_WhiskerPerCap_SEM]),
ylabel('Art and Cap Changes'), xlabel('Time'), title('Whisker Stim'), dofontsize(18), set(gca,'FontSize',14), fatlines(1),
subplot(224),
plotmsd4(tt,mysmooth([all_WhiskerPerSm_Mean all_WhiskerPerPericyte_Mean]),[all_WhiskerPerSm_SEM all_WhiskerPerPericyte_SEM]),
ylabel('SMC and Per Changes'), xlabel('Time'), dofontsize(18), set(gca,'FontSize',14), fatlines(1), 

figure(12), clf,
subplot(221),
plotmsd4(tt,[mean(all_StimPerArt,2) mean(all_StimPerCap,2)],[std(all_StimPerArt,[],2)/sqrt(nArt) std(all_StimPerCap,[],2)/sqrt(nCap)]),
ylabel('Art and Cap Changes'), xlabel('Time'), title('Opto Stim'), dofontsize(18), set(gca,'FontSize',14), fatlines(1),
subplot(223),
plotmsd4(tt,[mean(all_StimPerSm,2) mean(all_StimPerPericyte,2)],[std(all_StimPerSm,[],2)/sqrt(nCap) std(all_StimPerPericyte,[],2)/sqrt(nPer)]),
ylabel('SMC and Per Changes'), xlabel('Time'), dofontsize(18), set(gca,'FontSize',14), fatlines(1),
subplot(222),
plotmsd4(tt,[mean(mysmooth(all_StimPerArt),2) mean(mysmooth(all_StimPerCap),2)],[std(all_StimPerArt,[],2)/sqrt(nArt) std(all_StimPerCap,[],2)/sqrt(nCap)]),
ylabel('Art and Cap Changes'), xlabel('Time'), title('Opto Stim'), dofontsize(18), set(gca,'FontSize',14), fatlines(1),
subplot(224),
plotmsd4(tt,[mean(mysmooth(all_StimPerSm),2) mean(mysmooth(all_StimPerPericyte),2)],[std(all_StimPerSm,[],2)/sqrt(nCap) std(all_StimPerPericyte,[],2)/sqrt(nPer)]),
ylabel('SMC and Per Changes'), xlabel('Time'), dofontsize(18), set(gca,'FontSize',14), fatlines(1),


figure(14),
subplot(221), tc_stats3(all_StimPerCap(:,1),tt),
subplot(222), tc_stats3(all_StimPerCap(:,4),tt),
subplot(223), tc_stats3(all_StimPerPericyte(:,1)*-1,tt),
subplot(224), tc_stats3(all_StimPerPericyte(:,4)*-1,tt),

