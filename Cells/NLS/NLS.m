clear all
load('restNS.mat');
%------------------------------------------------------------------------
tmax = 1000; % tempo m�ximo de simul��o
int = 2.9e-4; %intensidade da corrente injetada
tcuri = 100; %instante do inicio da corrente injetada
tcurf = 900; %instante do termino da corrente injetada
deltat = 0.01; % passo de integra��o
%------------------------------------------------------------------------
tempo = (0:deltat:tmax);
inj = zeros(1,length(tempo));
inj(find(tempo==tcuri):find(tempo==tcurf))=int;
vars = zeros(9,length(tempo));

vars(:,1) = rest;

for l = 1:length(tempo)-1
       
    vars(:,l+1) = runge4(vars(:,l),deltat,inj(l));       
     
end
figure
plot(tempo,vars(1,:))





