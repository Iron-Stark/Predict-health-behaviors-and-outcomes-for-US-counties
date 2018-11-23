function pred_labels=predict_labels(train_inputs,train_labels,test_inputs)

addpath('Analysis');
addpath('Discriminative');
addpath('Generative');
addpath('InstanceBased');
addpath('helper');
[train_inputs, test_inputs] = preprocess(train_inputs, test_inputs);
pred_labels_1 = GaussianProcessRegression(train_inputs, train_labels, test_inputs);
pred_labels_2 = RandomForest(train_inputs, train_labels, test_inputs);
pred_labels = 0.65.*pred_labels_1 + 0.35.*pred_labels_2;
pred_labels(:,1:2) = round(pred_labels(:,1:2));
pred_labels(:,4:7) = round(pred_labels(:,4:7));
pred_labels(:,9) = round(pred_labels(:,9));
%pred_labels=randn(size(test_inputs,1),size(train_labels,2));
%pred_labels = glm(train_inputs, train_labels, test_inputs);
end

