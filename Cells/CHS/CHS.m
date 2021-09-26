clear all
load('restCS.mat');

%-------------------------------------------------------------------------
deltat = 0.01; 
tmax=1000;
tcuri = 100;
tcurf = 900;
int = 1e-4;
%-------------------------------------------------------------------------

tempo = (0:deltat:tmax);
inj = zeros(1,length(tempo));
inj(find(tempo==tcuri):find(tempo==tcurf))=int;
vars = zeros(13,length(tempo));

vars(:,1) = rest;

for l = 1:length(tempo)-1
        
    vars(:,l+1) = vars(:,l) + funcao(vars(:,l),inj(l))*deltat;      
                
end
figure
plot(tempo,vars(1,:))