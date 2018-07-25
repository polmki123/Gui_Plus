function value = row_Circuit( row, col, i, j, Edit)
if (check( row, col, i + 1, j)); 
    if Edit(i+1, j, 2) == 255;
        value = row_Circuit( row, col, i + 1, j, Edit) + 1 ;
    else
        value = 0;
    end

end

end