img = imread('myimage.jpg');
H = fspecial('gaussian');
MotionBlur = imfilter(img,H,'replicate');
imshow(MotionBlur)