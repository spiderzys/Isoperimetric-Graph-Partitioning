function [s1,s2,iso_constant] = gap_cut(L,x)
y = conv(x,[1 -1]); %find the largest gap by convolution....
y(1) = 0; 
[~ ,iso_index] = max(y);
iso_index = max(iso_index,10);
x = sortrows([x,(1:size(x,1))'],1);
s1 = x(1:iso_index-1,2);
s2 = x(iso_index:size(x,1),2);
d = diag(L);
L = L-(diag(d));
d = full(d);
vol_v = sum(d);
L = L(s1,s1);
d = d(s1);
vol_s = sum(d);
vol_s = min(vol_s,vol_v-vol_s);
L = L-2*triu(L);
vol_inter = sum(sum(L,2));
iso_constant = vol_inter./vol_s;
%display(iso_index);
%display(iso_constant);


