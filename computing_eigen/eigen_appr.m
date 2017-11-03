function [vold] = eigen_appr(cdata, w, iter) 

dist1_appr = cdata.dist1_appr;
dist2 = cdata.dist2;
affinity = cdata.affinity;

dist1_unq = unique(triu(dist1_appr));
dist1_unq = dist1_unq(dist1_unq >w);

block_size = size(dist2,1);
vector_size = size(dist1_appr,1)*size(dist2,1);

v = zeros(vector_size,1);
vold = ones(vector_size,1);
vold = vold/norm(vold);

for t = 1 : iter
    for i = 1: size(dist1_unq,1)
        [row, col] = find((cdata.dist1_appr)==dist1_unq(i));
        for j = 1: size(row,1)
            v(row(j)*block_size-block_size+1:row(j)*block_size) = ...
            affinity(dist1_unq(i)) * vold(col(j)*block_size-block_size+1:col(j)*block_size) + ...
            v(row(j)*block_size-block_size+1:row(j)*block_size);
        end
    end
    vold = v./norm(v);
end