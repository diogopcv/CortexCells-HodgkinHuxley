function [taxa] = alfabetae(v) 

 tn = 0.4;
 
 in = 1/(1 + exp(-(40 + v)/3));
 
 tm = 0.05;
  
 im = 1/(1 + exp(-(40 + v)/3));
  
 th = 0.5;
  
 ih = 1/(1 + exp((v+45)/3));
 
 tm2 = 0.4;
 
 im2 = 1/(1 + exp(-(v +40)/7));
  
 taxa = [tn,in,tm,im,th,ih,tm2,im2];
 
 
 