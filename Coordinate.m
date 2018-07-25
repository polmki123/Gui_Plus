function Coordinate(img, Wall_list)
imshow(img);
[ ~ , Num] = size(Wall_list);
[row ,col , ~] = size(Wall_list{1,1});

for A = 1 : Num
    Temp = Wall_list{1, A};
    for B = 1 : row
        for C = 1 : col
            if Temp(B, C,3) == 255  
                text(B,C,{A '¹ø º® },'Color','red','FontSize',5);
                Temp = double(zeros(size(Temp)));
            end
    
        end
    end
end

end