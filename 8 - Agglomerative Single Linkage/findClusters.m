function [index1, index2] = findClusters(clusters, labels, points)

index1 = 1;
index2 = 1;
mini = 99999;

for i=1:size(clusters, 2)
	for j=1:size(clusters, 2)
		if (i!=j)
			for k=1:size(clusters{i}, 2)
				for l=1:size(clusters{j}, 2)
					len = dist(clusters{i}(k), clusters{j}(l));
					if (len < mini)
						% len
						% index1
						% index2

						mini = len;
						index1 = i;
						index2 = j;
					end
				end
			end
		end	
	end
end

end