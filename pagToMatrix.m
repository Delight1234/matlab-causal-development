function [pdag] = pagToMatrix(fileName,nodes)
% transfer the Tetrad result pag to matrix form
%
% Input:
% fileName: the name of file recording resultG
% nodes: the number of variables in resultG
%
% Output:
% pdag: matrix form transfered from Tetrad pag
%       pdag(i,j) = 1 means i *-o j
%       pdag(i,j) = 2 means i *-> j
%       pdag(i,j) = 3 means i *-- j

fid = fopen(fileName, 'r');

if fid==-1
    pdag = -1;
    return;
end

pdag = zeros(nodes);
nodesIndex = [];

while 1
    
    l = fgetl(fid);   
    if ~ischar(l), 
    	break, 
    end  
    if strcmp(l, ''), 
    	continue, 
    end
    if ~isempty(strfind(l, '-'))           
        if ~isempty(strfind(l, '-->'))
            start_num1 = strfind(l,'X');
            end_num1 = strfind(l,'-');
            num1 = str2num(l(start_num1(1)+1:end_num1-1));
            num2 = str2num(l(start_num1(2)+1:end));              
            pdag(num1, num2) = 2;
            pdag(num2, num1) = 3;
        elseif ~isempty(strfind(l, '<--'))
            start_num1 = strfind(l,'X');
            end_num1 = strfind(l,'-');
            num1 = str2num(l(start_num1(1)+1:end_num1-1));
            num2 = str2num(l(start_num1(2)+1:end));              
            pdag(num1, num2) = 3;
            pdag(num2, num1) = 2;    
        elseif ~isempty(strfind(l, '---'))
            start_num1 = strfind(l,'X');
            end_num1 = strfind(l,'-');
            num1 = str2num(l(start_num1(1)+1:end_num1-1));
            num2 = str2num(l(start_num1(2)+1:end));
            pdag(num1, num2) = 3;
            pdag(num2, num1) = 3; 
        elseif ~isempty(strfind(l, 'o->'))
            start_num1 = strfind(l,'X');
            end_num1 = strfind(l,'o');
            num1 = str2num(l(start_num1(1)+1:end_num1-1));
            num2 = str2num(l(start_num1(2)+1:end));
            pdag(num1, num2) = 2;
            pdag(num2, num1) = 1;
        elseif ~isempty(strfind(l, '<-o'))
            start_num1 = strfind(l,'X');
            end_num1 = strfind(l,'o');
            num1 = str2num(l(start_num1(1)+1:end_num1-1));
            num2 = str2num(l(start_num1(2)+1:end));
            pdag(num1, num2) = 1;
            pdag(num2, num1) = 2;                
        elseif ~isempty(strfind(l, 'o-o'))
            start_num1 = strfind(l,'X');
            end_num1 = strfind(l,'o');
            num1 = str2num(l(start_num1(1)+1:end_num1-1));
            num2 = str2num(l(start_num1(2)+1:end));
            pdag(num1, num2) = 1;
            pdag(num2, num1) = 1;    
                         
         elseif ~isempty(strfind(l, '<->'))
            start_num1 = strfind(l,'X');
            end_num1 = strfind(l,'<');
            num1 = str2num(l(start_num1(1)+1:end_num1-1));
            num2 = str2num(l(start_num1(2)+1:end));
            pdag(num1, num2) = 2;
            pdag(num2, num1) = 2;             
        end
        if ismember(num1,nodesIndex)==0
           nodesIndex = [nodesIndex,num1];
        end
        if ismember(num2,nodesIndex)==0
           nodesIndex = [nodesIndex,num2];
        end 
        
    end
end

if length(nodesIndex)~=nodes
    fprintf('There is at least one node isolated');  
end

fclose(fid);