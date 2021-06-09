clc;clear

%position

% o is the origin
r2=6; %cm

theta2 =    45   ;

oa= r2*exp(1i*theta2);
xa=r2*cosd(theta2);
ya=r2* sind(theta2);
r3=24.5; %cm
%ob= oa + ab
%xb+iyb= xa+i*ya + r3*exp(i*theta3)
yb=0;
xb=xa+ sqrt((r3^2)-((yb-ya)^2));
cosdtheta3=(xb-xa)/r3;
sindtheta3=(yb-ya)/r3;
if cosdtheta3 > 0;  %rob3 2wl
    if sindtheta3 >0;
        theta3=acosd(cosdtheta3);
    end
 
elseif sindtheta3 > 0    %rob3 tany
    if cosdtheta3 < 0
        theta3 =180- asind(sindtheta3);
    end
elseif sindtheta3 <0    %rob3 talt
    if cosdtheta3 < 0
        theta3=180+asind(-1*sindtheta3);
    end
end
if cosdtheta3 > 0 ;   %rob3 rab3
    if sindtheta3 < 0 ;  
        theta3= 360 - (acosd(cosdtheta3));
    end
end
if sindtheta3 == 0 ;
    theta3=asind(sindtheta3);
end
if cosdtheta3 == 0 ;
    theta3=acosd(cosdtheta3);
end 


%velocity



%omega2= 50 rbm
omega2=50*2*pi / 60 ; %rad/s
%va= vax+i*vay= i*omega2*r2*exp(i*theta2)
vax= -1*omega2*r2*sind(theta2);
vay= omega2*r2*cosd(theta2);
%vb*exp(i*alpha)= i*omega2*r2*exp(i*theta2)+i*omega3*r3*exp(i*theta3)  
%vb =(vax+ivay)*exp(-1*i*alpha)+ i*omega3*r3*exp(i*(theta3-alpha))
alpha=0;
%img
%0= -1*vax*sind(alpha)+vay*cod(alpha)+ omega3*r3*cosd((theta3-alpha))
omega3= (vax*sind(alpha)-(vay*cosd(alpha)))/ r3*cosd((theta3-alpha)) ;
%real
vb= vax*cosd(alpha)+ vay*sind(alpha)- omega3*r3*sind((theta3-alpha));


% acceleration

%aa=aax+iaay=(-1*omega2^2*r2+i*alpha2*r2)*exp(i*theta2)
alpha2=0;  % angular acceleration for cranck 
aax= (-1*omega2^2*r2*cosd(theta2))- (alpha2*r2*sind(theta2));
aay=-1*omega2^2*r2*sind(theta2)+ (alpha2*r2*cosd(theta2));
%Ab = aa + Aba
%Ab*exp(i*alpha) = aax+iaay +(-1*omega^2*r3+i*alpha2*r3)*exp(i*theta3)
%img
%0=-1*aax*sind(alpha)+aay*cosd(alpha)-omega3^2*r3*sind(theta3-alpha)+alpha3*r3*cosd(theta3-alpha)
alpha3=(aax*sind(alpha)-aay*cosd(alpha)+omega3^2*r3*sind(theta3-alpha))/(r3*cosd(theta3-alpha));
%real
ab=(aax*cosd(alpha)+aay*sind(alpha))-(omega3^2*r3*cosd(theta3-alpha))-(alpha3*r3*sind(theta3-alpha));


