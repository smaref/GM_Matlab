function [affinity_blocked_mapObj] = affinity_appr(cdata, sigma, w)

dist1_appr = cdata.dist1_appr;
dist2 = cdata.dist2;

dist1_unq = unique(triu(dist1_appr));
dist1_unq = dist1_unq(dist1_unq >w);

M = zeros(size(dist2,1), size(dist2,2));

%%%Computing the affinity matrix
for k = 1:size(dist1_unq) 
    for i = 1:size(dist2)
        for j = 1:size(dist2)
            if (abs(dist1_unq(k)-dist2(i,j))<3*sigma);
                M(i,j) = 4.5 - (((dist1_unq(k)-dist2(i,j)).^2))/(2*(sigma^2));
            else M(i,j) = 0;
            end
        end
    end
    affinity{k} = M;
end

affinity_blocked_mapObj = containers.Map(dist1_unq,affinity);
























