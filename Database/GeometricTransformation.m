close all;
clc;
clear all;

prompt = 'Enter the character number:';
CharacterNumber = input(prompt);
%filename = strcat(int2str(CharacterNumber),'.j2c');

%prompt = 'Enter the file name:';
%filename = input(prompt,'s');

for i = 1:10

    CharacterNumber = i;

for j = 1:5

    if j == 1
        filename = strcat(int2str(CharacterNumber),'.j2c');
    else
        filename = strcat(int2str(CharacterNumber),'.',int2str(j-1),'.j2c');
    end
    
   
im = imread(filename);
im = imresize(im, [40 40]);
im = rgb2gray(im);
cim = imcomplement(im);
tform = maketform('affine', [1 0 0;0 1 0;0 0 1]);
tim = imtransform(cim, tform);
im1 = imresize(imcomplement(tim), [40 40]);
X = im1(:)';
%colormap('gray');
%imagesc(im, [0 255]);

tform = maketform('affine', [1 0 0;-0.2 1 0;0 0 1]);
tim = imtransform(cim, tform);
im2 = imresize(imcomplement(tim), [40 40]);
X = [X; im2(:)'];
%colormap('gray');
%imagesc(im, [0 255]);

tform = maketform('affine', [1 0 0;0.2 1 0;0 0 1]);
tim = imtransform(cim, tform);
im3 = imresize(imcomplement(tim), [40 40]);
X = [X; im3(:)'];

tform = maketform('affine', [1 0.2 0;0 1 0;0 0 1]);
tim = imtransform(cim, tform);
im4 = imresize(imcomplement(tim), [40 40]);
X = [X; im4(:)'];

tform = maketform('affine', [1 -0.2 0;0 1 0;0 0 1]);
tim = imtransform(cim, tform);
im5 = imresize(imcomplement(tim), [40 40]);
X = [X; im5(:)'];

tform = maketform('affine', [1 0.1 0;0.1 1 0;0 0 1]);
tim = imtransform(cim, tform);
im6 = imresize(imcomplement(tim), [40 40]);
X = [X; im6(:)'];

tform = maketform('affine', [1 -0.1 0;0.1 1 0;0 0 1]);
tim = imtransform(cim, tform);
im7 = imresize(imcomplement(tim), [40 40]);
X = [X; im7(:)'];

tform = maketform('affine', [1 0.1 0;-0.1 1 0;0 0 1]);
tim = imtransform(cim, tform);
im8 = imresize(imcomplement(tim), [40 40]);
X = [X; im8(:)'];

tform = maketform('affine', [1 -0.1 0;-0.1 1 0;0 0 1]);
tim = imtransform(cim, tform);
im9 = imresize(imcomplement(tim), [40 40]);
X = [X; im9(:)'];

tform = maketform('affine', [1 -0.1 0;0.5 1 0;0 0 1]);
tim = imtransform(cim, tform);
im10 = imresize(imcomplement(tim), [40 40]);
X = [X; im10(:)'];

se= strel('disk',2);
im11= imerode(im1, se);
X = [X; im11(:)'];

se = strel('disk',1);
im12= imdilate(im1, se);
X = [X; im12(:)'];

se = strel('ball', 2, 3);
im13= imclose(im1, se);
X = [X; im13(:)'];

se = strel('disk', 3);
im14= imopen(im1, se);
X = [X; im14(:)'];

se= strel('disk',2);
im15= imerode(im2, se);
X = [X; im15(:)'];

se = strel('disk',1);
im16= imdilate(im2, se);
X = [X; im16(:)'];

se = strel('ball', 2, 3);
im17= imclose(im2, se);
X = [X; im17(:)'];

se = strel('disk', 3);
im18= imopen(im2, se);
X = [X; im18(:)'];

se= strel('disk',2);
im19= imerode(im3, se);
X = [X; im19(:)'];

se = strel('disk',1);
im20= imdilate(im3, se);
X = [X; im20(:)'];

se = strel('ball', 2, 3);
im21= imclose(im3, se);
X = [X; im21(:)'];

se = strel('disk', 3);
im22= imopen(im3, se);
X = [X; im22(:)'];

se= strel('disk',2);
im23= imerode(im4, se);
X = [X; im23(:)'];

se = strel('disk',1);
im24= imdilate(im4, se);
X = [X; im24(:)'];

se = strel('ball', 2, 3);
im25= imclose(im4, se);
X = [X; im25(:)'];

se = strel('disk', 3);
im26= imopen(im4, se);
X = [X; im26(:)'];

se= strel('disk',2);
im27= imerode(im5, se);
X = [X; im27(:)'];

se = strel('disk',1);
im28= imdilate(im5, se);
X = [X; im28(:)'];

se = strel('ball', 2, 3);
im29= imclose(im5, se);
X = [X; im29(:)'];

se = strel('disk', 3);
im30= imopen(im5, se);
X = [X; im30(:)'];

se= strel('disk',2);
im31= imerode(im6, se);
X = [X; im31(:)'];

se = strel('disk',1);
im32= imdilate(im6, se);
X = [X; im32(:)'];

se = strel('ball', 2, 3);
im33= imclose(im6, se);
X = [X; im33(:)'];

se = strel('disk', 3);
im34= imopen(im6, se);
X = [X; im34(:)'];

se= strel('disk',2);
im35= imerode(im7, se);
X = [X; im35(:)'];

se = strel('disk',1);
im36= imdilate(im7, se);
X = [X; im36(:)'];

se = strel('ball', 2, 3);
im37= imclose(im7, se);
X = [X; im37(:)'];

se = strel('disk', 3);
im38= imopen(im7, se);
X = [X; im38(:)'];

se= strel('disk',2);
im39= imerode(im8, se);
X = [X; im39(:)'];

se = strel('disk',1);
im40= imdilate(im8, se);
X = [X; im40(:)'];

se = strel('ball', 2, 3);
im41= imclose(im8, se);
X = [X; im41(:)'];

se = strel('disk', 3);
im42= imopen(im8, se);
X = [X; im42(:)'];

se= strel('disk',2);
im43= imerode(im9, se);
X = [X; im43(:)'];

se = strel('disk',1);
im44= imdilate(im9, se);
X = [X; im44(:)'];

se = strel('ball', 2, 3);
im45= imclose(im9, se);
X = [X; im45(:)'];

se = strel('disk', 3);
im46= imopen(im9, se);
X = [X; im46(:)'];

se= strel('disk',2);
im47= imerode(im10, se);
X = [X; im47(:)'];

se = strel('disk',1);
im48= imdilate(im10, se);
X = [X; im48(:)'];

se = strel('ball', 2, 3);
im49= imclose(im10, se);
X = [X; im49(:)'];

se = strel('disk', 3);
im50= imopen(im10, se);
X = [X; im50(:)'];

%str1 = strcat('X',int2str(CharacterNumber));
%v = genvarname(str1);
%eval([v '=(im2double(X) - 0.5).*2;']);
X_temp = (im2double(X) - 0.5).*2;

%str2 = strcat('y',int2str(CharacterNumber));
%v = genvarname(str2);
y_temp = zeros(50,1);

for n = 1:50
y_temp(n) = CharacterNumber;
end

if j == 1
    X_temp1 = X_temp;
    y_temp1 = y_temp;
else
    X_temp1 = [X_temp1; X_temp];
    y_temp1 = [y_temp1; y_temp];
end

imshow(im1);
pause;
end

if CharacterNumber == 1
    X = X_temp1;
    y = y_temp1;
    save('DB1', 'X', 'y');
else
    load('DB1.mat');
    X = [X; X_temp1];
    y = [y; y_temp1];
    save('DB1', 'X', 'y');
end


end