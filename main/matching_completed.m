%% 
%%% Graph Matching of completed matches version using initial matches plus
%%% additional assignments inorder to use the approximated technique

clear all; close all; clc;
init_pathGM;

%% params for ProgGM
setParams; % params for feature extraction and matching

pparam.bShow = 1;                              % visualize the process? 
pparam.k_neighbor1 = 25;                       % k_1 
pparam.k_neighbor2 = 5;                        % k_2
pparam.threshold_dissim = 1.0;                 % SIFT distance threshold for candidates
pparam.maxIterGM = 10;                         % max iteration of progression
pparam.max_candidates = mparam.nMaxMatch;      % num of max cand matches in progression


%% Initializing
w = 10;
sigma = 5;

%% set input and output data
iparam.bShow = false;  % show detected features and initial matches ( it can takes long... )  

% fname1 = './data/build1/10.jpg'; % reference image
% fname2 = './data/build1/11.jpg'; % test image

% fname1 = './data/extra/e119.jpg'; % reference image
% fname2 = './data/extra/e120.jpg'; % test image

% fname1 = './data/build2/7.jpg'; % reference image
% fname2 = './data/build2/8.jpg'; % test image

fname1 = './data/extra/im037.jpg'; % reference image
fname2 = './data/extra/im038.jpg'; % test image

% fname1 = './data/desk1.png'; % reference image
% fname2 = './data/desk2.png'; % test image

% fname1 = './data/bike1.png'; % reference image
% fname2 = './data/bike2.png'; % test image

% fname1 = './data/table1.png'; % reference image
% fname1 = './data/table2.png'; % test image
% fname1 = './data/table3.png'; % test image

iparam.view(1).fileName = 'ref';
iparam.view(1).filePathName = fname1;
iparam.view(2).fileName = 'test';
iparam.view(2).filePathName = fname2;
iparam.bPair = 1;
iparam.nView = 2;

%% initial matching
cdata = initialmatch_main( iparam, fparam, mparam, true ); % initial matching with a bounding box
matches = cell2mat({ cdata.matchInfo.match }');




%% Find ground truth
%cdata.GT = find_groundtruth(cdata);

%%% load grounf truth
%load('GT/gt_build2.mat');
load('GT/gt_pillow.mat');
cdata.GT = ground_truth;


%% Find new feature points according to initial match points
% Find the unique entries of initial matches points
% Select only the unique mathches features values
feat1 = cdata.view(1, 1).feat(:,1:2);
matches1_unq = unique(matches(:,1));
new_features_1 = feat1(matches1_unq,:);

feat2 = cdata.view(1, 2).feat(:,1:2);
matches2_unq = unique(matches(:,2));
new_features_2 = feat2(matches2_unq,:);

%% Computing distances of all the assignments of image1 and image2 
[cdata.dist1_appr, cdata.dist2] = dist_appr(new_features_1, new_features_2, w); 


%% Constructing affinity matrix
[cdata.affinity] = affinity_appr(cdata, w, sigma);


%% Power Iteration
iter =1;
score = eigen_appr(cdata, w, iter); 


%% Making the candidate assignments
cand_matchlist = make_matchlist(new_features_1, new_features_2);


%% make groups
[cdata.group1, cdata.group2] = make_group12(cand_matchlist);



%% accuracy
%score = cdata.matches_points_comp;
X = greedyMapping(score, cdata.group1, cdata.group2);

cdata.GTbool = extrapolateGT(cdata, cand_matchlist , cdata.GT, 15)';
X= extrapolateMatchIndicator(cdata, cand_matchlist ,X,15)';
accuracy = (X(:)'*cdata.GTbool(:))/sum(cdata.GTbool);

%% show results
figure;
displayFeatureMatching(cdata,cand_matchlist, X, cdata.GTbool)






