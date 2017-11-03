function [affinity] = affinity_orig(cdata,candidates,sigma)

dist1 = cdata.dist1;
dist2 = cdata.dist2;

%%%%Initialing
n = size(candidates,1);
affinity = zeros(n,n);

%%%Computing the affinity matrix

for i = 1:n
   for j = 1:n
        if (abs(dist1(candidates(i,1), candidates(j,1))-dist2(candidates(i,2), candidates(j,2)))<3*sigma);
            affinity(i,j) = 4.5 - ((dist1(candidates(i,1), candidates(j,1))-dist2(candidates(i,2), candidates(j,2))).^2)/(2*(sigma^2));
        else affinity(i,j) = 0;
        end
%         M(p,q)= dist1(candidates(i,1), candidates(j,1))-dist2(candidates(i,2), candidates(j,2));
                
    end
end





