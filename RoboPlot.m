function out=RoboPlot()
L1=8;
L2=8;
g=3:0.1:6;
f=g+5;
hold on
for t=3:0.1:6;
u=t+5;
hold off
[T1 T2]=InverseKinematic1(t,u);
plot([0 L1*cosd(T1) t],[0 L1*sind(T1) u],'r-+',g,f)
axis([-5,15,-5,20])
 
pause(0.1);
end
end