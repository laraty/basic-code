[m,n] = size(X);

% Random sampling
train_pc = 0.6;
TrainSize = floor(train_pc*m); 
train_ind = [randsample(1:sum(y==0),floor(train_pc*sum(y==0))),sum(y==0)+randsample(1:sum(y==1),floor(train_pc*sum(y==1)))];
yTrain = y(ismember(1:m,train_ind),:);
yTest = y(~ismember(1:m,train_ind),:);
XTrain = X(ismember(1:m,train_ind),:);
XTest = X(~ismember(1:m,train_ind),:);

% 
