function [cost, grad] = computeCost(theta,input_num,hidden_num,label_num,X,y,lambda)
% making Theta1 and Theta2 matrices from the vector theta 
Theta1 = reshape(theta(1:hidden_num*(input_num+1)),hidden_num,(input_num+1));
Theta2 = reshape(theta((1+(hidden_num*(input_num+1))):end),label_num,(hidden_num+1));
[m,n] = size(X);

% convert the labels,1 to 10,2 to 01
I = eye(label_num);
Y = zeros(m,label_num);
for i = 1:m
  Y(i,:) = I(y(i),:);
end


% A1: m x (n+1)
A1=zeros(m,n+1);
A1(:,2:n+1)=X;
A1(:,1)=1;
% Z2: m x number of hidden nodes; Theta1: number of hidden nodes x (n+1)
Z2=A1*Theta1';
% A2: m x (number of hidden nodes+1)
A2=zeros(m,hidden_num+1);
A2(:,2:hidden_num+1)=sigmoid(Z2);
A2(:,1)=1;
% Z3: m x number of output nodes; Theta2: number of output nodes x (number of hidden nodes+1)
Z3=A2*Theta2';
% A3 and H: m x number of output nodes
A3=sigmoid(Z3);
H=A3;
% Cost function J
cost=(1/m)*sum(sum((-Y'* log(H) - (1 - Y)'* log(1-H))));


% Regularization 
reg = (lambda/(2*m))*(sum(sum(Theta1(:,2:end).^2,2))+sum(sum(Theta2(:,2:end).^2,2)));
cost = cost+reg;

% Backpropagation & Big deltas
delta3 = A3-Y;
delta2 = (delta3*Theta2.*gradient([ones(size(Z2,1),1) Z2]));
delta2 = delta2(:,2:end);
BigDelta1 = delta2'*A1;   
BigDelta2 = delta3'*A2;

% Regularized Gradient
Theta1_grad = BigDelta1./m+(lambda/m)*[zeros(size(Theta1,1),1) Theta1(:,2:end)];
Theta2_grad = BigDelta2./m+(lambda/m)*[zeros(size(Theta2,1),1) Theta2(:,2:end)];

% Making vector theta from Theta1 and Theta2 to return
grad = [Theta1_grad(:);Theta2_grad(:)];
end
