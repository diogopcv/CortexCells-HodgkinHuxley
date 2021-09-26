function [taxa] = alfabetae(v) %v é o potencial da membrana  

 tn = 2;
 
 in = 1/(1 + exp(-(40 + v)/3));
 
 tm = 0.05;
  
 im = 1/(1 + exp(-(40 + v)/3));
  
 th = 0.5;
  
 ih = 1/(1 + exp((v+45)/3));
 
 tn2 = 200;
 
 in2 = 1/(1 + exp(-(v + 55)/10));
   
 taxa = [tn,in,tm,im,th,ih,tn2,in2];
 
 
 