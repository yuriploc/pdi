% arquivo de teste
img = imread('myimage.jpg');
H = fspecial('log');
MotionBlur = imfilter(img,H,'replicate');
imshow(MotionBlur)