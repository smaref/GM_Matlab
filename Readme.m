% change these parameters for controling the number of extracted features
% in setParams.m file. fparam.MSER_Ellipse_Scale = 2.0;                 %
% MSER number of features1/features2 reduce the output extracted feaures
% fparam.MSER_Maximum_Relative_Area = 0.01;        % MSER
% fparam.MSER_Minimum_Size_Of_Output_Region = 30;  % MSER
% fparam.MSER_Minimum_Margin = 3; % or 10          % MSER reducung both
% interest and normalized extracted features and set two imgages features
% to a same number increase both to reduce the numbers and decrease the
% values for getting higher features.


% to recduce the number of matches decrease: 
% mparam.kNN = 10;                            % max num of NN matches for EACH feature
% to reduce the matching points by reducing:
% mparam.thresholdScaleDiff = 30;            % eliminate matches with large scale diff
