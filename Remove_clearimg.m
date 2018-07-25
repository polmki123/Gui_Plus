function value = Remove_clearimg(img)
[row, col, ~] = size(img);
for j = 1:row; 
    for k = 1:col;
        if img(j,k,3) == 255;
            X = Read_row_Circuit( row, col, j, k, img) + j;
            Y = Read_col_Circuit( row, col, j, k, img) + k;
            if( X - j > 3 && Y- k > 3)
                for A = j: X
                    for B = k : Y
                        img(A,B, :) = 255;
                    end
                end
            end
        end         
    end
end
value = img;
end