%close all;
b=imread('Line.jpg');
se = strel('disk',4);
c=imdilate(b,se);
imshow(c);
[L,num] = bwlabel(c);
for i=1:num
  [r,c] = find(L==i);
   x=b(min(r):max(r),min(c):max(c));
   figure(1);
   subplot(1,2,1);
   imshow(x);
   CharacterSegmentation(x);
   pause;
end