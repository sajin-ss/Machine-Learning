% The algorithm

% The agglomerative hierarchical clustering algorithm is implemented as follows:

% 1. Based on the linkage criteria, set the distance function.	*****
% 2. Parse the input file and read in the items to cluster.	*****
% 3. Initialise the cluster array and set the appropriate item counts. *****
% 4. Calculate the Euclidean distances between item pairs.

% 5. For each item in the input:

	% 5.1 Add a leaf node that represents a root cluster.	*****
	% 5.2 Update the distance from root cluster to its neighbours.
	
% 6. While there are more than one cluster.	*****
	
	% 6.1 Find a pair of clusters with the minimum distance.	*****
	% 6.2 Merge them into a root cluster.	*****
	% 6.3 Update the distance from root cluster to its neighbours.

load data2

fprintf('Level 0 clusters : \n')
for i=1:size(labels, 2)
	clusters{i} = labels(i);
	clusters{i}
end

z=1;
mno = 1;
while(size(clusters,2) != 1)
% fprintf('Level %d clusters : \n', z)
% k++;
p = z;
	[index1, index2, z, y] = findClusters(clusters, labels, points, z);

	if (y==1)

		if (p!=z)
			fprintf('Level %d clusters : \n', mno)
			mno++;
		end

		union(clusters{index1}, clusters{index2})
		clusters{index1} = union(clusters{index1}, clusters{index2});
		clusters{index2} = union(clusters{index1}, clusters{index2});
		clusters = unique(clusters);




	else
		z++;
	end
end

