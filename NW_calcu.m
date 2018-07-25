function  NW_calcu( i , j, col, row)
global Wall_T;
global Wall_app;

 Wall_T( i, j, 2) = 0;
 Wall_app(i ,j ,3) = 255;
 
if check(row, col, i + 1, j) ;
    if( Wall_T(i + 1, j,  2) == 255) ;
        Wall_T( i + 1, j, 2) = 0;
        NW_calcu( i + 1 , j , col, row); 
    end
end
if  check(row, col, i - 1, j) ;
    if(Wall_T(i - 1, j ,2) == 255) ;
        Wall_T( i - 1 , j, 2) = 0;
        NW_calcu( i  - 1, j , col, row);
    end
end
if  check(row, col, i , j + 1) ;
    if(Wall_T(i, j + 1, 2) == 255) ;
        Wall_T( i, j + 1, 2) = 0;
        NW_calcu(i , j + 1 , col, row); 
    end
end
if check(row, col, i , j - 1) ;
    if(Wall_T(i, j - 1, 2) == 255) ;
        Wall_T( i, j - 1, 2) = 0;
        NW_calcu( i , j - 1, col, row); 
    end
end




end