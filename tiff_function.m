function [ row, col, Edit] = tiff_function(filename)
[X , ~] = imread(filename);
A = X(:, :,[2,3,4]);
imshow(A)

img = (A);
[row, col, ~] = size(img);

for i=1:row; 
    for j=1:col;
        
        if img(i,j,1) <  245 && img(i,j,2) < 245
            img(i,j,:) = 0;
        else
            img(i,j,1) = 255;
            img(i,j,2) = 255;
            img(i,j,3) = 255;
        end
    end
end

Edit = img;
end