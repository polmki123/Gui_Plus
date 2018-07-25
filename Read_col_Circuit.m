function value = Read_col_Circuit( row, col, i, j, Edit)

if (check( row, col, i , j+ 1)); 
    if Edit(i, j+1, 3) == 255;
        value = Read_col_Circuit( row, col, i , j+ 1, Edit) + 1 ;
    else
        value = 0;
    end
end

end