
% handle missing values
function data_nan=nan_change(Data, method)
    data_nan=Data;
    n=size(Data,2);
    if method == 0
        % nan = 0
        data_nan(isnan(data_nan))=0;
    elseif method == 1
        % nan=column mean
        for i = 1:n
            data_nan(isnan(data_nan(:,i)),i) = nanmean(data_nan(:,i));
        end
    
