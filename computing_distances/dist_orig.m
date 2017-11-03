function [dist1, dist2] = dist_orig(pts1,pts2)

%% Initializing
n1 = size(pts1,1);
n2 = size(pts2,1);

dist1 = zeros(n1,n1);
dist2 = zeros(n2,n2);


%% Computing the distances betwen every feature points of img1
for i=1:n1
    for j=i+1:n1
        dist1(i,j) = sqrt(sum((pts1(i,:)-pts1(j,:)).^2));
        dist1(j,i) = dist1(i,j);
    end
end

%% Computing the distances betwen every feature points of img2
for i=1:n2
    for j=i+1:n2
%        if i ==j, continue; end; 
         dist2(i,j) = sqrt(sum((pts2(i,:)-pts2(j,:)).^2));
         dist2(j,i) = dist2(i,j);
    end
end


