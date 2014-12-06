clc ;
awal = 0; 
akhir = 2*pi ; 
f = figure; 
temp = awal + .1;
step =0.05;
while ishandle(f) && temp <= akhir
 x = awal:step:temp;
 plot(x,sin(2.*x),'-ro'); 
 axis([0  akhir  -1 1]);
 drawnow;
 temp = temp+ step;
 pause(0.02);
end
 
while ishandle(f)
 awal = awal + step; 
 akhir = akhir + step; 
 x = awal:.025:akhir;
 plot(x,sin(2.*x),'-ro'); 
 axis([awal  akhir  -1 1]);
 drawnow;
 pause(0.02);
end
disp('program selesai'); 