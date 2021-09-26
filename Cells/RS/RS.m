load('restRS.mat');
%--------------------------------------------------------------------------
tmax = 1000; % tempo maximo de simulcao em ms
int = 2e-4; %intensidade da corrente injetada em uA
tcuri = 100; %instante do inicio da corrente injetada em ms
tcurf = 900; %instante do termino da corrente injetada em ms
deltat = 0.01; % passo de integracao em ms
%----------------------------------------------------------------------------

tempo = (0:deltat:tmax);
inj = zeros(1,length(tempo));
inj(find(tempo==tcuri):find(tempo==tcurf))=int;
vars = zeros(12,length(tempo));

vars(:,1) = rest;

for l = 1:length(tempo)-1     
    vars(:,l+1) = runge4(vars(:,l),deltat,inj(l));      
end

figure;
plot(tempo,vars(1,:))