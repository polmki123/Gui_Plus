function img = Imgclear2(Edit)
[row, col, ~] = size(Edit);
for i = 1 : row;
    for j = 1 :col;
        if(Edit( i, j ,3) == 255)
            Edit(i,j,2) = 255;
            Edit(i,j,1) = 255;
        end
    end
end
img = Edit;
end