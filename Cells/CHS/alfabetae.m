function [taxa] = alfabetae(v,ca)   

 tn = 0.4;
 
 in = 1/(1 + exp(-(40 + v)/3));
 
 tm = 0.05;
 
 im = 1/(1 + exp(-(40 + v)/3));
  
 th = 0.5;
  
 ih = 1/(1 + exp((v+45)/3));
 
 tn2 = 20;
 
 in2 = 1/(1 + exp(-(v + 55)/10));
 
 tm2 = 0.4;
 
 im2 = 1/(1 + exp(-(v +40)/7));
 
 tz = 2.6;
 
 iz = 1/(1 + exp(-(v + 15)/4));
   
 tp = 2;

 ip = ca/(ca + 4e-2); 
  
 taxa = [tn,in,tm,im,th,ih,tn2,in2,tm2,im2,tz,iz,tp,ip];
 
 
 
