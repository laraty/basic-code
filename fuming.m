function [idx,centroids,trace] = km(X,K,max_iters)
% Initialize values
[m n] = size(X);
centroids = rand(K,n);
idx = zeros(m,1);
old_idx = zeros(m,1);
trace = [];

% Start looping
for j=1:max_iters
    change = false;
	
	% Going throught the examples
    for i=1:m
        [minval,idx(i)] = min(sum((repmat(X(i,:),K,1)-centroids).^2,2));
        if ((idx(i)~=old_idx(i)) && (change == false))
            change = true;
        end
    end
	

% Write code to compute the new centroids of the clusters after 
% the points/examples have been relocated between clusters in the code above
% The centroid of the cluster i is centroids(i,:)
    for i=1:K
        centroids(i,:)=mean(X(idx==i,:),1);
    end
    

    
    %if no more changing groups 
    if (change == false)  
       break;
    end

    trace = [trace (sum(old_idx == idx) == m)];
    old_idx = idx;
 end

