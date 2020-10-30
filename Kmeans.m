clear;
datafile = 'B.xls';
processedfile='C:\Users\Administrator\Desktop\data_processed.xls';
type=4; % Groups of discretization data
index=8;
typelabel={'A','B','C','D','E','F',}; 
rng('default'); % Fixed random seeds
[num,txt] = xlsread(datafile);
[rows,cols] = size(num); % Number of columns
disdata= cell(rows,cols+1); % Initialization
for i=1:cols
   [IDX,C] = kmeans(num(:,1),type,'start','cluster'); 
   [B,I] =sort(C); 
   for j=1:size(I,1)
       disdata(IDX==I(j),i)=cellstr([typelabel{1,i} num2str(j)]);
   end
end
M=[disdata];
disdata(:,cols+1)=txt(2:end,index);
xlswrite(processedfile,[txt(1,1:size(typelabel,2)),txt{1,index};disdata]);
disp('Data discretization is done£¡');
