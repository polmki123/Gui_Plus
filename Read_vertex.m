 function vertex_list = Read_vertex(Wall)
[ ~, G ] = size(Wall);
[row, col, ~] = size(Wall{1,1});
vertex = [];
A = {};
B = {};
C = {};
D = {};

for i = 1: G;
    Temp = Wall{1,i};
    for j = 1:row; 
        for k = 1:col;
            if Temp(j,k,3) == 255;
                X = 0;
                Y = 0;
                A = {j,k};
                X = Read_row_Circuit( row, col, j, k, Temp) + j;
                B = {X,k};
                Y = Read_col_Circuit( row, col, j, k, Temp) + k;
                C = {j,Y};
                D = {X,Y};
                for Temp_x1 = j : X;
                    for Temp_y1 = k : Y;
                        Temp( Temp_x1,Temp_y1,3) = 0;
                    end
                end
                if( X - j > 3 && Y- k > 3)
                    vertex = [ vertex, {{A,B,C,D}}];
                end
            end         
        end
    end
     [~,W] = size(vertex);
%     if W < i;
%        vertex = [ vertex, {{{0,0},{0,0},{0,0},{0,0}}}];
%     end
end
vertex_list = vertex; 
end