clc;
close all;
Img=imread('joker.png');
size_img=length(Img);
Img=double(Img);
%Kernel=[1 4 7 4 1;7 16 26 16 4;7 26 41 26 7;4 16 26 16 4;1 4 7 4 1]/273;
Kernel=[1 2 1; 2 4 2; 1 2 1]/ 16;
%Kernel=ones(5)/25;
size_K=length(Kernel);
N=size_K-1;
one=zeros(size_img+2*N,size_img+2*N);
two=zeros(size_img+2*N,size_img+2*N);
three=zeros(size_img+2*N,size_img+2*N);
one(N+1:size_img+N,N+1:size_img+N)=Img(:,:,1);
two(N+1:size_img+N,N+1:size_img+N)=Img(:,:,2);
three(N+1:size_img+N,N+1:size_img+N)=Img(:,:,3);
out1=zeros(size_img,size_img);
out2=zeros(size_img,size_img);
out3=zeros(size_img,size_img);
for i=1:512-N
    for j=1:512-N
        Temp1=dot(one(i:i+N,j:j+N),Kernel);
        out1(i,j)=sum(Temp1(:));
        Temp2=dot(two(i:i+N,j:j+N),Kernel);
        out2(i,j)=sum(Temp2(:));
        Temp3=dot(three(i:i+N,j:j+N),Kernel);
        out3(i,j)=sum(Temp3(:));
    end
end
o=zeros(size_img,size_img,3);
o(:,:,1)=out1(:,:);
o(:,:,2)=out2(:,:);
o(:,:,3)=out3(:,:);
o=uint8(o);
imwrite(o,"blurred_joker_image.png");




