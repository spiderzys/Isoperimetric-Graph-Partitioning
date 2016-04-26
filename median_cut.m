function [s1,s2,iso_constant] = median_cut(L,x)
xmin = min(x);
xmax = max(x);
x = (x-xmin)./(xmax-xmin); %noamalize the x for im2bw thresholding
d = diag(L);
mid = median(x);
s1 = find(x<=mid);
s2 = find(x>mid);
x = (im2bw(x,mid));
iso_constant = (x'*L*x)/(x'*d);



