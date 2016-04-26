
clc;
clear;
method = 1;% 1: ratio_cut 2:median_cut 3:average_cut
%{
im = im2double(imread('z1.jpg'));
[r c l]=size(im);
%
if r*c > 40000
    im = imresize(im,sqrt(40000/(r*c)));
    [r c l]=size(im);
end
L = mat(im,135);
answer = recursivepartition(L,0.005,zeros(r*c,1),(1:r*c)',method);
answer = answer./(max(answer));
answer = reshape(answer,[r,c]);
figure
subplot(3,2,1) 
imshow(im);
subplot(3,2,2) 
imshow(answer);






im = im2double(imread('z2.jpg'));
[r c l]=size(im);
%
if r*c > 40000
    im = imresize(im,sqrt(40000/(r*c)));
    [r c l]=size(im);
end
L = mat(im,135);
answer = recursivepartition(L,0.005,zeros(r*c,1),(1:r*c)',method);
answer = answer./(max(answer));
answer = reshape(answer,[r,c]);

subplot(3,2,3) 
imshow(im);
subplot(3,2,4) 
imshow(answer);



%}






im = im2double(imread('x.tif'));
[r c l]=size(im);
%
if r*c > 40000
    im = imresize(im,sqrt(40000/(r*c)));
    [r c l]=size(im);
end
L = mat(im,135);
answer = recursivepartition(L,0.005,zeros(r*c,1),(1:r*c)',method);
answer = answer./(max(answer));
answer = reshape(answer,[r,c]);
subplot(2,2,1) 
imshow(answer);

L = mat(im,95);
answer = recursivepartition(L,0.005,zeros(r*c,1),(1:r*c)',method);
answer = answer./(max(answer));
answer = reshape(answer,[r,c]);
subplot(2,2,2) 
imshow(answer);


L = mat2(im,135);
answer = recursivepartition(L,0.005,zeros(r*c,1),(1:r*c)',method);
answer = answer./(max(answer));
answer = reshape(answer,[r,c]);
subplot(2,2,3) 
imshow(answer);


L = mat2(im,95);
answer = recursivepartition(L,0.005,zeros(r*c,1),(1:r*c)',method);
answer = answer./(max(answer));
answer = reshape(answer,[r,c]);
subplot(2,2,4) 
imshow(answer);







% only one segmentation
%{
figure
subplot(1,2,1)
imshow(im);
L =mat(im,90);
x = solver(L);
[s1,s2] = ratio_cut(L,x);
display(size(s1));
display(size(s2))
im(s1(:,1)) = 0;
im(s2(:,1)) = 1;
subplot(1,2,2)
imshow(im,[]);
%}
 
%imshow(im);
 
% cannot come up with recurisve method, turn to author's website... find
% his code...
% for recursive partition, call partitionrecursive.m from Leo Gradey's
% code. I have modified it to fit my own function.

%L1 = mat(im,135)
%answer1 = recursivepartition(L11,0.005,zeros(r*c,1),(1:r*c)',method);

%L2 = mat(im,135)
%answer1 = recursivepartition(L11,0.005,zeros(r*c,1),(1:r*c)',method);

%L11 = mat(im,95);
%answer1 = recursivepartition(L11,0.0025,zeros(r*c,1),(1:r*c)',method);
%clear L11;

%L12 = mat(im,135);
%answer2 = recursivepartition(L12,0.0025,zeros(r*c,1),(1:r*c)',method);
%clear L12;
%{
L21 = mat2(im,95);
answer3 = recursivepartition(L21,0.0025,zeros(r*c,1),(1:r*c)',method);
clear L21;

L22 = mat2(im,135);
answer4 = recursivepartition(L22,0.0025,zeros(r*c,1),(1:r*c)',method);
clear L22;

L32 = mat3(im,95);
answer5 = recursivepartition(L32,0.0025,zeros(r*c,1),(1:r*c)',method);
clear L31;

L33 = mat3(im,135);
answer6 = recursivepartition(L33,0.0025,zeros(r*c,1),(1:r*c)',method);
clear L32;
%}
