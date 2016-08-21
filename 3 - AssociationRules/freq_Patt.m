function [FreqItemsets] = freq_Patt(transactions, minSup)

% Number of transactions in the dataset
M = size(transactions,1);
% Number of attributes in the dataset
N = size(transactions,2);

% Find frequent item sets of size one (list of all items with minSup)
T = [];
for i = 1:N
    S = sum(transactions(:,i))/M;
    if S >= minSup
        T = [T; i];
    end
end
FreqItemsets{1} = T;

%Find frequent item sets of size >=2 and from those identify rules with minConf

for steps = 2:N
    
    % If there aren't at least two items  with minSup terminate
    U = unique(T);
    if isempty(U) || size(U,1) == 1
        FreqItemsets(steps-1:end) = [];
        break
    end
    
    % Generate all combinations of items that are in frequent itemset
    Combinations = nchoosek(U',steps);
    TOld = T;
    T = [];
    
    for j = 1:size(Combinations,1)
            % Apriori rule: if any subset of items are not in frequent itemset do not
            % consider the superset (e.g., if {A, B} does not have minSup do not consider {A,B,*})
        if sum(ismember(nchoosek(Combinations(j,:),steps-1),TOld,'rows')) - steps+1>0
            
            % Calculate the support for the new itemset
            S = mean((sum(transactions(:,Combinations(j,:)),2)-steps)>=0);
            if S >= minSup
                T = [T; Combinations(j,:)];
            end
        end
    end
    
    % Store the freqent itemsets
    FreqItemsets{steps} = T;
end

% Get rid of unnecessary rows due to preallocation (helps with speed)
FreqItemsets(steps-1:end) = [];
end