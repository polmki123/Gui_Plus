clear all;
clc
%ÃÑ º®Ã¤ÀÇ °¹¼ö 

Wall_original = [];
Wall_original_vertex = [];
Wall_remodeling = [];
Wall_remodeling_vertex = [];
Wall_Compare = [];
Wall_Proportion = [];
Wall_Remove = [];


[Wall_original, Edit_01] = read_Process(Wall_original);
Wall_original_vertex = Read_vertex(Wall_original);
Wall_original = [];
show_line(Wall_original_vertex, Edit_01);
[Wall_remodeling, Edit_02] = read_Process(Wall_remodeling);
Wall_remodeling_vertex = Read_vertex(Wall_remodeling);
Wall_remodeling = [];
show_line(Wall_remodeling_vertex, Edit_01)
[Wall_Compare, Compare_img] = Compare_vertex(Wall_original_vertex, Wall_remodeling_vertex, Edit_01);
Wall_Compare_vertex = Read_vertex(Wall_Compare);
Wall_Compare = [];
show_line(Wall_Compare_vertex, Edit_01)
[Wall_remove, Remove_img] = Remove_vertex(Wall_original_vertex, Wall_Compare_vertex, Edit_01);
Wall_remove_vertex = Read_vertex(Wall_remove);
Wall_remove = [];
show_line(Wall_remove_vertex, Edit_01)
[Wall_Proportion] = Proportion( Wall_original_vertex, Wall_Compare_vertex);


[row, col, ~] = size(Edit_01);
Remodeling_before = 0;
Remain_Wall = 0;
for i=1:row
    for j=1:col
        if Edit_01(i,j,1) == 255
          Remodeling_before = Remodeling_before+1;

        end
    end
end

for i=1:row
    for j=1:col
        if Edit_01(i,j,1) == 255 
            if Edit_02(i,j,1) == 255
                 Remain_Wall = Remain_Wall +1;
            end
        end
    end
end

Remove_Ratio = (( Remodeling_before - Remain_Wall)/ Remodeling_before)*100;
%Coordinate( Edit_01 ,Wall_original)