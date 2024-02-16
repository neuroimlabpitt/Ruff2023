ArchTmiceMax=[];
groupname='ArchTmiceMax';

%% PRE
%Control
tmpii=find((tt>-4)&(tt<-2));


%whisker final
dyn1wh2S_Pre=(allmean_dyn1wh2S(tmpii,:)); 
dyn1wh2S_MeanPre=mean(dyn1wh2S_Pre);
dyn1wh2S_MaxPre=max(dyn1wh2S_Pre);

%whisker initial
dyn1wh1S_Pre=(allmean_dyn1wh1S(tmpii,:));
dyn1wh1S_MeanPre=mean(dyn1wh1S_Pre);

%whisker + light 5Hz 5 ms
dyn1l1p0aSwh_Pre=(allmean_dyn1l1p0cSwh(tmpii,:));
dyn1l1p0aSwh_MeanPre=mean(dyn1l1p0aSwh_Pre);
dyn1l1p0aSwh_MaxPre=max(dyn1l1p0aSwh_Pre);



%% Post
tmpv=find((tt>1)&(tt<4));

dyn1wh1S_Post=(allmean_dyn1wh1S(tmpv,:));
dyn1wh1S_MaxPost=max(dyn1wh1S_Post);

dyn1l1p0aSwh_Post=(allmean_dyn1l1p0cSwh(tmpv,:));
dyn1l1p0aSwh_MaxPost=max(dyn1l1p0aSwh_Post);

dyn1wh2S_Post=(allmean_dyn1wh2S(tmpv,:)); 
dyn1wh2S_MaxPost=max(dyn1wh2S_Post);

save(groupname,'dyn1wh1S_MeanPre','dyn1wh2S_MeanPre',...
    'dyn1l1p0aSwh_MeanPre','dyn1l1p0aSwh_MaxPost','dyn1wh2S_MaxPost','dyn1wh1S_MaxPost')

%% Trace smooth
MEAN_dyn2l1p0bS_SM=smooth(MEAN_dyn2l1p0bS(:,1),100);
SEM_dyn2l1p0bS_SM=smooth(SEM_dyn2l1p0bS(:,1),100);


%% Controls 
%(archt negative with light or whisker) see awake yellow light 589 

%For LDF script to find mean per animals (10 trials each animal) 
mean_dyn1l1p0cS=((mean(dyn1l1p0cS_new.FLUX,2)-1)*100);
mean_dyn1l1p0bS=((mean(dyn1l1p0bS_new.FLUX,2)-1)*100);
mean_dyn1l1p0aS=((mean(dyn1l1p0aS_new.FLUX,2)-1)*100);
mean_dyn2l1p0bS=((mean(dyn2l1p0bS_new.FLUX,2)-1)*100);
mean_dyn4l1p0bS=((mean(dyn4l1p0bS_new.FLUX,2)-1)*100);
mean_dyn8l1p0bS=((mean(dyn8l1p0bS_new.FLUX,2)-1)*100);
%mean_dyn1wh1S=((mean(dyn1wh1S_new.FLUX,2)-1)*100);


%Pre
tmpii=find((tt>-4)&(tt<-2));
%5hz 30ms
dyn1l1p0aS_Pre=(all_dyn1l1p0aS(tmpii,:));
dyn1l1p0aS_MaxPre=max(dyn1l1p0aS_Pre);
dyn1l1p0aS_MeanPre=mean(dyn1l1p0aS_Pre);
%5hz 5ms
dyn1l1p0cS_Pre=(all_dyn1l1p0cS(tmpii,:));
dyn1l1p0cS_MaxPre=max(dyn1l1p0cS_Pre);
dyn1l1p0cS_MeanPre=mean(dyn1l1p0cS_Pre);
%10hz 10ms
dyn2l1p0bS_Pre=(all_dyn2l1p0bS(tmpii,:));
dyn2l1p0bS_MaxPre=max(dyn2l1p0bS_Pre);
dyn2l1p0bS_MeanPre=mean(dyn2l1p0bS_Pre);
%20hz 10ms
dyn4l1p0bS_Pre=(allmean_dyn4l1p0bS(tmpii,:));
dyn4l1p0bS_MaxPre=max(dyn4l1p0bS_Pre);

%Post
tmpv=find((tt>1)&(tt<4));
%5hz 30ms
dyn1l1p0aS_Post=(all_dyn1l1p0aS(tmpv,:));
dyn1l1p0aS_MaxPost=max(dyn1l1p0aS_Post);
%5hz 5ms
dyn1l1p0cS_Post=(all_dyn1l1p0cS(tmpv,:));
dyn1l1p0cS_MaxPost=max(dyn1l1p0cS_Post);
%10hz 10ms
dyn2l1p0bS_Post=(all_dyn2l1p0bS(tmpv,:));
dyn2l1p0bS_MaxPost=max(dyn2l1p0bS_Post);
%20hz 10ms
dyn4l1p0bS_Post=(allmean_dyn4l1p0bS(tmpv,:));
dyn4l1p0bS_MaxPost=max(dyn4l1p0bS_Post);
%40hz 10ms
dyn8l1p0bS_Post=(allmean_dyn8l1p0bS(tmpv,:));
dyn8l1p0bS_MaxPost=max(dyn8l1p0bS_Post);
%whisker
tmpv=find((tt>0)&(tt<4));
dyn1wh1S_Post=(allmean_dyn1wh1S(tmpv,:));
dyn1wh1S_MaxPost=max(dyn1wh1S_Post);