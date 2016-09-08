function [index1, index2, z, y] = findClusters(clusters, labels, points, z)

index1 = 1;
index2 = 1;
mini = 99999;
minsize = 99999;
y=0;

% while mini == 99999
for i=1:size(clusters, 2)
	for j=1:size(clusters, 2)
		if (i!=j)
			for k=1:size(clusters{i}, 2)
				for l=1:size(clusters{j}, 2)
					len = dist(clusters{i}(k), clusters{j}(l));
					if (len < mini)
					% size(clusters{i}, 2)
					% size(clusters{j}, 2)
					if (size(union(clusters{i}, clusters{j}), 2) < minsize)

						% len
						% index1
						% index2
						minsize = size(union(clusters{i}, clusters{j}), 2);	
						mini = len;
						index1 = i;
						index2 = j;
						y=1;
					end
					end
				end
			end
		end	
	end
end
if mini==99999
	y=0;
end

z = minsize;
% end



end