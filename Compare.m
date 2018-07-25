function [Wall_Compare, Compare_img] = Compare(Wall1, Wall2)
[ X_1, Y_1 ] = size(Wall1);
[ X_2, Y_2 ] = size(Wall2);
[row, col, ~] = size(Wall1{1,1});
Wall =[];
Temp_Wall = 0;
img_Wall = double(zeros(size(Wall1{1,1})));
Temp_Original = 0;
Temp_Remodel = 0;
for i = 1 : Y_1;
    Temp_Original = Wall1{ 1, i};
    Temp_Wall = double(zeros(size(Temp_Original)));
    for j = 1: Y_2;
        Temp_Remodel = Wall2{ 1, j};
        for A = 1 : row;
            for B = 1 : col;
                if( Temp_Original(A, B, 3) == 255 && Temp_Remodel(A,B,3) == 255);
                    Temp_Wall(A,B,3) = 255;
                    img_Wall(A,B,3) = 255;
                end
            end
        end
    end
    Wall = [ Wall, {Temp_Wall}];
    imshow(Temp_Wall);
end
Wall_Compare = Wall;
Compare_img = img_Wall;
imshow(img_Wall)
end

