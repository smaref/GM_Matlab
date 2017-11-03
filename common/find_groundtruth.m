function ground_truth = find_groundtruth(cdata)
%%% just make sure sizes of feat1 n feat2 are same
%% read two images
img1 = cdata.view(1,1).img;
img2 = cdata.view(1,2).img;
% img1 = imread('chr1.jpg');
% img2 = imread('chr3.jpg');

% %% Find the features values of the GT points 
% gt = cdata.GT;
% feat1 = cdata.view(1,1).feat(:,1:2);
% feat2 = cdata.view(1,2).feat(:,1:2);
% pts1 = feat1(gt(:,1),:);
% pts2 = feat2(gt(:,2),:);

%% select the ground truth points manualy
% http://www.mathworks.com/help/images/select-matching-control-point-pairs.html#responsive_offcanvas
% select a point in images1 and find the mathing point in img2, and then
% the next point. After 4points can let the points in img2 be selected
% automatically and then change the position for accuracy.

% use this to load the selected extracted points and then modify the
% position manualy, and also add extra points if desire.
feat1 = cdata.view(1,1).feat(:,1:2);
feat2 = cdata.view(1,2).feat(:,1:2);
[pts1, pts2] = cpselect(img1, img2, feat1, feat2, 'Wait', true);

% Use this to select all the points without reloading existing points
%[pts1, pts2] = cpselect(img1, img2,'Wait', true);

%% Display the selected matching points on the images.
% Create a new image showing the two images side by side.
img3 = appendimages(img1,img2);

% Show a figure with lines joining the accepted matches.
figure('Position', [100 100 size(img3,2) size(img3,1)]);
colormap('gray');
imagesc(img3);
hold on;
cols1 = size(img1,2);
%%%%%Showing points on the image
plot(pts1(:,1),pts1(:,2),'s','MarkerEdgeColor','k',...
    'MarkerFaceColor', 'r','MarkerSize', 5);
plot(pts2(:,1)+cols1,pts2(:,2),'s','MarkerEdgeColor','k',...
    'MarkerFaceColor', 'y','MarkerSize', 5);
%%%%%%DRaw a line between matching points
for i = 1: size(pts1,1)
%     plot([pts1(i,2),pts2(i,2)+cols1], [pts1(i,1),pts2(i,1)], ...
%     '-','LineWidth',3,'MarkerSize',10,'color', 'k');
    plot([pts1(i,1),pts2(i,1)+cols1], [pts1(i,2),pts2(i,2)], ...
        '-','LineWidth',3,'MarkerSize',10,'color', 'k');  
end
hold off;

%% Find the indices of matching points from the extracted features
% construct the ground truth points
mat1 = knnsearch(cdata.view(1,1).feat(:,1:2), pts1, 'k', 1, ...
    'distance', 'euclidean');
mat2 = knnsearch(cdata.view(1,2).feat(:,1:2), pts2, 'k', 1, ...
    'distance', 'euclidean');
ground_truth = [mat1 mat2];

%%%% if the first row is not sorted uncomment this
% ground_truth = sortrows(ground_truth,1);

