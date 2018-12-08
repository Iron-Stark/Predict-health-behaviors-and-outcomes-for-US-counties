addpath('Analysis');
addpath('Discriminative');
addpath('Generative');
addpath('InstanceBased');
addpath('helper');
addpath('GLM');
addpath('glmnet_matlab');
addpath('LARS');
addpath('lars_lasso/lars');
data = load('training_data.mat');
train_inputs = data.train_inputs;
train_labels = data.train_labels;
[trainInd, valInd, testInd] = divideblock(size(train_inputs,1), 0.7, 0.05, 0.25);
X_train = train_inputs(trainInd,:);
y_train = train_labels(trainInd,:);
X_test = train_inputs(testInd,:);
y_test = train_labels(testInd,:);
%data = [X_train; X_test];
%idxs = KM(data);
%error = zeros(5,6);
%for i=1:5
%    clust = idxs==i;
%    clust_train = X_train(clust(1:size(X_train,1)),:);
%    clust_train_labels = y_train(clust(1:size(y_train,1)),:);
%    clust_test = X_test(clust(size(X_train,1)+1:end),:);
%    clust_test_labels = y_test(clust(size(y_train,1)+1:end),:);
%    error(i,1) = error_metric(ridgeResidual(clust_train, clust_train_labels,clust_test),clust_test_labels)
%    error(i,2) = error_metric(glmGpr(clust_train, clust_train_labels,clust_test),clust_test_labels)
%    error(i,3) = error_metric(glmLARS(clust_train, clust_train_labels,clust_test), clust_test_labels)
%    error(i,4) = error_metric(glmSVM(clust_train, clust_train_labels,clust_test), clust_test_labels)
%    error(i,5) = error_metric(GPRResidual(clust_train, clust_train_labels,clust_test), clust_test_labels)
%    error(i,6) = error_metric(glmRidge(clust_train, clust_train_labels,clust_test), clust_test_labels)
%end
%disp(error);
%pred = glm(X_train, y_train, X_test);
%save('glm_pred.mat','pred');
tic;
predicted_labels = predict_labels(X_train, y_train, X_test);

%predicted_labels = 0.35*pred_labels_2+0.35*pred_labels_4+0.3*pred_labels_5;
disp(error_metric(predicted_labels, y_test));
toc;