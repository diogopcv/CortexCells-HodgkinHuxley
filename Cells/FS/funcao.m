function [f] = funcao(vars,in)
% soma --------------------------------------------------------------------
diama = 1.9e-3;
compa = 1.4e-3;
area = pi*diama*compa;
vna = 45; %potencial sodio
vk = -90; %potencial potassio
vvaz = -71.6; %potencial vazamento
cm = 2.1*area; %capacitancia especifica
gnamax = 200*area; %maxima condutancia especifica sodio
gkmax = 255*area; %maxima condutancia especifica potassio
gnapmax = 1*area;
gvaz = 0.1*area; %condutancia vazamento
% dendritos ---------------------------------------------------------------
compd = 5e-3;
diamd = 4e-4;
aread = pi*diamd*compd;
cond2 = (2.273*pi*diamd^2)/(4*compd);
gvazd = 0.1*aread;
cmd = 2.1*aread;
%-------------------------------------------------------------------------

Ik = gkmax*((vars(2))^2)*(vars(1) - vk);
Ina = gnamax*((vars(3))^2)*(vars(4))*(vars(1) - vna);
Inap = gnapmax*((vars(5))^2)*(vars(1) - vna);
Ivaz = gvaz*(vars(1) - vvaz);
I2s = cond2*(vars(1) - vars(7));
I3s = cond2*(vars(1) - vars(8));

f1 = (-(Ik + Ina + Inap + Ivaz + I2s + I3s) + in)/cm ; 
taxa(1,1:8) = alfabetae(vars(1));

f2 = taxa(2)/taxa(1) - vars(2)/taxa(1);  
f3 = taxa(4)/taxa(3) - vars(3)/taxa(3); 
f4 = taxa(6)/taxa(5) - vars(4)/taxa(5); 
f5 = taxa(8)/taxa(7) - vars(5)/taxa(7);
f6 = -(gvazd*(vars(6)-vvaz) + cond2*(vars(6)-vars(7)))/(cmd);
f7 = -(gvazd*(vars(7)-vvaz) + cond2*(vars(7)-vars(6)) + cond2*(vars(7)-vars(1)))/(cmd);
f8 = -(gvazd*(vars(8)-vvaz) + cond2*(vars(8)-vars(9)) + cond2*(vars(8)-vars(1)))/(cmd);
f9 = -(gvazd*(vars(9)-vvaz) + cond2*(vars(9)-vars(8)))/(cmd);


f=[f1;f2;f3;f4;f5;f6;f7;f8;f9];