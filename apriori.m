%Apriori Rules
clc,clear;
inputfile = 'apriori.txt';
outputfile='C:\Users\Administrator\Desktop\as.txt';
minSup = 0.001; % Setup the minimum Support
minConf = 0.05;% Setup the minimum Confidence
nRules = 1000000;% Setup the number of association rules
sortFlag = 1;
rulefile = 'C:\Users\Administrator\Desktop\rules2.txt'; 
[transactions,code] = trans2matrix(inputfile,outputfile,','); 
[Rules,FreqItemsets] = findRules(transactions, minSup, minConf, nRules, sortFlag, code, rulefile);
disp('Apriori Algorithm is called£¡');
%Matrix Transformation Function
%Find Rules Functionclear ;clc
load A.mat
for i=1:30
    k{i,:}=find(A(:,14)==i+0.9);
end

B=cell2mat(k)
a=A(B,:)
