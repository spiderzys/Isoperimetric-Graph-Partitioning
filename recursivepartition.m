%% the following code is from Leo Gradey's toolbox with necessary modification to fit my own function

function answer=recursivepartition(L,stop,answer,index,method) %here I change the input, laplacian matrix rather than weight matrix as
%my weight matrix is different from the authors'
%initially zeros(r*c,1),[1:r*c]'
if method == 1
    [s1,s2,iso_constant]=ratio_cut(L,solver(L));
elseif method == 2
    [s1,s2,iso_constant]=median_cut(L,solver(L));
else 
    [s1,s2,iso_constant]=average_cut(L,solver(L));
end
%{
if length(L) < 10;
    iso_constant = stop;
end
%}
%The following part is great, and I make use of his work and modify it...
if   iso_constant < stop
    tmpInd=find(answer>answer(index(1)));
    answer(tmpInd)=answer(tmpInd)+1; %Make room for new class
    answer(index(s2))=answer(index(s2))+1; %Mark new class
    L = L-diag(diag(L)); % reconstruct L
    if size(s1,1)>10
        answer=recursivepartition((L(s1,s1)-diag(sum(L(s1,s1),2))),stop,answer,index(s1),method);
    end
    if size(s2,1)>10
        answer=recursivepartition((L(s2,s2)-diag(sum(L(s2,s2),2))),stop,answer,index(s2),method);
    end
end

