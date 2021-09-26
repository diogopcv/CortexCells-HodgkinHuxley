function [taxa] = alfabetae(v,ca) %v � o potencial da membrana  

 tn = 2;
 
 in = 1/(1 + exp(-(40 + v)/3));
 
 tm = 0.05;
  
 im = 1/(1 + exp(-(40 + v)/3));
  
 th = 0.5;
  
 ih = 1/(1 + exp((v+45)/3));

 tm2 = 0.2;
 
 im2 = 1/(1 + exp(-(v +65)/2));
 
 th2 = 100;
 
 ih2 = 1/(1 + exp((v + 60)/4));
 
 tz = 2;
 
 iz = 1/(1 + exp(-(v + 25)/4));
   
 tp = 2;
 
 ip = ca/(ca + 4e-2); 
  
 taxa = [tn,in,tm,im,th,ih,tm2,im2,th2,ih2,tz,iz,tp,ip];