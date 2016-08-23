function [length] = dist(a, b)

load data2

pt1 = find(labels==a);
pt2 = find(labels==b);

[p] = points(pt1, :);
[q] = points(pt2, :);

length = abs( (p(1) - q(1))^2 + (p(2) - q(2))^2 );
end