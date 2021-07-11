clear all%clear variables
close all%clear windows
clc%clear command window
%%%%%%%%%%%%%%%%%%%%
test_image=imread('t3.jpg');%reading test image
gray_test=rgb2gray(test_image);%converting rgb to hsi >> chosing i(intensity)
gray_test=imnoise(gray_test,'salt & pepper',0.001);
imshow(gray_test);figure
gray_test=medfilt2(gray_test);
imshow(gray_test);figure
[z21,z22,z23,z24]=Test(gray_test);
%% import first template
tp1=imread('two.jpg');
tp1=rgb2gray(tp1);
tp1=imresize(tp1,[420 900]);
tp11=imcrop(tp1,[0 0 200 100]);
tp12=imcrop(tp1,[715 320 170 80]);
tp13=imcrop(tp1,[270 120 250 120]);
tp11=imadjust(tp11);
tp12=imadjust(tp12);
tp13=imadjust(tp13);
imshow(tp11);figure
imshow(tp12);figure
imshow(tp13);figure
%% import second template
tp2=imread('five.jpg');
tp2=rgb2gray(tp2);
tp2=imresize(tp2,[420 900]);
imshow(tp2);figure
tp21=imcrop(tp2,[0 0 200 100]);
tp22=imcrop(tp2,[715 320 170 80]);
tp23=imcrop(tp2,[270 120 250 120]);
tp21=imadjust(tp21);
tp22=imadjust(tp22);
tp23=imadjust(tp23);
imshow(tp21);figure
imshow(tp22);figure
imshow(tp23);figure
%% import third template
tp3=imread('ten.jpg');
tp3=rgb2gray(tp3);
%imshow(tp1);figure
tp3=imresize(tp3,[420 900]);
tp31=imcrop(tp3,[0 0 200 100]);
tp32=imcrop(tp3,[715 320 170 80]);
tp33=imcrop(tp3,[270 120 250 120]);
tp31=imadjust(tp31);
tp32=imadjust(tp32);
tp33=imadjust(tp33);
imshow(tp31);figure
imshow(tp32);figure
imshow(tp33);figure
%% import fourth template
tp4=imread('fifty.jpg');
tp4=rgb2gray(tp4);
%imshow(tp1);figure
tp4=imresize(tp4,[420 900]);
tp41=imcrop(tp4,[0 0 200 100]);
tp42=imcrop(tp4,[715 320 170 80]);
tp43=imcrop(tp4,[270 120 250 120]);
tp41=imadjust(tp41);
tp42=imadjust(tp42);
tp43=imadjust(tp43);
imshow(tp41);figure
imshow(tp42);figure
imshow(tp43);figure
%% Calculation the correlation between test and first template
c11=normxcorr2(z21,tp11);
figure, surf(c11), shading flat
[ypeak, xpeak] = find(c11==max(c11(:)));
c11=max(c11(:))
c12=normxcorr2(z22,tp12);
figure, surf(c12), shading flat
[ypeak, xpeak] = find(c12==max(c12(:)));
c12=max(c12(:))
c13=normxcorr2(z23,tp13);
figure, surf(c13), shading flat
[ypeak, xpeak] = find(c13==max(c13(:)));
c13=max(c13(:))
av_c1=(c11+c12+c13)/3
%% Calculation the correlation between test and second template
c21=normxcorr2(z21,tp21);
figure, surf(c21), shading flat
[ypeak, xpeak] = find(c21==max(c21(:)));
c21=max(c21(:))
c22=normxcorr2(z22,tp22);
figure, surf(c22), shading flat
[ypeak, xpeak] = find(c22==max(c22(:)));
c22=max(c22(:))
c23=normxcorr2(z23,tp23);
figure, surf(c23), shading flat
[ypeak, xpeak] = find(c23==max(c23(:)));
c23=max(c23(:))
av_c2=(c22+c21+c23)/3
%% Calculation the correlation between test and third template
c31=normxcorr2(z21,tp31);
figure, surf(c31), shading flat
[ypeak, xpeak] = find(c31==max(c31(:)));
c31=max(c31(:))
c32=normxcorr2(z22,tp32);
figure, surf(c32), shading flat
[ypeak, xpeak] = find(c32==max(c32(:)));
c32=max(c32(:))
c33=normxcorr2(z23,tp33);
figure, surf(c33), shading flat
[ypeak, xpeak] = find(c33==max(c33(:)));
c33=max(c33(:))
av_c3=(c32+c31+c33)/3
%% Calculation the correlation between test and fourth template
c41=normxcorr2(z21,tp41);
figure, surf(c41), shading flat
[ypeak, xpeak] = find(c41==max(c41(:)));
c41=max(c41(:))
c42=normxcorr2(z22,tp42);
figure, surf(c42), shading flat
[ypeak, xpeak] = find(c42==max(c42(:)));
c42=max(c42(:))
c43=normxcorr2(z23,tp43);
figure, surf(c43), shading flat
[ypeak, xpeak] = find(c43==max(c43(:)));
c43=max(c43(:))
av_c4=(c42+c41+c43)/3
%% showing Result
if (av_c1>av_c2)&& (av_c1>av_c3)&&(av_c1>av_c4)
    disp("2000 Tomans !!");currency=2;
elseif (av_c2>av_c1)&& (av_c2>av_c3)&&(av_c2>av_c4)
    disp("5000 Tomans !!");currency=5;
elseif (av_c3>av_c1)&& (av_c3>av_c2)&&(av_c3>av_c4)
    disp("10000 Tomans !!");currency=10;
elseif (av_c4>av_c1)&& (av_c4>av_c3)&&(av_c4>av_c2)
    disp("50000 Tomans !!");currency=50;
end
%%%%%%Matching process for Fraud detection
if (currency==2)
    tp1=imcrop(tp1,[200 1 300 420]);
    z24=imcrop(z24,[200 1 300 420]);
    num_feature=matching(z24,tp1);
    if (num_feature(1,1)<25)
        disp('counterfeit Money!!!')
    else
        disp('No problem!!!')
    end
elseif (currency==5)
    tp2=imcrop(tp2,[200 1 300 420]);
    z24=imcrop(z24,[200 1 300 420]);
    num_feature=matching(z24,tp2);
    if (num_feature(1,1)<4)
        disp('counterfeit Money!!!')
    else
        disp('No problem!!!')
    end
elseif (currency==10)
    tp3=imcrop(tp3,[200 1 300 420]);
    z24=imcrop(z24,[200 1 300 420]);
    num_feature=matching(z24,tp3);
    if (num_feature(1,1)<30)
        disp('counterfeit Money!!!')
    else
        disp('No problem!!!')
    end
elseif (currency==50)
    tp4=imcrop(tp4,[400 1 300 420]);
    z24=imcrop(z24,[400 1 300 420]);
    num_feature=matching(z24,tp4);
    if (num_feature(1,1)<140)
        disp('counterfeit Money!!!')
    else
        disp('No problem!!!')
    end
end





