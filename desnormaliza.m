function [ o ] = desnormaliza( dato, io )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if io == 1
p(1,:) = (dato(1,:)*100); 
else
p(1,:) = (dato(1,:)*100);
p(2,:) = (dato(2,:)*10);
p(3,:) = (dato(3,:)*1000);
p(4,:) = (dato(4,:)*1000);
p(5,:) = (dato(5,:)*1000);
p(6,:) = (dato(6,:)*10);
p(7,:) = (dato(7,:)*10);        
end

o=p;


end

