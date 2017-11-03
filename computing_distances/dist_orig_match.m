function [dist1, dist2] = dist_orig_match(cdata, cand_matchlist)

view1 = cdata.view(1, 1);
view2 = cdata.view(1, 2); 

matches = cand_matchlist;
pts1 = view1.feat(matches(:,1), 1:2);
pts2 = view2.feat(matches(:,2), 1:2);

n1 = size(pts1,1);
n2 = size(pts2,1);


dist1 = zeros(n1,n1);
dist2 = zeros(n2,n2);

for i=1:n1
    for j=i+1:n1
%         if i ==j, continue; end;            
%         else
        dist1(i,j) = sqrt(sum((pts1(i,:)-pts1(j,:)).^2));
       
        dist1(j,i) = dist1(i,j);
        
%         end
    end
end


for i=1:n2
    for j=i+1:n2
%         if i ==j, continue; end; 
%         else
         dist2(i,j) = sqrt(sum((pts2(i,:)-pts2(j,:)).^2));
         dist2(j,i) = dist2(i,j);
%         end

    end
end


