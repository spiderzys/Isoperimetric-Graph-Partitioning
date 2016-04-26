function L = mat(im,B)
[r,c,l] = size(im);
im2 = padarray(im,[1 1],100);
weight = (zeros(r*c,4));
if l == 1
    for i = 1:r
        for j = 1:c
            t = i+(j-1)*r;
            %
            weight(t,1) = exp((-B)*(im2(i+1,j+1)-im2(i+1,j))^2);
            weight(t,2) = exp((-B)*(im2(i+1,j+1)-im2(i,j+1))^2);
            weight(t,3) = exp((-B)*(im2(i+1,j+1)-im2(i+1,j+2))^2);
            weight(t,4) = exp((-B)*(im2(i+1,j+1)-im2(i+2,j+1))^2);
            %{
        weight(t,1) = abs(im2(i+1,j+1)-im2(i+1,j));
        weight(t,2) = abs(im2(i+1,j+1)-im2(i,j+1));
        weight(t,3) = abs(im2(i+1,j+1)-im2(i+1,j+2));
        weight(t,4) = abs(im2(i+1,j+1)-im2(i+2,j+1));
            %}
        end
    end
else
    for i = 1:r
        for j = 1:c
            t = i+(j-1)*r;
            %
            weight(t,1) = exp((-B)*((im2(i+1,j+1,1)-im2(i+1,j,1))^2+(im2(i+1,j+1,2)-im2(i+1,j,2))^2+(im2(i+1,j+1,3)-im2(i+1,j,3))^2));
            weight(t,2) = exp((-B)*((im2(i+1,j+1,1)-im2(i,j+1,1))^2+(im2(i+1,j+1,2)-im2(i,j+1,2))^2+(im2(i+1,j+1,3)-im2(i,j+1,3))^2));
            weight(t,3) = exp((-B)*((im2(i+1,j+1,1)-im2(i+1,j+2,1))^2+(im2(i+1,j+1,2)-im2(i+1,j+2,2))^2+(im2(i+1,j+1,3)-im2(i+1,j+2,3))^2));
            weight(t,4) = exp((-B)*((im2(i+1,j+1,1)-im2(i+2,j+1,1))^2+(im2(i+1,j+1,2)-im2(i+2,j+1,2))^2+(im2(i+1,j+1,3)-im2(i+2,j+1,3))^2));
        end
    end
end

%compress the size of matrix to avoid "out of memory".

%im=abs(rand(10,10))
%im = im./20;

%im2 = padarray(im,[1 1],100); %extension the edge of the matrix
%weight = (zeros(r*c,4));


%weight(find(weight == 1)) = 0;
%imshow(im,[]);
%}
%display(weight);
W = sparse(r*c,r*c);
%L = zeros(r*c,r*c);
for i = 1:r*c
    % for j= i+1:r*c
    if(mod(i,r) ~= 0)
        W(i,i+1) = weight(i,4);
        W(i+1,i) = W(i,i+1);
    end
    if(ceil(i/r)~=c)
        W(i,i+r) = weight(i,3);
        W(i+r,i) =W(i,i+r);
    end
end
L = -W+diag(sum(W,2));
%display(size(L));




