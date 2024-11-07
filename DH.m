syms a1 a2 a3 a4 a5 a6 ...
     alpha1 alpha2 alpha3 alpha4 alpha5 alpha6 ...
     d1 d2 d3 d4 d5 d6 ...
     theta1 theta2 theta3 theta4 theta5 theta6

a = input("a = ");
alpha = input("alpha = ");
d = input("d = ");
theta = input("theta = ");

syms a_i alpha_i d_i theta_i
syms A_i(a_i,alpha_i,d_i,theta_i)

A_i(a_i,alpha_i,d_i,theta_i) = ...
    [cos(theta_i)  -sin(theta_i)*cos(alpha_i)   sin(theta_i)*sin(alpha_i)  a_i*cos(theta_i)
     sin(theta_i)   cos(theta_i)*cos(alpha_i)  -cos(theta_i)*sin(alpha_i)  a_i*sin(theta_i)
     0              sin(alpha_i)                cos(alpha_i)               d_i
     0              0                           0                          1];

T_0_n = eye(4);

for i = 1:length(theta)
    T_0_n = T_0_n * A_i(a(i),alpha(i),d(i),theta(i));
end

T_0_n = simplify(T_0_n);
fprintf("\nT = \n");
disp(T_0_n);
