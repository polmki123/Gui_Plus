function value = col_Circuit( row, col, i, j, Edit)
if (check( row, col, i , j+ 1)); 
    if Edit(i, j+1, 2) == 255;
        value = col_Circuit( row, col, i , j+ 1, Edit) + 1 ;
    else
        value = 0;
    end

end

end