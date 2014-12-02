function test_plot_berjalan 
% membuat plot berjalan dengan MATLAB
clc; 
f = figure('position', [100,100,400,400]); 
axes('parent' , f); 
set(f, 'DeleteFcn', @close )
a = 0; % dalam satuan waktu
b = 2*pi; % dalam satuan waktu
space = (b-a)/200; 
global run; 
run = 1; 
while run
    x = linspace(a,b, 200); 
    y = sin(x); 
    a = a + space; 
    b = b + space;
    plot(x,y); 
    axis tight; xlabel('waktu (dalam detik)'); ylabel('nilai curah hujan'); 
    drawnow; 
end


function close(varargin) % ini wajib pake kata 'varargin' g boleh tidak
disp('exit'); 
global run; 
run =0; 
exit; 

