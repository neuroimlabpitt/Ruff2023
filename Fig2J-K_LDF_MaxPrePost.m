%load tmp_biopac_data_control.mat

tt=tmptt;

%PRE
%Control
tmpii=find((tt>-5)&(tt<-2));

Percent_tmpdata1aS=(tmpdata1aS-1)*100;
Percent_tmpdata1bS=(tmpdata1bS-1)*100;
Percent_tmpdata1cS=(tmpdata1cS-1)*100;


tmpdata1aS_Pre=(Percent_tmpdata1aS(tmpii,:)); 
tmpdata1aS_MaxPre=max(tmpdata1aS_Pre);
tmpdata1aS_MeanPre=mean(tmpdata1aS_Pre);


%ChR2
all_dyn1l1p0aS_Pre=(all_dyn1l1p0aS(tmpii,:));
all_dyn1l1p0aS_MeanPre=mean(all_dyn1l1p0aS_Pre);


%Post
%Control
tmpv=find((tt>2)&(tt<5));
tmpdata1aS_Post=(Percent_tmpdata1aS(tmpv,:)); 
tmpdata1aS_MaxPost=max(tmpdata1aS_Post);
tmpdata1aS_MeanPost=mean(tmpdata1aS_Post);

all_dyn1l1p0aS_Pos=(all_dyn1l1p0aS(tmpv,:));
all_dyn1l1p0aS_MeanPost=mean(all_dyn1l1p0aS_Pos);

%%
%PRE
%Control
tmpii=find((tt>-4)&(tt<-1));

Percent_tmpdata1aS=(tmpdata1aS-1)*100;

tmpdata1aS_Pre=(Percent_tmpdata1aS(tmpii,:)); 
%tmpdata1aS_MaxPre=max(tmpdata1aS_Pre);
tmpdata1aS_MeanPre=mean(tmpdata1aS_Pre);


%ChR2
all_dyn1l1p0aS_Pre=(all_dyn1l1p0aS(tmpii,:));
all_dyn1l1p0aS_MeanPre=mean(all_dyn1l1p0aS_Pre);
all_dyn1l1p0aS_MaxPre=max(all_dyn1l1p0aS_Pre);


%Post
%Control
tmpv=find((tt>1)&(tt<5));
tmpdata1aS_Pos=(Percent_tmpdata1aS(tmpv,:)); 
tmpdata1aS_MaxPost=max(tmpdata1aS_Pos);
tmpdata1aS_MeanPost=mean(tmpdata1aS_Pos);

all_dyn1l1p0aS_Pos=(all_dyn1l1p0aS(tmpv,:));
all_dyn1l1p0aS_MeanPost=mean(all_dyn1l1p0aS_Pos);

all_dyn1l1p0aS_MaxPost=max(all_dyn1l1p0aS_Pos);