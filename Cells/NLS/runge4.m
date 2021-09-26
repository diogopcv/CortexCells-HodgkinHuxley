function [b] = runge4(var,delta,in)

c1=zeros(5,1); c2=zeros(5,1); c3=zeros(5,1); c4=zeros(5,1);

c1 = funcao(var,in);
c2 = funcao(var+delta*c1/2,in);
c3 = funcao(var+delta*c2/2,in);
c4 = funcao(var+delta*c3,in);
b = var + delta*(c1/6 + c2/3 + c3/3 + c4/6);