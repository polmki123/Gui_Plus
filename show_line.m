function show_line(Wall_vertex, img)
temp = zeros(size(img));
figure(3); 
temp(:, :, :) = 255;
temp = rgb2gray(temp);
imshow(temp);
[ ~ , A ] = size(Wall_vertex);
for i = 1 : A
    pause(0.5);
    B = int2str(i);
    Temp = Wall_vertex{1,i};
    vertex =[Temp{1,1}{1,2} Temp{1,1}{1,1} 0 ; Temp{1,3}{1,2} Temp{1,1}{1,1} 0; Temp{1,3}{1,2} Temp{1,2}{1,1} 0;....
        Temp{1,1}{1,2} Temp{1,2}{1,1} 0; Temp{1,1}{1,2} Temp{1,1}{1,1} 330; Temp{1,3}{1,2} Temp{1,1}{1,1} 330; Temp{1,3}{1,2} Temp{1,2}{1,1} 330; Temp{1,1}{1,2} Temp{1,2}{1,1} 330]; 
    face =[1 2 3 4; 1 2 6 5; 2 3 7 6; 3 4 8 7; 1 4 8 5; 5 6 7 8];
    patch('Vertices',vertex,'faces',face, 'Facecolor',[0.8 1 0.8])
    view(3);
    grid on;
    %rectangle('Position',[Temp{1,1}{1,2} Temp{1,1}{1,1} (Temp{1,3}{1,2}-Temp{1,1}{1,2}) (Temp{1,2}{1,1}-Temp{1,1}{1,1})], 'FaceColor',[5 .5 .5],'EdgeColor','b');
    %line([(Temp{1,1}{1,2} +Temp{1,3}{1,2})/2, (Temp{1,1}{1,2} +Temp{1,3}{1,2})/2], [Temp{1,1}{1,1},Temp{1,2}{1,1}],'Color','r', 'LineWidth', (Temp{1,3}{1,2} - Temp{1,1}{1,2}) );
    %t1 =text(Temp{1,1}{1,2}, Temp{1,1}{1,1}, {B, '¹ø º®'});
    %t1.Color = 'r';
    %t1.FontSize = 10;

end
