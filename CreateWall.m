function [Wall, Edit] = CreateWall( i, j, want_i, want_j, img)

Temp = double(zeros(size(img)));

for a = i : want_i;
    for b = j : want_j;
        Temp(a,b,3) = 255;
        img(a,b,2) = 0;
        img(a,b,3) = 0;
    end
end

Edit = img;
imshow(Edit);
Wall = Temp;

end