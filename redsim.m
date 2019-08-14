clear all
clc
age = 73; 
gender = 1;
bmi = 16.6762729700000;
systolic = 121;
diastolic = 67;
smoke = 0;
parents = 1;

risk = rednn(age,gender,bmi,systolic,diastolic,smoke,parents);
