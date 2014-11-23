% jawaban nomor dua
function plot_bolak_balik
clc;
f = figure('menubar', 'none');
x = linspace(45 ,405,100);
y1 = cosd(x);
y2 = sind(x);
plot(x, y1, 'b.- ', x, y2, 'g.-'); % untuk menjaga sumbunya konstan
hold on ;
i = 1;
state = true;
while ishandle(f),
    
    if state
        p = plot(x(i), y1(i), 'r.' , 'Markersize' ,30);
        if(i == numel(x) ), state = false; i = i - 1;  end
        i = i+ 1;
        pause(0.02);
        if ishandle(p),delete(p); end
    else
        p = plot(x(i), y2(i), 'r.' , 'Markersize' ,30);
        if(i ==  1 ), state = true ; i = i+ 1;  end
        i = i- 1;
        pause(0.02);
        if ishandle(p),delete(p); end
    end
end