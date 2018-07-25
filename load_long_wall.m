function value = load_long_wall(Wall)
[~ , num] = size(Wall);
result = 0;
for i = 1: num
    Temp = Wall{1,i};
    A = Temp{1,1}{1,1};
    B = Temp{1,1}{1,2};
    C = Temp{1,4}{1,1};
    D = Temp{1,4}{1,2};
    if (C - A) >= (D-B) && result <= (C-A)
        result = C-A;
    elseif (D-B) > (C - A) && result <= (D-B)
        result = D-B;        
    end
end
value = result;
end