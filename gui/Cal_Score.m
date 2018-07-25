function [ score_remove, score_addwall, score_shearwall, ...
    score_conti, score_thick, score_aspect, score_axial, score_between, score_reinforce ] = Cal_Score(outWall, stairwall,Shaft,NoShearWall, InnerRemove,NoInnerRemove,RF,NoRF )
global Compare_img
global Origin_img
global Add_img
global Width_removeX
global Width_removeY
global colX
global colY
global real_rate
global real_colX
global real_colY
global real_rowX
global real_rowY

%내력벽 제거량 
Remove_Ratio = 0;
if Remove_Ratio >= 30
    score_remove = 1.5 * Remove_Ratio;
else
    score_remove = Remove_Ratio;
end
score_remove =round(score_remove,1);
%내력벽 추가량
score_addWall = 0;

%연속 제거율 
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
    score_thick = score_thick + removeX_pix(i,1)*real_rate*thick;
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
    score_thick = score_thick + removeY_pix(i,1)*real_rate*thick;
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
score_axial = 0;
if sum(cell2mat(real_rowX)) > sum(cell2mat(real_rowY))
    strong = 2*sum(removeX_pix)*real_rate;
    weak = 1*sum(removeY_pix)*real_rate;
else
    strong = 2*sum(removeY_pix)*real_rate;
    weak = 1*sum(removeX_pix)*real_rate;
end
score_axial = round(strong + weak,1);

%shearwall 조건
%(outWall, stairwall,Shaft,NoShearWall, InnerRemove,NoInnerRemove,RF,NoRF )
%세대간 내력벽제거 (초기 조건값 입력 /미구현)
if outwall == 1
    Ev = 10;
else 
    Ev = 0;
end
if stairwall == 1
    stair = 10;
else
    stair = 0;
end
if Shaft == 1
    edge = 10;
else
    edge = 0;
end
score_shearwall = Ev + stair + edge;
%세대간 스코어 
if InnerRemove == 1
    Inner = 10;
else 
    Inner = 0;
end
score_between = InnerRemove;

%보강 (초기 조건값 입력 /미구현)
score_reinforce = 0;

    
end