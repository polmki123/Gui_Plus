function value = fix_num(number)
Temp = number*100;
Temp = fix(Temp);
value = 0.01*Temp;
end