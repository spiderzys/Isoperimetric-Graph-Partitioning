function [s1,s2,iso_constant] = ratio_cut(L,x)
%% sort the solution vector x and check in what cases we can minimize the isoperimetric constant

x = sortrows([x,(1:size(x,1))'],1);

d = diag(L);
L = L-(diag(d));
d = full(d);
L=L(x(:,2),x(:,2));
d=d(x(:,2));
vol_v = sum(d);
vol_s = cumsum(d);

%% as s and its complement can exchange, we only consider the smaller part.

half_index = find(vol_s > vol_v/2);
%display(half_index);
%display(length(x));
vol_s(half_index) = vol_v - vol_s(half_index-1);

%% the connectivity between two regions in each cut can be calculated by xTLx, but it is too time-comsuming.


L = L-2*triu(L); % vol_inter = the sum of degrees of selected node - 2 * the sum of degrees of internal nodes. 
vol_inter = cumsum(sum(L,2));
%display(size(vol_inter));
iso_constant = vol_inter./vol_s;
iso_constant(size(x,1),:)=[]; % cannot take the whole set... as in this case the constant will reach zero = =
[iso_constant,iso_index] = min(iso_constant);
%display(iso_index);
s1 = x(1:iso_index,2);
s2 = x((iso_index+1):size(x,1),2);















