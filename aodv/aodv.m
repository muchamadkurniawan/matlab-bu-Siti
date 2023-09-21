%Code : AODV Routing.
x=1:20;
s1=x(1);
d1=x(20);
clc;
A=randi(20);
% Making matrix all diagonals=0 and A(i,j)=A(j,i),i.e. A(1,4)=a(4,1),
% A(6,7)=A(7,6)
for i=1:20
        for j=1:20
                if i==j
                    A(i,j)=0;
                else
                    A(j,i)=A(i,j);
                end
        end
end
disp(A);
t=1:20;
disp(t);