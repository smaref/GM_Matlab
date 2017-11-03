function [complete_matches] = complete_initialmatches(matches)
 
% matches = cdata.matches;
 mat1 = unique(matches(:,1));
 mat2 = unique(matches(:,2));
 count=0;
 for i= 1:size(mat1)
      for j= 1:size(mat2)
          count = count+1;
          complete_matches(count,1) = mat1(i);
          complete_matches(count,2) = mat2(j);
      end
 end