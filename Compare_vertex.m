function [Wall_Compare, Compare_img] = Compare_vertex(Wall1_vertex, Wall2_vertex, Edit_01)
[ ~, Y_1 ] = size(Wall1_vertex);
[ ~, Y_2 ] = size(Wall2_vertex);
Wall =[];
Temp_Wall = 0;
img_Wall = (zeros(size(Edit_01)));
Temp_Original = 0;
Temp_Remodel = 0;

for i = 1 : Y_1;
    Temp_Original = Wall1_vertex{ 1, i};
    Temp_Wall = (zeros(size(Edit_01)));
    for j = 1: Y_2;
        X1 = 0;
        X2 = 0;
        Y1 = 0;
        Y2 = 0;
        Temp_Remodel = Wall2_vertex{ 1, j};
        for k = 1:4
            if(Temp_Original{1,1}{1,1} <= Temp_Remodel{1,k}{1,1} && Temp_Original{1,4}{1,1} >= Temp_Remodel{1,k}{1,1}...
                    && Temp_Original{1,1}{1,2} <= Temp_Remodel{1,k}{1,2} && Temp_Original{1,4}{1,2} >= Temp_Remodel{1,k}{1,2});
                if( k == 1)
                    Y1 = Temp_Remodel{1,k}{1,2};
                    X1 = Temp_Remodel{1,k}{1,1};
                    if( Temp_Remodel{1,4}{1,2} <= Temp_Original{1,4}{1,2})
                        Y2 = Temp_Remodel{1,4}{1,2};
                    else
                        Y2 = Temp_Original{1,4}{1,2};
                    end
                    if(Temp_Remodel{1,4}{1,1} <= Temp_Original{1,4}{1,1});
                        X2 = Temp_Remodel{1,4}{1,1};
                    else
                        X2 = Temp_Original{1,4}{1,1};
                    end
                    
                elseif( k == 2);
                    Y1 = Temp_Remodel{1,k}{1,2};
                    X2 = Temp_Remodel{1,k}{1,1};
                    if( Temp_Remodel{1,1}{1,1} >= Temp_Original{1,1}{1,1});
                        X1 = Temp_Remodel{1,1}{1,1};
                    else
                        X1 = Temp_Original{1,1}{1,1};
                    end
                    if(Temp_Remodel{1,4}{1,2} <= Temp_Original{1,4}{1,2});
                        Y2 = Temp_Remodel{1,4}{1,2};
                    else
                        Y2 = Temp_Original{1,4}{1,2};
                    end
                    
                elseif( k == 3);
                    Y2 = Temp_Remodel{1,k}{1,2};
                    X1 = Temp_Remodel{1,k}{1,1};
                    if( Temp_Remodel{1,1}{1,2} >= Temp_Original{1,1}{1,2});
                        Y1 = Temp_Remodel{1,1}{1,2};
                    else
                        Y1 = Temp_Original{1,1}{1,2};
                    end
                    if(Temp_Remodel{1,4}{1,1} <= Temp_Original{1,4}{1,1});
                        X2 = Temp_Remodel{1,4}{1,1};
                    else
                        X2 = Temp_Original{1,4}{1,1};
                    end
                    
                else
                    Y2 = Temp_Remodel{1,k}{1,2};
                    X2 = Temp_Remodel{1,k}{1,1};
                    if( Temp_Remodel{1,1}{1,1} >= Temp_Original{1,1}{1,1})
                        X1 = Temp_Remodel{1,1}{1,1};
                    else
                        X1 = Temp_Original{1,1}{1,1};
                    end
                    if(Temp_Remodel{1,1}{1,2} >= Temp_Original{1,1}{1,2});
                        Y1 = Temp_Remodel{1,1}{1,2};
                    else
                        Y1 = Temp_Original{1,1}{1,2};
                    end
                    
                end
                if ( X1 ~= 0)
                    for A = X1 : X2
                        for B = Y1:Y2
                            Temp_Wall(A,B,3) = 255;
                            img_Wall(A,B,3) = 255;
                        end
                    end
                end
            end
        end
        
        if Temp_Remodel{1,4}{1,1} >= Temp_Original{1,4}{1,1} -3  && Temp_Remodel{1,4}{1,2} >= Temp_Original{1,4}{1,2} - 3 ...
                &&Temp_Remodel{1,1}{1,2} <= Temp_Original{1,1}{1,2} + 3 && Temp_Remodel{1,1}{1,1} <= Temp_Original{1,1}{1,1} + 3
            X1 = Temp_Original{1,1}{1,1};
            Y1 = Temp_Original{1,1}{1,2};
            X2 = Temp_Original{1,4}{1,1};
            Y2 = Temp_Original{1,4}{1,2};
            for A = X1 : X2
                for B = Y1 : Y2
                    Temp_Wall(A,B,3) = 255;
                    img_Wall(A,B,3) = 255;
                end
            end
        end
     
%        if Temp_Remodel{1,4}{1,1} >= Temp_Original{1,4}{1,1}  && Temp_Remodel{1,4}{1,2} <= Temp_Original{1,4}{1,2}...
%                && Temp_Remodel{1,1}{1,1} <= Temp_Original{1,1}{1,1} && Temp_Remodel{1,1}{1,2} >= Temp_Original{1,1}{1,2} 
%            X1 = Temp_Original{1,1}{1,1};
%            Y1 = Temp_Original{1,1}{1,2};
%            X2 = Temp_Original{1,4}{1,1};
%            Y2 = Temp_Original{1,4}{1,2};
%            for A = X1 : X2;
%                for B = Y1 : Y2;
%                    Temp_Wall(A,B,3) = 255;
%                    img_Wall(A,B,3) = 255;
%                end
%            end
%        end
%        if Temp_Remodel{1,4}{1,1} <= Temp_Original{1,4}{1,1}  && Temp_Remodel{1,4}{1,2} >= Temp_Original{1,4}{1,2}...
%                &&   Temp_Remodel{1,1}{1,1} >= Temp_Original{1,1}{1,1} && Temp_Remodel{1,1}{1,2} <= Temp_Original{1,1}{1,2}
%            X1 = Temp_Original{1,1}{1,1};
%            Y1 = Temp_Original{1,1}{1,2};
%            X2 = Temp_Original{1,4}{1,1};
%            Y2 = Temp_Original{1,4}{1,2};
%            for A = X1 : X2;
%                for B = Y1 : Y2;
%                    Temp_Wall(A,B,3) = 255;
%                    img_Wall(A,B,3) = 255;
%                end
%            end
%        end
%        if Temp_Remodel{1,4}{1,1} <= Temp_Original{1,4}{1,1}  && Temp_Remodel{1,4}{1,2} >= Temp_Original{1,4}{1,2}...
%                 && Temp_Remodel{1,1}{1,2} <= Temp_Original{1,1}{1,2} && Temp_Remodel{1,1}{1,1} <= Temp_Original{1,1}{1,1};
%             X1 = Temp_Original{1,1}{1,1};
%             Y1 = Temp_Original{1,1}{1,2};
%             X2 = Temp_Original{1,4}{1,1};
%             Y2 = Temp_Original{1,4}{1,2};
%             for A = X1 : X2;
%                 for B = Y1 : Y2;
%                     Temp_Wall(A,B,3) = 255;
%                     img_Wall(A,B,3) = 255;
%                 end
%             end
%        end
        
%        if Temp_Remodel{1,4}{1,1} >= Temp_Original{1,4}{1,1}  && Temp_Remodel{1,4}{1,2} <= Temp_Original{1,4}{1,2}...
%                 && Temp_Remodel{1,1}{1,2} <= Temp_Original{1,1}{1,2} && Temp_Remodel{1,1}{1,1} <= Temp_Original{1,1}{1,1};
%             X1 = Temp_Original{1,1}{1,1};
%             Y1 = Temp_Original{1,1}{1,2};
%             X2 = Temp_Original{1,4}{1,1};
%             Y2 = Temp_Original{1,4}{1,2};
%             for A = X1 : X2;
%                 for B = Y1 : Y2;
%                     Temp_Wall(A,B,3) = 255;
%                     img_Wall(A,B,3) = 255;
%                 end
%             end
%        end
%         
%     
%         if Temp_Remodel{1,4}{1,1} >= Temp_Original{1,4}{1,1}  && Temp_Remodel{1,4}{1,2} >= Temp_Original{1,4}{1,2}...
%                 && Temp_Remodel{1,1}{1,2} >= Temp_Original{1,1}{1,2} && Temp_Remodel{1,1}{1,1} <= Temp_Original{1,1}{1,1};
%             X1 = Temp_Original{1,1}{1,1};
%             Y1 = Temp_Original{1,1}{1,2};
%             X2 = Temp_Original{1,4}{1,1};
%             Y2 = Temp_Original{1,4}{1,2};
%             for A = X1 : X2;
%                 for B = Y1 : Y2;
%                     Temp_Wall(A,B,3) = 255;
%                     img_Wall(A,B,3) = 255;
%                 end
%             end
%         end
%         
%         if Temp_Remodel{1,4}{1,1} <= Temp_Original{1,4}{1,1}  && Temp_Remodel{1,4}{1,2} >= Temp_Original{1,4}{1,2}...
%                 && Temp_Remodel{1,1}{1,2} <= Temp_Original{1,1}{1,2} && Temp_Remodel{1,1}{1,1} >= Temp_Original{1,1}{1,1};
%             X1 = Temp_Original{1,1}{1,1};
%             Y1 = Temp_Original{1,1}{1,2};
%             X2 = Temp_Original{1,4}{1,1};
%             Y2 = Temp_Original{1,4}{1,2};
%             for A = X1 : X2;
%                 for B = Y1 : Y2;
%                     Temp_Wall(A,B,3) = 255;
%                     img_Wall(A,B,3) = 255;
%                 end
%             end
%         end
        
    end
    Wall = [ Wall, {Temp_Wall}];
    figure(1);
    imshow(img_Wall)
end
Wall_Compare = Wall;
Compare_img = img_Wall;

end

