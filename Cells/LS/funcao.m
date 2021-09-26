function [f] = funcao(vars,in)
compa = 1.3e-3;
diama = 1.3e-3;
area = pi*compa*diama;
vna = 45; %potencial sodio
vk = -90; %potencial potassio
vca = 150;
vvaz = -65; %potencial vazamento
cm = 1*area; %capacitancia especifica
gnamax = 370*area; %maxima condutancia especifica sodio
gkmax = 70*area; %maxima condutancia especifica potassio
gcamax = 1.6*area;%maxima condutancia especifica ca
gadmax = 2*area;
gkamax = 1.8*area;
gvaz = 0.25*area; %condutancia vazamento
B = 10;
tau = 50;
Ca_base = 5e-5;
%------------------------------------------------------------------------
compd = 5e-3;
diamd = 4e-4;
aread = pi*compd*diamd;
compd2 = 9e-3;
diamd2 = 4e-4;
aread2 = pi*compd2*diamd2;
cond2 = (14.29*pi*diamd^2)/(4*compd);
cond3 = (14.29*pi*diamd2^2)/(4*compd2);
gvazd = 0.25*aread;
gvazd2 = 0.25*aread2;
cmd = 1*aread;
cmd2 = 1*aread2;
%-------------------------------------------------------------------------

taxa(1,1:14) = alfabetae(vars(1),vars(8));
Ik = gkmax*((vars(2))^2)*(vars(1) - vk);
Ina = gnamax*((vars(3))^2)*(vars(4))*(vars(1) - vna);
Ika = gkamax*(vars(5)^2)*(vars(6))*(vars(1) - vk);
Ica = gcamax*((vars(7))^2)*(vars(1) - vca);
Iad = gadmax*((vars(9))^2)*(vars(1) - vk); 
Ivaz = gvaz*(vars(1) - vvaz);
I2s = cond3*(vars(1) - vars(11));
I3s = cond2*(vars(1) - vars(12));

f1 = (-(Ik + Ina + Ika + Ica + Iad + I2s + I3s + Ivaz) +in)/(cm);
f2 = taxa(2)/taxa(1) - vars(2)/taxa(1);
f3 = taxa(4)/taxa(3) - vars(3)/taxa(3);
f4 = taxa(6)/taxa(5) - vars(4)/taxa(5);
f5 = taxa(8)/taxa(7) - vars(5)/taxa(7);
f6 = taxa(10)/taxa(9) - vars(6)/taxa(9);
f7 = taxa(12)/taxa(11) - vars(7)/taxa(11);
f8 = -B*Ica - (vars(8) - Ca_base)/tau;
f9 = taxa(14)/taxa(13) - vars(9)/taxa(13);
f10 = -(gvazd*(vars(10)-vvaz) + cond2*(vars(10)-vars(11)))/(cmd);
f11 = -(gvazd2*(vars(11)-vvaz) + cond2*(vars(11)-vars(10)) + cond3*(vars(11)-vars(1)))/(cmd2);
f12 = -(gvazd*(vars(12)-vvaz) + cond2*(vars(12)-vars(13)) + cond2*(vars(12)-vars(1)))/(cmd);
f13 = -(gvazd*(vars(13)-vvaz) + cond2*(vars(13)-vars(12)))/(cmd);

f = [f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13]';
