function sum=bwNewton(Mat_Points,x)%bwNewton refres to Backwarded Newton;Mat_Points is a column matrix of (x,y)s
%a=[-1.5 -14.1014;-0.75 -0.931596;0 0;0.75 0.931596; 1.5 14.1014]
NOP=size(Mat_Points,1);%Number Of Points
ze=zeros(NOP,NOP-2);%ze refers to zero
NewtonMat=[Mat_Points,ze];
for i=3:NOP+1
    for j=i-1:NOP
        temp=(NewtonMat(j,i-1)-NewtonMat(j-1,i-1))/(NewtonMat(j,1)-NewtonMat(j-(i-2),1));
        NewtonMat(j,i)=(temp);
    end
end

xMat(1,1)=1;
for i=2:size(NewtonMat,2)-1
    xMat(i,1)=((x-NewtonMat(i-1,1))*xMat(i-1,1));
end
sum=NewtonMat(1,2);
for i=2:size(xMat,1)
    sum=sum+xMat(i,1)*NewtonMat(i,i+1);
end
sum
end