function CharacterSegmentation(im)

%clc; clear all; close all;
%% Read Image
%im=imread('w2.j2c');
%im =imcomplement(im);
%% Show image
%figure(1)
%imshow(im);
%title('INPUT IMAGE WITH NOISE')
%% Convert to gray scale
if size(im,3)==3 % RGB image
    im=rgb2gray(im);
end
%% Convert to binary image
threshold = graythresh(im);
im =im2bw(im,threshold);

%% Remove all object containing fewer than 30 pixels
im = bwareaopen(im,20);

%% Show image binary image
%figure(2)
%imshow(~im);
%title('INPUT IMAGE WITHOUT NOISE');


%% Label connected components
[L Ne]=bwlabel(im);
Ne
%% Measure properties of image regions
%propied=regionprops(L,'BoundingBox');
%hold on

%% Plot Bounding Box
%for n=1:size(propied,1)
%   rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',1)
%end
%hold off

%close all;

%figure(3);
%subplot(1,2,1);
%imshow(L)

%% Objects extraction

%for n=1:Ne
%    [r,c] = find(L==n);
%    n1=im(min(r):max(r),min(c):max(c));
%    subplot(1,2,2);
%    imshow(~n1);
    %pause(2);
%end

%% Extending the Bounding Box
for n = 1:Ne
    [r,c] = find(L == n);
    if size(r,1) ~= 0
        C =L(1:size(L,1),min(c):max(c));
        U = unique(C);
        if size(U,1)>2
            for i = 1:size(U,1);
                if U(i) ~= 0
                    val = U(i);
                    [r1,c1] = find(L == val);
                    if val > n
                        %[r1,c1] = find(L == val);
                        for j = 1:size(r1,1)
                            L(r1(j),c1(j)) = n;
                        end
                    else                      
                        for j = 1:size(r1,1)
                            if c1(j)>=min(c)
                                L(r1(j),c1(j)) = n;
                            end
                        end
                    end
                    
                end
            end
        end
    end
end


%figure(4);
%imshow(~im);
%propied=regionprops(L,'BoundingBox');
%hold on;

%for n=1:size(propied,1)
%    if propied(n).BoundingBox(3) ~= 0 || propied(n).BoundingBox(4)
%    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',1)
%    end
%end
%hold off
%pause;



%% Objects extraction
for n=1:Ne
    [r,c] = find(L==n);
    if size(r,1) ~= 0
        %n1=im(min(r):max(r),min(c):max(c));
        n1 = zeros(max(r) - min(r), max(c) - min(c));
        r = r - min(r) +1;
        c = c - min(c) +1;
        for i = 1:size(r,1)
            n1(r(i),c(i)) = n; 
        end
        
        %figure(1);
        subplot(1,2,2);
        imshow(~n1);
        pause(1);
    end
end
end