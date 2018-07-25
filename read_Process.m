function [Wall_list, Edit ] = read_Process( Wall )
[filename, pathname] = uigetfile({'*.jpg';'*.bmp';'*tif'}, 'File selector');
figure(1);
if strfind(filename, 'png') ~= 0;
    
    img = double(imread(filename));
    [row, col, d] = size(img);
    for i=1:row; 
        for j=1:col;   
            if img(i,j,1) > 200  && img(i,j,2) < 10 &&  img(i,j,3) < 10
                img(i,j,1) = 255;
                img(i,j,2) = 255;
                img(i,j,3) = 255;
            else
                img(i,j,1) = 0;
                img(i,j,2) = 0;
                img(i,j,3) = 0;
            end
        end
    end
else
   [row, col, img ]= tiff_function(filename);
end
figure(1);
[Wall_list, Edit] = calcu(row, col, Wall, img );

end