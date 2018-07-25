function [ score_remove, score_addwall, score_shearwall, score_conti, score_thick, score_aspect, score_axial, score_between, score_reinforce ] = scoring_m()
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Wall_original_vertex 
global Wall_Compare_vertex
global percentage
global shortest
global before_longest
global before_shortest


Temp_X = [];Temp_Y = [];Temp_X2 = [];Temp_Y2 = [];
Width_X = []; Width_removeX = []; Width_leftX = [];
Width_Y = []; Width_removeY = []; Width_leftY = [];
real_rowX= []; real_colX = [];
real_rowY = []; real_colY= [];
result = 0; Temp1 = [];Temp2 = [];
Temp = Proportion_vertex( Wall_original_vertex, Wall_Compare_vertex);
long_wall = load_long_wall(Wall_original_vertex);
[~, number] = size(Temp);
rate = percentage/long_wall; 
real_X= [];real_leftX = []; real_removeX = [];
real_Y= [];real_leftY = []; real_removeY = [];
rowX = []; colX = [];
rowY = []; colY = [];
for i = 1 : number
    result = Temp{1,i};
    A = Wall_original_vertex{1,i}{1,1}{1,1};
    B = Wall_original_vertex{1,i}{1,1}{1,2};
    C = Wall_original_vertex{1,i}{1,4}{1,1};
    D = Wall_original_vertex{1,i}{1,4}{1,2};
    WidthX = (C-A)*(D-B);
    if C-A >= D-B
        rowX = [rowX; {C-A}];
        colX = [colX; {D-B}];
        Temp_X = [Temp_X ; {fix_num(result)}];
        Temp_X2 = [Temp_X2 ; {fix_num(100-result)}];
        Width_X = [ Width_X; {WidthX}];
        Width_leftX = [Width_leftX ;  {fix_num(result * WidthX/100)} ]; 
        Width_removeX = [Width_removeX ;  {fix_num((100-result) * WidthX/100)} ]; 
        real_rowX = [real_rowX ; {fix_num((C-A)*rate)}];
        real_colX = [real_colX ; {fix_num((D-B)*rate)}];
        real_X = [ real_X ; {fix_num(WidthX*power(rate,2))}];
        real_leftX = [real_leftX; {fix_num((result*WidthX/100*power(rate,2)))}];
        real_removeX = [real_removeX; {fix_num(((100-result) * WidthX/100*power(rate,2)))}];
    else 
        rowY = [rowY; {D-B}];
        colY = [colY; {C-A}];
        Temp_Y = [ Temp_Y ; {fix_num(result)}];
        Temp_Y2 = [Temp_Y2 ; {fix_num(100-result)}];
        Width_Y = [ Width_Y; {WidthX}];
        Width_leftY = [Width_leftY ;  {fix_num((result) * WidthX/100)} ]; 
        Width_removeY = [Width_removeY ;  {fix_num((100-result) * WidthX/100)} ]; 
        real_rowY = [real_rowY ; {fix_num((D-B)*rate)}];
        real_colY = [real_colY ; {fix_num((C-A)*rate)}];
        real_Y = [ real_Y ; {fix_num(WidthX*power(rate,2))}];
        real_leftY = [real_leftY; {fix_num(result*WidthX/100*power(rate,2))}];
        real_removeY = [real_removeY; {fix_num((100-result) * WidthX/100*power(rate,2))}];
    end
end

Temp1 = [rowX, colX, Width_X ,Temp_X ,Temp_X2 ,Width_leftX, Width_removeX,real_rowX,real_colX, real_X, real_leftX, real_removeX];
Temp2 = [rowY, colY, Width_Y, Temp_Y ,Temp_Y2 ,Width_leftY, Width_removeY ,real_rowY,real_colY, real_Y, real_leftY, real_removeY];

%내력벽 제거량
[ WidthX , ~ ] = size(Width_X);
[ WidthY , ~ ] = size(Width_Y);
[ leftX , ~ ] = size(Width_leftX);
[ leftY , ~ ] = size(Width_leftY);
Remodeling_before = 0;
Remain_Wall = 0;
score_remove = 0;
for i= 1:WidthX
    WidthX_index = cell2mat(Width_X(i,1));
    Remodeling_before = Remodeling_before+ WidthX_index;
end    
for i= 1:WidthY
    WidthY_index = cell2mat(Width_Y(i,1));
    Remodeling_before = Remodeling_before+ WidthY_index;
end

for i= 1:leftX
    leftX_index = cell2mat(Width_leftX(i,1));
    Remain_Wall = Remain_Wall + leftX_index;
end   
for i= 1:leftY
    leftY_index = cell2mat(Width_leftY(i,1));
    Remain_Wall = Remain_Wall + leftY_index;
end

Remove_Ratio = (( Remodeling_before - Remain_Wall)/ Remodeling_before)*100;

if Remove_Ratio >= 30
    score_remove = 1.5 * Remove_Ratio;
else
    score_remove = Remove_Ratio;
end
score_remove =round(score_remove,1);

%내력벽 추가량 (미구현)
score_addwall = 43.7;

%Shear Wall 제거 (초기 조건값 입력/미구현)
score_shearwall = 0;

%연속제거율 ~25 : -0. ~50 : -5, ~75 : -7, ~100 : -9
%제거된 길이 (pixel)= > Width_removeX / colX
%Temp_X2,Temp_Y2
removeX_pix = cell2mat(Width_removeX) ./ cell2mat(colX);
removeY_pix = cell2mat(Width_removeY) ./ cell2mat(colY);

[ X , ~ ] = size(removeX_pix);
[ Y , ~ ] = size(removeY_pix);
score_conti = 0;
for i= 1:X
    X_1 = (removeX_pix(i,1)/long_wall)*100;
    if X_1>=75 && X_1<=100
        conti = 9;
    elseif X_1>=50 && X_1 < 75
        conti = 7;
    elseif X_1>=25 && X_1 < 50
        conti = 5;
    else
        conti = 0;
    end
    score_conti = score_conti + conti;
end
for i= 1:Y
    Y_1 = (removeY_pix(i,1)/long_wall)*100;
    if Y_1>=75 && Y_1<=100
        conti = 9;
    elseif Y_1>=50 && Y_1 < 75
        conti = 7;
    elseif Y_1>=25 && Y_1 < 50
        conti = 5;
    else
        conti = 0;
    end
    score_conti = score_conti + conti;
end

%두께
%real_colX,Y
[ X , ~ ] = size(real_colX);
[ Y , ~ ] = size(real_colY);
score_thick = 0;
for i= 1:X
    X_1 = cell2mat(real_colX(i,1));
    if X_1 >= 0.3
        thick = 2;
    elseif X_1 >= 0.25 && X_1 < 0.3
        thick = 1.5;
    elseif X_1 >= 0.2 && X_1 < 0.25
        thick = 1;
    else
        thick = 0.5;
    end
    score_thick = score_thick + removeX_pix(i,1)*rate*thick;
end
for i= 1:Y
    Y_1 = cell2mat(real_colY(i,1));
    if Y_1 >= 0.3
        thick = 2;
    elseif Y_1 >= 0.25 && Y_1 < 0.3
        thick = 1.5;
    elseif Y_1 >= 0.2 && Y_1 < 0.25
        thick = 1;
    else
        thick = 0.5;
    end
    score_thick = score_thick + removeY_pix(i,1)*rate*thick;
end
score_thick = round(score_thick,1);

%장,단축의 비
%전도면 장,단축 & 후도면 장,단축 비교(b/2a-1로 비교) , 후도면 값이 
% before_shortest,longest,shortest,percentage 임의로 지정 %미구현
before_shortest = 6.4;
before_longest = 10.3;
shortest = 6.4;
percentage = 17.4;
score_aspect = 0;

if 2*before_shortest < before_longest
    before_asp = 2*before_shortest/before_longest-1;
else
    before_asp = 2*before_shortest\before_longest-1;
end

if 2*shortest < percentage
    after_asp = 2*shortest/percentage-1;
else
    after_asp = 2*shortest\percentage-1;
end

if abs(before_asp) < abs(after_asp)
    score_aspect = abs(after_asp) * 10;
else
    score_aspect = 0;
end
score_aspect= round(score_aspect,1);

%강,약축제거
%sum(real_rowX) 둘 중 큰 값이 강축
[ X , ~ ] = size(real_rowX);
[ Y , ~ ] = size(real_rowY);
score_axial = 0;
if sum(cell2mat(real_rowX)) > sum(cell2mat(real_rowY))
    strong = 2*sum(removeX_pix)*rate;
    weak = 1*sum(removeY_pix)*rate;
else
    strong = 2*sum(removeY_pix)*rate;
    weak = 1*sum(removeX_pix)*rate;
end
score_axial = round(strong + weak,1);

%세대간 내력벽제거 (초기 조건값 입력 /미구현)
score_between = 0;

%보강 (초기 조건값 입력 /미구현)
score_reinforce = 0;

end