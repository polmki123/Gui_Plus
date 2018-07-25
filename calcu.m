function [Wall_list, Edit] = calcu(row, col, Wall, img )
%ÃÑ º®Ã¤ÀÇ °¹¼ö 
Temp = img;
Add_wall = [];
Wall = [];
for i = 1: row;
    for j = 1 : col;
        if Temp( i, j, 2) == 255
				start_x = row_Circuit(row, col, i, j ,Temp) + i;
                start_y = col_Circuit(row, col, i, j, Temp) + j;
                middle_y = col_Circuit(row, col, i, j, Temp);
                middle_x = row_Circuit(row,col,i, floor(middle_y/2) +j, Temp) +i;
                oppos_x = row_Circuit(row, col, i, start_y, Temp) + i;
                if( start_x <= oppos_x && start_x <= middle_x )
                     [Add_wall, Temp] = CreateWall(i, j, start_x, start_y, Temp);
                     Wall = [ Wall, {Add_wall}];
                elseif( oppos_x < start_x && oppos_x <= middle_x )
                    [Add_wall, Temp] = CreateWall(i, j, oppos_x, start_y, Temp);
                     Wall = [ Wall, {Add_wall}];
                elseif( middle_x < start_x && middle_x < oppos_x)
                   [Add_wall, Temp] = CreateWall(i, j, middle_x, start_y, Temp);
                     Wall = [ Wall, {Add_wall}];
                end        
        end
    end 
end
Wall_list = Wall;
Edit = Temp;

imshow(Temp);

end
