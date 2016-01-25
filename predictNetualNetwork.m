function pred = predict(Theta1,Theta2,X, hidden_num)
[m,n ]= size(X);
A1=zeros(m,n+1);
A1(:,2:n+1)=X;
A1(:,1)=1;
Z2=A1*Theta1';
A2=zeros(m,hidden_num+1);
A2(:,2:hidden_num+1)=sigmoid(Z2);
A2(:,1)=1;
Z3=A2*Theta2';
P=sigmoid(Z3)>=0.5;
pred=P(:,2)+1;


end
