%% PCA for 10 images
clear all;
clc;
X=zeros(10,59);
Y=rand(10,200);
for i=1:10
    
    j=imread(['C:\Users\Aditya\Documents\MATLAB\pca\',int2str(i),'.jpg']);
    j=rgb2gray(j);
    X(i,:)=extractLBPFeatures(j);
end

m=mean(X,1);
mm=repmat(m,10,1);

Xm=X-mm;

c=cov(Xm);

[ev d]=eig(c);

ev=(ev');
es=ev*(Xm');

% PCA for another image

 j=imread('C:\Users\Aditya\Documents\MATLAB\pca\11.jpg');
    j=rgb2gray(j);
    Y=extractLBPFeatures(j);
    
  
Ym=Y-m;
esi=ev*(Ym');%because ev gives features across rows whereas we need across coloumns

%now comparison of their features
for i=1:10
    eudistance(1,i)=sqrt(sum((es(:,i)-esi).^2));
end


t=min(eudistance);

for i=1:10
    if eudistance(1,i)==t
        l=i;
    end
end







