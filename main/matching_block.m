%%%% garaph matching of approximated version using all the features

clear all; close all; clc;
init_pathGM;

%% params for ProgGM
setParams; % params for feature extraction and matching

pparam.bShow = 1;                              % visualize the process? 
pparam.k_neighbor1 = 5;                       % k_1 
pparam.k_neighbor2 = 5;                        % k_2
pparam.threshold_dissim = 1.0;                 % SIFT distance threshold for candidates
pparam.maxIterGM = 10;                         % max iteration of progression
pparam.max_candidates = mparam.nMaxMatch;      % num of max cand matches in progression

%% Initializing
w = 10;
sigma = 5;

%% set input and output data
iparam.bShow = false;  % show detected features and initial matches ( it can takes long... )  

fname1 = './data/chr1.jpg'; % reference image
fname2 = './data/chr3.jpg'; % test image

% fname1 = './data/desk1.png'; % reference image
% fname2 = './data/desk2.png'; % test image

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


%% Computing distances of all the assignments of image1 and image2 
features_1 = cdata.view(1,1).feat(:,1:2);
features_2 = cdata.view(1,2).feat(:,1:2);
[cdata.dist1_appr, cdata.dist2] = dist_appr(features_1, features_2, w);


%% Constructing affinity matrix
[cdata.affinity] = affinity_appr(cdata, sigma, w);


%% Power Iteration
iter =1;
score = eigen_appr(cdata, w, iter);


%% Making the candidate assignments
cand_matchlist = make_matchlist(features_1, features_2);


%% make groups
[cdata.group1, cdata.group2] = make_group12(cand_matchlist);


%% accuracy
% score = cdata.matches_points_app;
x = greedyMapping(score, cdata.group1, cdata.group2);
x = extrapolateMatchIndicator(cdata, cand_matchlist ,x,15)';



% cdata.GTbool = extrapolateGT(cdata, cand_matchlist , cdata.GT, 15)';
% accuracy = (X(:)'*cdata.GTbool(:))/sum(cdata.GTbool);
% 
% % show results
% figure;
% displayFeatureMatching(cdata,cand_matchlist, X, cdata.GTbool)


