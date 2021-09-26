function [b] = runge4(vars,delta,in)

c1=zeros(9,1); c2=zeros(9,1); c3=zeros(9,1); c4=zeros(9,1);

c1 = funcao(vars,in);
c2 = funcao(vars+delta*c1/2,in);
c3 = funcao(vars+delta*c2/2,in);
c4 = funcao(vars+delta*c3,in);
b = vars + delta*(c1/6 + c2/3 + c3/3 + c4/6);