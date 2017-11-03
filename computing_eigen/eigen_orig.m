function matches_points_orig = eigen_orig(cdata, iter) 

%%%To find unique elemnts of matrix, and find indices of them
affinity = cdata.affinity;

vector_size = size(affinity,1);
v = zeros(vector_size,1);
vold = ones(vector_size,1);
vold = vold/norm(vold);
tic

for t = 1:iter
    for i = 1:vector_size
        for j= 1:vector_size
            v(i) = affinity(i,j) * vold(i) ;
           
        end
    end
    vold = v./norm(v);
end
matches_points_orig = vold;
toc
