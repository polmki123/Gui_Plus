function Wall_proportion = Wall_calcu(Wall_original, Wall_compare)
[ ~ , Num] = size(Wall_original);
[row ,col , ~] = size(Wall_original{1,1});
proportion = [];
for A = 1 : Num
    original = Wall_original{1, A};
    compare = Wall_compare{1, A};
    original_num = 0;
    compare_num = 0;
    for B = 1 : row
        for C = 1 : col
            if original(B, C,3) == 255
                original_num = original_num + 1;
            end
            if compare( B, C, 3) == 255
                compare_num = compare_num +  1;
            end
        end
    end
    Temp = original_num - compare_num;
    
    proportion = [ proportion, (fix(Temp/original_num*10^3)/10)];
end
Wall_proportion = proportion;
end