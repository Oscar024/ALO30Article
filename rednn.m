function [ o ] = rednn( age,gender,bmi,systolic,diastolic,smoke,parents )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    bred = load('redoptimized.mat');
    net = bred.net;
    x= [age;gender;bmi;systolic;diastolic;smoke;parents];
    pn2 = normaliza(x,7);
    an2 = sim(net,pn2);
    o = desnormaliza(an2,1);
end

