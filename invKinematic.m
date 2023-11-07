function [theta_1 theta_2 theta_3 theta_4] = invKinematic(x_c,y_c,z_c,theta_head)
%x_c,y_c,z_c, skal være i meter, og inden for robottens rækkevide.
%theta_head skal være i radianer
syms a_ theta_ [1 4]
theta_1;    d_1=50e-3;  a_1=0;      alpha_1=pi/2;
theta_2;    d_2=0;      a_2=93e-3;  alpha_2=0;
theta_3;    d_3=0;      a_3=93e-3;  alpha_3=0;
theta_4;    d_4=0;      a_4=50e-3;  alpha_4=0;
theta_5=0;  d_5=pi/4;   a_5=-15e-3; alpha_5=0;
%theta_1
theta_1=atan2(y_c,x_c);

%theta_3
r=sqrt(x_c^2+y_c^2);
d_22=a_4*sin(theta_head);
r_22=a_4*cos(theta_head);
r_11=r-r_22;
d_33=z_c-d_1-d_22;
c_2=sqrt(r_11^2+d_33^2);
C_2theta=pi-theta_3;
theta_3=solve(c_2^2==a_2^2+a_3^2-2*a_2*a_3*cos(C_2theta),theta_3);
theta_3=eval(theta_3(1));

%theta_2
theta_2=(atan2(d_33,r_11)-atan2(sin(theta_3)*a_3,a_2+cos(theta_3)*a_3));%other way

%theta_4
%theta_t4==theta_2+theta_3+theta_4 =>
theta_4=(theta_head-theta_2-theta_3);

end