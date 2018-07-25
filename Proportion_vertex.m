function [Wall_Proportion] = Proportion_vertex( Wall_vertex1, Wall_vertex2)
[~, number] = size(Wall_vertex1);
[~, number2] = size(Wall_vertex2);
A = 0;
B = 0;
Temp_ratio = [];
for i = 1: number;
    A = Wall_vertex1{1, i};
    D = 0;
    for j = 1: number2;
        B = Wall_vertex2{1, j};
        if( A{1,1}{1,1} <= B{1,1}{1,1} && A{1,1}{1,2} <= B{1,1}{1,2}...
               && A{1,4}{1,1} >= B{1,4}{1,1} && A{1,4}{1,2} >= B{1,4}{1,2} )   
               D = D + (B{1,4}{1,1} - B{1,1}{1,1}) * (B{1,4}{1,2} - B{1,1}{1,2});
        end
    end
    C = (A{1,4}{1,1} - A{1,1}{1,1}) * (A{1,4}{1,2} - A{1,1}{1,2});
    if ( D ~= 0 )
        Temp_ratio = [Temp_ratio, {round(D/C *100,2)}];
    else
        Temp_ratio = [Temp_ratio, {0}];
    end
end
Wall_Proportion = Temp_ratio;
end