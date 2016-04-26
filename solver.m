function x = solver(L)
%compress the size of matrix to avoid "out of memory".
warning off;
[v0_weight,v0_index] = max(diag(L));
L(v0_index,:)=[];
L(:,v0_index)=[];
d0 = diag(L);
%display(v0_index);
x0 = full(L\d0); 
x= [x0(1:v0_index-1);[0];x0(v0_index:size(x0))];




