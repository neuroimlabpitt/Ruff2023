
clear all
close all

load 20230412_NK1RChR2_1516_prevspost-inhibitor_analysis.mat

% variables
% dyn1wh1_1, dyn1wh1_2, dyn1wh1_3
% dyn1l1p0a_1, dyn1l1p0a_2, dyn1l1p0a_3

tmpvars = {'dyn1wh1_1', 'dyn1wh1_2', 'dyn1wh1_3', 'dyn1l1p0a_1', 'dyn1l1p0a_2', 'dyn1l1p0a_3'};

tt=([1:20000]-2000)/1000;
stim = rect(tt(:), 0, 1);

for mm=1:length(tmpvars),
    clear tmpvar tmp*_fix tmp*_orig
    eval(sprintf('tmpvar=%s;',tmpvars{mm}));
    for nn=1:size(tmpvar.FLUX,2),
       tmpflux=tcdetrend(tmpvar.FLUX(:,nn),1,[1 1900 18000 20000]);
       tmptb=tcdetrend(tmpvar.TB(:,nn),1,[1 1900 18000 20000]);
       tmpflux=tmpflux/mean(tmpflux(1:1900));
       tmptb=tmptb/mean(tmptb(1:1900));
       tmpflux1=myTBfix1(tmpflux,tmptb,1.05);
       %tmpflux1=myTBfix1(tmpflux,stim(:),0.5);
       tmpflux_orig(:,nn)=tmpflux;
       tmpflux_fix(:,nn)=tmpflux1;
    end
    eval(sprintf('%s_fix=tmpflux_fix; %s_orig=tmpflux_orig;',tmpvars{mm},tmpvars{mm}));
end

stim1=cumsum(stim(:)).*stim(:);
stim1=mysmooth(stim1,50);
stim1=stim1/max(stim1);

dyn1wh1_1_fix2=mean(dyn1wh1_1_fix,2)-1;
dyn1wh1_2_fix2=mean(dyn1wh1_2_fix,2)-1;
dyn1wh1_3_fix2=mean(dyn1wh1_3_fix,2)-1;

dyn1wh1_1_fix2(find(stim))=dyn1wh1_1_fix2(find(stim)).*stim1(find(stim));
dyn1wh1_2_fix2(find(stim))=dyn1wh1_2_fix2(find(stim)).*stim1(find(stim));
dyn1wh1_3_fix2(find(stim))=dyn1wh1_3_fix2(find(stim)).*stim1(find(stim));

dyn1wh1_1_fix2=mysmooth(dyn1wh1_1_fix2,50)+1;
dyn1wh1_2_fix2=mysmooth(dyn1wh1_2_fix2,50)+1;
dyn1wh1_3_fix2=mysmooth(dyn1wh1_3_fix2,50)+1;

figure(1), clf,
plotmsd4(tt,([dyn1wh1_1_fix2 dyn1wh1_2_fix2]-1)*100,([std(dyn1wh1_1_fix,[],2) std(dyn1wh1_2_fix,[],2)]/sqrt(9))*100),
fatlines(1.5); set(gca,'FontSize',14), ylabel('LDF (CBF; %)'), xlabel('Time (s)'), dofontsize(18);
