function [dist1_appr, dist2] = dist_appr(feat1, feat2,w)

%% Initializing
n1 = size(feat1,1);
n2 = size(feat2,1);
%
dist1_appr = zeros(n1,n1);
dist2 = zeros(n2,n2);

%% Computing the approximated distances betwen selected feature points of img1
 for i=1:n1
    for j=i+1:n1
%        if i ==j, continue; end; 
        dist1_appr(i,j) = w*(floor(sqrt(sum((feat1(i,:)-feat1(j,:)).^2))/w)+(1/2));
        dist1_appr(j,i) = dist1_appr(i,j);
    end
 end

 
%% Computing the distances betwen selected feature points of img2
for i=1:n2
    for j=i+1:n2
%        if i ==j, continue; end; 
         dist2(i,j) = sqrt(sum((feat2(i,:)-feat2(j,:)).^2));
         dist2(j,i) = dist2(i,j);
    end
end