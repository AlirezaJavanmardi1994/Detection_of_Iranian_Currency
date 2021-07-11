function [z21,z22,z23,z24]=Test(c2)
eg=edge(c2,'canny',0.1);
imshow(c2);figure
imshow(eg);figure
se=strel('disk',5);
eg=imclose(eg,se);
imshow(eg);figure
eg2=imfill(eg,'holes');
imshow(eg2);figure
eg2=bwareaopen(eg2,50000);
imshow(eg2);figure
label=bwlabel(eg2);
r=regionprops(label,'Orientation');
angle=r.Orientation;
a=imrotate(eg2,(-1)*angle);
imshow(a);figure;
z=regionprops(a,'BoundingBox');
z=z.BoundingBox;
c2=imrotate(c2,(-1)*angle);
z2=imcrop(c2,[z(1)+50 z(2)+10 z(3)-80 z(4)-80]);
imshow(z2);figure
c2=imresize(z2,[420 900]);
z24=c2;
imshow(c2);figure
z21=imcrop(c2,[10 0 170 90]);
z22=imcrop(c2,[715 320 170 80]);
z23=imcrop(c2,[300 150 220 100])
z21=imgaussfilt(z21,.5);
z22=imgaussfilt(z22,.5);
z23=imgaussfilt(z23,.5);
z21=imadjust(z21);
z22=imadjust(z22);
z23=imadjust(z23);
imshow(z21);figure
imshow(z22);figure
imshow(z23);figure
end

