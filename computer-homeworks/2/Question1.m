%% 1.1
clc, clear;


t0 = 2;  % in t = 2 the position will be calculated.
[x, y] = projectile(10, 10, 100, pi/4, t);



%% 1.2
clc, clear;

t = linspace(1, 20, 1000);
% for theta greater than 0
x0 = 10;
y0 = 10;
v0 = 100;
theta0 = pi/4;

[x1, y1] = projectile(x0, y0, v0, theta0, t);
subplot(1, 2, 1)
plot(x1,y1)
title("theta > 0")

% calculating time for y = 0 and y = y0
syms t0

equation = (-1/2)*(9.8)*t0^2 + v0*sin(theta0)*t0+ + y0 == 0;
equation2 = (-1/2)*(9.8)*t0^2 + v0*sin(theta0)*t0+ + y0 == y0;


answer = solve(equation, t0);
answer = answer( answer>=0 );
answer = double(answer)

answer2 = solve(equation2, t0);
answer2 = answer2( answer2 >0 );
answer2 = double(answer2)



% for theta less than 0

x0 = 10;
y0 = 10;
v0 = 4;
theta0 = -pi/4;

[x2, y2] = projectile(x0, y0, v0, theta0, t);
subplot(1, 2, 2)
plot(x2,y2)
title("theta < 0")


% calculating time for y = 0 and y = y0
syms t0

equation = (-1/2)*(9.8)*t0^2 + v0*sin(theta0)*t0+ + y0 == 0;
equation2 = (-1/2)*(9.8)*t0^2 + v0*sin(theta0)*t0+ + y0 == y0;


answer = solve(equation, t0);
answer = answer( answer>=0 );
answer = double(answer)

answer2 = solve(equation2, t0);
answer2 = answer2( answer2 >0 );
answer2 = double(answer2)




%% 1.3
clc; clear;
t = linspace(1, 20, 1000);
% for theta greater than 0
x0 = 10;
y0 = 10;
v0 = 100;
theta0 = pi/4;

[x1, y1] = velocity(x0, y0, v0, theta0, t);
subplot(1, 2, 1)
plot(t,y1)
title("velocity");
xlabel("t");
ylabel("Vy");



subplot(1, 2, 2)
plot(t,x1)
title("velocity");
xlabel("t");
ylabel("Vx");

%% functions

function [x, y] = projectile(x0, y0, v0, theta0, t0)
    syms x(t) y(t)
    
    x(t) = v0*cos(theta0)*t + x0;
    y(t) = (-1/2)*(9.8)*t^2 + v0*sin(theta0)*t+ + y0;
    x = x(t0);
    y = y(t0);
end

function [x, y] = velocity(x0, y0, v0, theta0, t0)
    syms x(t) y(t)
    
    x(t) = v0*cos(theta0)*t + x0;
    y(t) = (-1/2)*(9.8)*t^2 + v0*sin(theta0)*t+ + y0;
    vx = diff(x,t);
    vy = diff(y,t);
    
    x = vx(t0);
    y = vy(t0);
end
