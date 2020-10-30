function [ output,code] = trans2matrix( inputfile,outputfile,splitter )
if nargin<3
   splitter=' '; 
end
%% Load in the file and get the encoding rules
code={};
fid= fopen(inputfile);
tline = fgetl(fid);
lines=0;
while ischar(tline)
    lines=lines+1; % Record the number of rows
    tline = deblank(tline);
    tline = regexp(tline,splitter,'split');
    code=[code tline]; 
    code = unique(code); % Unique rows
% disp(code)
    tline = fgetl(fid);
end
disp('Coding rule is:')
disp(num2str(1:size(code,2)))
disp( code);
fclose(fid); % Close file
%% Load the file and convert the original data according to the encoding rules
itemsnum= size(code,2);
output=zeros(lines,itemsnum);
fid= fopen(inputfile);
tline = fgetl(fid);
lines=0;
while ischar(tline)
    lines=lines+1; % Record the number of rows
    tline = deblank(tline);
    tline = regexp(tline,splitter,'split');
    [C,icode,itline] = intersect(code,tline);
    output(lines,icode')=1;
    %disp(output(lines,:))
    tline = fgetl(fid);
end
fclose(fid);
%% Write the converted matrix to the file
fid = fopen(outputfile, 'w');
for i=1:lines
   fprintf(fid,'%s\n',num2str(output(i,:))); 
end
fclose(fid);
end