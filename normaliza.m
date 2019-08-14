function [ o ] = normaliza( p ,io)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if io == 1
pn(1,:) = (p(1,:)/100); 
else
pn(1,:) = (p(1,:)/100);
pn(2,:) = (p(2,:)/10);
pn(3,:) = (p(3,:)/1000);
pn(4,:) = (p(4,:)/1000);
pn(5,:) = (p(5,:)/1000);
pn(6,:) = (p(6,:)/10);
pn(7,:) = (p(7,:)/10);        
end

o=pn;
end

