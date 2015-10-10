clc 
clear all;
I = imread('forest.png');
imshow(I);
hold on
[c,r] = ginput();
coor=cat(2,c,r);
[m,n]=size(coor);
for i=1:m
    for j=1:m
        pos=[coor(i,:);coor(j,:)];
        f=distance(pos(1,1),pos(1,2),pos(2,1),pos(2,2));
        if i==j
            A(i,j)=0;
        end
        if f>100
            A(i,j)=0;
        else
            A(i,j)=f;
        end
    end
end
A=int32(A);
gplot(A,coor,'-*')
for i=1:m
    for j=1:m
        if A(i,j)==0
        if i==j
            A(i,j)=A(i,j);
        else
            A(i,j)=9999*1;
        end
        end
    end
end
for k=1:m-1
    for i=1:m
        for j=1:m
            d(i,j)=min(A(i,j),A(i,k)+A(k,j));
        end
    end
    d
end