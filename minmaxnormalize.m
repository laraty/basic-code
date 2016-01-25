function [Xnorm] = normalize(X)
[m,n] = size(X);
maxval = max(X);
minval = min(X);
% ============== Include your code here =======================
Xmin=repmat(minval,m,1);
Xmax=repmat(maxval,m,1);
Xnorm=(X-Xmin)./(Xmax-Xmin);

% =============================================================

end
