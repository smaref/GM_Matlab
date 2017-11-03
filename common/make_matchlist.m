function cand_matchlist = make_matchlist(feat1, feat2)

nNodes = length(feat1);
nLabels = length(feat2);

labels = zeros(1, nNodes*nLabels);
nodes = zeros(1, nNodes*nLabels);

el = 0;

for node =  1:nNodes
    for label = 1:nLabels
   
       el = el + 1;
       
       nodes(el)  = node;
       labels(el) = label;
        
    end
end

nodes = nodes';
labels = labels';
cand_matchlist(:,1) = nodes; 
cand_matchlist(:,2) = labels;