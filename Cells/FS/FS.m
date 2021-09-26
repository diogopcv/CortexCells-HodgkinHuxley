load('restFS.mat');

%------------------------------------------------------------------------
tmax = 1000; 
int = .5e-4; 
tcuri = 100; 
tcurf = 900;
deltat = 0.01;
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

