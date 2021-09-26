function [f] = funcao(vars,inj)
area = 1.964e-5; % cm^2
vna = 45; %potencial sodio em mV
vk = -90; %potencial potassio em mV
vca = 150; %potencial Ca em mV
vvaz = -70; %potencial vazamento em mV
B = 10; % contsante covers�o Ica->[Ca] Molar/nC
tau = 50; % contsante de tempo [Ca] ms
Ca_base = 5e-5; % concentra��o base de Ca Molar

aread = 6.2832e-6;
diamd = 4e-4;
compd = 5e-3;

cm = 7.36*area; %capacitancia especifica em uF
gvaz = 0.237*area; %condutancia vazamento em mS
cond2 = (1.8520*pi*diamd^2)/(4*compd); % condutancia axial
gnamax = 321.1475*area; %maxima condutancia especifica sodio em mS
gkmax = 110.0976*area; %maxima condutancia especifica potassio em mS
gcamax = 1.2*area;%maxima condutancia especifica ca em mS
gadmax = 11.5533*area; %maxima condutancia especifica K-adaptativo em mS
gkmmax = 0.5*area; %maxima condutancia especifica Km em mS
gnapmax = 23.2*area; %maxima condutancia especifica Nap em mS
cmd = 7.36*aread;
gvazd = 0.237*aread;
%-------------------------------------------------------------------------

taxa(1,1:14) = alfabetae(vars(1),vars(8));
Ik = gkmax*((vars(2))^2)*(vars(1) - vk);
Ina = gnamax*((vars(3))^2)*(vars(4))*(vars(1) - vna);
Ikm = gkmmax*(vars(5))*(vars(1) - vk);
Inap = gnapmax*((vars(6))^2)*(vars(1) - vna);
Ica = gcamax*((vars(7))^2)*(vars(1) - vca);
Iad = gadmax*((vars(9))^2)*(vars(1) - vk); 
Ivaz = gvaz*(vars(1) - vvaz);
I2s = cond2*(vars(1) - vars(11));
I3s = cond2*(vars(1) - vars(12));

f1 = (-(Ik + Ina + Ikm + Inap + Ica + Iad + I2s + I3s + Ivaz) +inj)/(cm);
f2 = taxa(2)/taxa(1) - vars(2)/taxa(1);
f3 = taxa(4)/taxa(3) - vars(3)/taxa(3);
f4 = taxa(6)/taxa(5) - vars(4)/taxa(5);
f5 = taxa(8)/taxa(7) - vars(5)/taxa(7);
f6 = taxa(10)/taxa(9) - vars(6)/taxa(9);
f7 = taxa(12)/taxa(11) - vars(7)/taxa(11);
f8 = -B*Ica - (vars(8) - Ca_base)/tau;
f9 = taxa(14)/taxa(13) - vars(9)/taxa(13);
f10 = -(gvazd*(vars(10)-vvaz) + cond2*(vars(10)-vars(11)))/(cmd);
f11 = -(gvazd*(vars(11)-vvaz) + cond2*(vars(11)-vars(10)) + cond2*(vars(11)-vars(1)))/(cmd);
f12 = -(gvazd*(vars(12)-vvaz) + cond2*(vars(12)-vars(13)) + cond2*(vars(12)-vars(1)))/(cmd);
f13 = -(gvazd*(vars(13)-vvaz) + cond2*(vars(13)-vars(12)))/(cmd);

f = [f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13]';