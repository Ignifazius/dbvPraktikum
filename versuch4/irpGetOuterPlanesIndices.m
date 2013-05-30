%
% Determine indices of the normals belonging to the leftmost and rightmost 
% plane in PlaneNormals

function [first,last] = irpGetOuterPlanesIndices(PlaneNormals)

entries = find(PlaneNormals(:,1)~=0);
maximum = max(entries);
digits = ceil(log2(maximum));

for i=1:size(entries,1)
    entry_gray = dec2bin(entries(i),digits);
    entries_bin{i} = entry_gray(1);
    for n=2:digits
        dig1 = 0;
        if entries_bin{i}(n-1) == '1'
            dig1 = 1;
        end
        dig2 = 0;
        if entry_gray(n) == '1'
            dig2 = 1;
        end
 
        digit = bitxor(dig1,dig2);
        if digit
            tmp_bin = strcat(entries_bin{i},'1');
        else
            tmp_bin = strcat(entries_bin{i},'0');
        end
        
        entries_bin{i} = tmp_bin;
    end
end
        
entries_dec = bin2dec(entries_bin);

first = entries(find(entries_dec==min(entries_dec)));
last = entries(find(entries_dec==max(entries_dec)));
