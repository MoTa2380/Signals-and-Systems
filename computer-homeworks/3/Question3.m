%% 3.1 
clc; clear;
image = imread("image.jpg");
imshow(image)




%% 3.2
clc; clear;
image = imread("image.jpg");
redChannel = image(:,:,1);
greenChannel = image(:,:,2);
blueChannel = image(:,:,3);
subplot(2, 2, 1)
imshow(redChannel)
title("red")
subplot(2, 2, 2)
imshow(greenChannel)
title("green")
subplot(2, 2, 3)
imshow(blueChannel)
title("blue")
subplot(2, 2, 4)
imshow(image)
title("original")

%% 3.3
clc; clear;
image = imread("image.jpg");
redChannel = image(:,:,1);
greenChannel = image(:,:,2);
blueChannel = image(:,:,3);

ave = (redChannel + greenChannel + blueChannel)/3;


subplot(1, 2, 1)
imshow(ave)
title("ave")
subplot(1, 2, 2)
imshow(rgb2gray(image))
title("rgb2gray")



%% 3.4 
clc; clear;
image = imread("image.png");
imshow(image)
image = rgb2gray(image);

figure();
A = [1 0 -1; 2 0 -2; 1 0 -1];
B = [1 2 1; 0 0 0; -1 -2 -1];

Gx = conv2(A, image);

Gy = conv2(B ,image);


G = sqrt(Gx.^2 + Gy.^2);
G = G/max(max(G));
imshow(G)


