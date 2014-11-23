% test SD dan mean dengan MATLAB
clc; 
clear all;
x = randi(12,4000,700);
[a,b] = size(x);
mean = 0; 
tic; 
sd  = 0; 
for i=1:a,
    for j=1:b
        mean = mean + x(i,j);
    end
end
mean = mean/(a * b ); 
disp(mean);
disp(toc); 
tic; 
SD = 0;
for i=1:a
    for j=1:b
        SD = SD + (x(i,j) - mean )^2;
    end
end
SD = SD / (a * b); 
SD = sqrt(SD); 
disp(SD); 
disp(toc); 

tic;
mean = sum(sum(x(:,:))); 
mean = mean/(a *b);
disp(mean); 
disp(toc); 

tic; 
SD = sum(sum((x(:,:)-mean).^2));
SD = SD / (a * b); 
SD = sqrt(SD); 
disp(SD); 
disp(toc); 