function K=kernel(XTest,XTrain,sigma,type,d)
% Linear and Gaussian kernel
if type==0 
    K = XTest*XTrain';
elseif type ==1
    K=(XTest*XTrain'+1)^d;
else 
    X1 = sum(XTest.^2,2);
    X2 = sum(XTrain.^2,2)';
    K = bsxfun(@plus,X1,bsxfun(@plus,X2,-2*XTest*XTrain'));
    K = exp(-K/2/sigma);
end 
