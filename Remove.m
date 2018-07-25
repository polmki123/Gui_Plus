function [Wall_Remove, Remove_img] = Remove(Wall_original, Wall_Compare)
[ ~ , Num] = size(Wall_original);
[ ~ , Num2] = size(Wall_Compare);
[row ,col , ~] = size(Wall_original{1,1});
Temp = [];
img = double(zeros(size(Wall_original{1,1})));
for A = 1 : Num
    original = Wall_original{1, A}; 
    Temp_Wall = double(zeros(size(original)));
    for j = 1: Num2;
        compare = Wall_Compare{1, j};
        for B = 1 : row
            for C = 1 : col
                if (original(B, C,3) == 255 && compare(B,C,3) ~= 255)
                    Temp_Wall(B,C,3) = 255;
                    img(B,C,3) = 255;
                end
            end
        end
    end

    Temp = [ Temp, {Temp_Wall}];
    imshow(Temp_Wall);
end
Wall_Remove = Temp;
Remove_img = img;
imshow(img)
end