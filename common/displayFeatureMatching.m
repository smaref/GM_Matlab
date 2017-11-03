function displayFeatureMatching(cdata, cand_matchlist,X, GTbool)
% GTbool = cdata.GTbool;
% imgInput = appendimages( cdata.view(1).img, cdata.view(2).img );
%  imgInput = appendimages( img1,img2 );
imgInput = appendimages( cdata.view(1,1).img, cdata.view(1,2).img );
imgInput = double(imgInput)./255;
imshow(rgb2gray(imgInput)); hold on;
iptsetpref('ImshowBorder','tight');


curMatchList = cand_matchlist;
idxFeat1 = curMatchList(:,1);
idxFeat2 = curMatchList(:,2);
feat1 = cdata.view(1).feat(idxFeat1,:);
feat2 = cdata.view(2).feat(idxFeat2,:);

feat2(:,1) = feat2(:,1) + size(cdata.view(1,1).img,2);

% % draw false matches
% for i = 1:length(X)
%     if X(i) && GTbool(i) == 0
%         col1 = 'k';
%         col2 = 'k';
%     else
%         continue;
%     end
%     plot([ feat1(i,1), feat2(i,1) ]...
%     ,[ feat1(i,2), feat2(i,2) ],...
%             '-','LineWidth',2,'MarkerSize',10,...
%             'color', col1);
% 
%     drawellipse2( feat1(i,1:5), 1, 'k',4);
%     drawellipse2( feat1(i,1:5), 1, col2,3);
%     drawellipse2( feat2(i,1:5) ,1, 'k',4);
%     drawellipse2( feat2(i,1:5) ,1, col2,3);                    
% end
% draw true matches
for i = 1:length(X)
    if X(i) && GTbool(i) == 1
        col1 = 'r';
        col2 = 'y';
    else
        continue;
    end
%     plot([ feat1(i,1), feat2(i,1) ]...
%     ,[ feat1(i,2), feat2(i,2) ],...
%            'LineWidth',3,'s','MarkerEdgeColor','k',...
%                 'MarkerFaceColor', col1,'MarkerSize', 5);
%     plot([ feat1(i,1), feat2(i,1) ]...
%     ,[ feat1(i,2), feat2(i,2) ],...
%             'LineWidth',3,'s','MarkerEdgeColor','k',...
%                 'MarkerFaceColor', col2,'MarkerSize', 5);
%  for i = 1: size(feat1,1)
% % plot([pts1(i,2),pts2(i,2)+cols1], [pts1(i,1),pts2(i,1)], '-','LineWidth',3,'MarkerSize',10,'color', 'k');
% plot([feat1(i,1),feat2(i,1)], [feat1(i,2),feat2(i,2)], '-','LineWidth',3,'MarkerSize',10,'color', col1);
% 
% end
% 
    plot([ feat1(i,1), feat2(i,1) ]...
    ,[ feat1(i,2), feat2(i,2) ],...
            'gs','LineWidth',3,'MarkerSize',10,...
            'MarkerEdgeColor', 'y','MarkerFaceColor', col1);
    plot([ feat1(i,1), feat2(i,1) ]...
    ,[ feat1(i,2), feat2(i,2) ],...
            '','LineWidth',2,'MarkerSize',5,...
            'MarkerEdgeColor', col1 ,'MarkerFaceColor', col2);
   plot([ feat1(i,1), feat2(i,1) ]...
    ,[ feat1(i,2), feat2(i,2) ],...
            '','LineWidth',3,'MarkerSize',5,...
            'MarkerEdgeColor', 'k','MarkerFaceColor', col1);
% 
%     drawellipse2( feat1(i,1:5), 1, 'k',5);
%     drawellipse2( feat1(i,1:5), 1, col2,4);
%     drawellipse2( feat2(i,1:5) ,1, 'k',5);
%     drawellipse2( feat2(i,1:5) ,1, col2,4);                    
end                     

hold off