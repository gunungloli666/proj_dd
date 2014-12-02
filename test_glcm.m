clc;
I = randi(25, 5,5)
[glcm,SI] = graycomatrix(I,'NumLevels', 4,'G',[])
% [glcm, SI] = 