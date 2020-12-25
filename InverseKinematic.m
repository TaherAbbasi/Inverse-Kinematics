function [X_N1 X_N2] = InverseKinematic1(x,y)
L1=8;
L2=8;
ThetaN_Mat =  [1;1];
Theta_N1=[2 ; 5];
while (norm(Theta_N1-ThetaN_Mat)> 0.01)
    ThetaN_Mat=Theta_N1;    
    Dif_G_Theta1=-L1*cosd(Theta_N1(1))-L2*cosd(Theta_N1(1)+Theta_N1(2));
    Dif_G_Theta2=-L2*cosd(Theta_N1(1)+Theta_N1(2));
    Dif_F_Theta1=L1*sind(Theta_N1(1))+L2*sind(Theta_N1(1)+Theta_N1(2));
    Dif_F_Theta2=L2*sind(Theta_N1(1)+Theta_N1(2));
    
    GX=L1*sind(Theta_N1(1))+L2*sind(Theta_N1(1)+Theta_N1(2))-x;
    FX=L1*cosd(Theta_N1(1))+L2*cosd(Theta_N1(1)+Theta_N1(2))-y;
    
    J=[Dif_F_Theta1 Dif_F_Theta2;Dif_G_Theta1 Dif_G_Theta2];
    
    Theta_N1=ThetaN_Mat-(J\[FX GX]');
    
    X_N1=Theta_N1(1);
    X_N2=Theta_N1(2);
      
end
X_N1=rem(Theta_N1(1),360);
X_N2=rem(Theta_N1(2),360);
 
end
