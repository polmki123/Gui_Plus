function value = Read_row_Circuit( row, col, i, j, Edit)

if (check( row, col, i + 1, j)); 
    if Edit(i+1, j, 3) == 255;
        value = Read_row_Circuit( row, col, i + 1, j, Edit) + 1 ;
    else
        value = 0;
    end
end

end