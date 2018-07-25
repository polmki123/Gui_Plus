function [Wall_list, Edit] = R_calcu(row, col, Wall, img )
%ÃÑ º®Ã¤ÀÇ °¹¼ö 
global Wall_app;
global Wall_T;

Wall_T = img;
for i = 1: row;
    for j = 1 : col;
        if Wall_T( i, j, 2) == 255
            Wall_app = uint8(zeros(size(Wall_T)));
            NW_calcu( i , j, col, row);
            Wall = [ Wall, {  Wall_app } ];
            imshow(  Wall_app);
        end
    end 
end
Wall_list = Wall;
Edit = Wall_T;

imshow(Wall_T);

end
 