%% Param for feature extraction
fparam.bEstimateOrientation = false;% estimation orientation or single fixed orientation
fparam.nMaxOri = 3;                 % maximum num of dominant orientations
fparam.featureScale = 1.0;          % scaling factor for descriptor
fparam.patchSize = 31;              % patch size for descriptor
fparam.validMargin = 15;            % ignore the features in this margin area of image

fparam.featExt = { 'mser', 'haraff', 'hesaff', 'sift' }; % feature types possible
fparam.bFeatExtUse = [ 1 0 0 0 ]; % feature types used for *** feature detection! ***
%fparam.bEstimateOrientation = 0; % estimate dominant orientations or not

fparam.MSER_Ellipse_Scale = 2.0;                 % MSER 2.0
fparam.MSER_Maximum_Relative_Area = 0.010;        % MSER 0.01
fparam.MSER_Minimum_Size_Of_Output_Region = 30;  % MSER 30
fparam.MSER_Minimum_Margin = 40; % or 10          % MSER  3
fparam.MSER_Use_Relative_Margins = 0;            % MSER 
fparam.MSER_Vervose_Output = 0;                  % MSER 
fparam.HARAFF_harThres = 10000;%5000             % Harris-Affine
fparam.HESAFF_hesThres = 500;                    % Hessian-Affine

%% for initial matching
mparam.kNN = 4;                            % max num of NN matches for EACH feature %10
mparam.distThres = 0.0;                % threshold value of SIFT distance, when not using, set 0  
mparam.distRatio = 0.0;                % use Lowe's unambiguous NN; when not using, set 0
mparam.extrapolation_dist = 15.0;       % 15

mparam.bFeatExtUse = fparam.bFeatExtUse;   % feature types used for *** matching! ***
mparam.nMaxMatch = 3000;                   % max num of initial matches
mparam.thresholdScaleDiff = 10;            % eliminate matches with large scale diff %10
mparam.bMatchDistribution = 2;             % 1: best of max num 2: equally distrubuted for each feat type
mparam.bReflective = 0;                    % enable reflective matching
mparam.bFilterMatch = 1;                   % filter out overlapping matches (very similar, redundant matchs)
mparam.redundancy_thres = 3.0;             % criterion to filter out overlapping matches (pixel distance)
