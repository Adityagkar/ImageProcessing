clear all
clc
i1=imread('I1.jpg');
i2=imread('I2.jpg');
i3=imread('I3.jpg');
i4=imread('I4.jpg');

i1=rgb2gray(i1);
imshow(i1);
i2=rgb2gray(i2);
figure,imshow(i2);
i3=rgb2gray(i3);
figure,imshow(i3);
i4=rgb2gray(i4);
figure,imshow(i4);

points1=detectSURFFeatures(i1);
points2=detectSURFFeatures(i2);
points3=detectSURFFeatures(i3);
points4=detectSURFFeatures(i4);

[f1,vp1]=extractFeatures(i1,points1);
[f2,vp2]=extractFeatures(i2,points2);
[f3,vp3]=extractFeatures(i3,points3);
[f4,vp4]=extractFeatures(i4,points4);

indexPairs12=matchFeatures(f1,f2);
indexPairs13=matchFeatures(f1,f3);
indexPairs14=matchFeatures(f1,f4);

fcom1=ones(length(indexPairs12),64);
fcom2=ones(length(indexPairs12),64);

for i=1:length(indexPairs12)
fcom1(i,1:64)=f1(indexPairs12(i,1),:);
fcom2(i,1:64)=f2(indexPairs12(i,2),:);
end
e12=sqrt(sum(sum((fcom1-fcom2).^2)))


fcom1=ones(length(indexPairs13),64);
fcom3=ones(length(indexPairs13),64);

for i=1:length(indexPairs13)
fcom1(i,1:64)=f1(indexPairs13(i,1),:);
fcom3(i,1:64)=f2(indexPairs13(i,2),:);
end
e13=sqrt(sum(sum((fcom1-fcom3).^2)))


fcom1=ones(length(indexPairs14),64);
fcom4=ones(length(indexPairs14),64);

for i=1:length(indexPairs14)
fcom1(i,1:64)=f1(indexPairs14(i,1),:);
fcom4(i,1:64)=f2(indexPairs14(i,2),:);
end
e14=sqrt(sum(sum((fcom1-fcom4).^2)))

 

 
            
