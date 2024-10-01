%% Q3- part 2
clc; clear;
t1 = linspace(-2, 4, 1000);
t2 = linspace(-10 , 10, 1000);
t3 = linspace(-4, 2, 1000);
x1 = zeros(1, 1000);
x2 = zeros(1, 1000);
x3 = zeros(1, 1000);
m = length(t1);
n = length(t2);

for k = 1:1000
    t = t1(k);
    
    x1(k) = u(t+2)*u(4-t);
end


for k = 1:1000
    t = t3(k);
    
    x3(k) = u(-t+2)*u(4+t);
end

for k = 1:1000
    t = t1(k);
    
    x2(k) = u(t+2)*exp(-0.5*(t-2));
end

% part a

% y1 = x1(t)*x1(-t)
% x3(t) = x1(-t) --> y1(t) = x1*x3



% % 
% y = myconv(x1, t1, x3, t3);
% t = linspace(min(t1) + min(t3) , max(t1) + max(t3), m + n -1);
% y1 = conv(x1, x3);
% 
% subplot(2, 1, 1);
% plot(t, y);
% title(" my function")
% 
% subplot(2, 1, 2);
% plot(t, y1);
% title("matlab function")



% part b

% y2 = y1(t)*x2(t)

% % 
% y1 = myconv(x1, t1, x3, t3);
% t = linspace(min(t1) + min(t3) , max(t1) + max(t3), m + n -1);
% 
% 
% y2 = myconv(y1, t, x2, t2);
% t_new = linspace(min(t) + min(t2) , max(t) + max(t2), length(t) + n -1);
% 
% y3 = conv(y1, x2);
% 
% subplot(2, 1, 1);
% plot(t_new, y2);
% title(" my function")
% 
% subplot(2, 1, 2);
% plot(t_new, y3);
% title("matlab function")
% 

%% Q3- part 3

clc; clear;
t1 = linspace(-2, 4, 1000);
t2 = linspace(-10 , 10, 1000);
t3 = linspace(-10, 10, 1000);
x1 = zeros(1, 1000);
x2 = zeros(1, 1000);
x3 = zeros(1, 1000);
m = length(t1);
n = length(t2);

for k = 1:1000
    t = t1(k);
    
    x1(k) = u(t+2)*u(4-t);
end
for k = 1:1000
    t = t1(k);
    
    x2(k) = u(t+2)*exp(-0.5*(t-2));
end

for k = 1:1000
    t = t3(k);
    
    x3(k) = t;
end

% % part a
% 
% % x1 * x2 = x2 * x1
% 
% x1 * x2
% y1 = myconv(x1, t1, x2, t2);
% t = linspace(min(t1) + min(t2) , max(t1) + max(t2), m + n -1);
% subplot(1, 2, 1);
% plot(t, y1);
% title("x1 * x2")
% 
% % x2 * x1
% y2 = myconv(x2, t2, x1, t1);
% subplot(1, 2, 2);
% plot(t, y2);
% title("x2 * x1")
% 





% % part b
% 
% % x1*(x2 +x3) = x1*x2 + x1*x3
% 

% % x1*(x2 +x3)
% x4 = x2 + x3;
% t4 = t2;
% y1 = myconv(x1, t1, x4, t4);
% t = linspace(min(t1) + min(t2) , max(t1) + max(t2), m + n -1);
% 
% subplot(1, 2, 1);
% plot(t, y1);
% title("x1*(x2 +x3)")
% 
% % x1*x2 + x1*x3
% y2 = myconv(x1, t1, x2, t2);
% y3 = myconv(x1, t1, x3, t3);
% 
% y4 = y2 + y3;
% 
% subplot(1, 2, 2);
% plot(t, y4);
% title("x1*x2 + x1*x3")







% part c

% x1*(x2*x3) = (x1*x2)*x3
% 
% % (x1*x2)*x3
y1 = myconv(x1, t1, x2, t2);
t = linspace(min(t1) + min(t2) , max(t1) + max(t2), m + n -1);
y2 = myconv(y1, t, x3, t3);
t_new = linspace(min(t) + min(t2) , max(t) + max(t2), length(t) + n -1);
subplot(1, 2, 1);
plot(t_new, y2);
title("(x1*x2)*x3")



% x1*(x2*x3)
y3 = myconv(x2, t2, x3, t3);
t = linspace(min(t3) + min(t2) , max(t3) + max(t2), length(t3) + n -1);
y4 = myconv(y3, t, x1, t1);
t_new1 = linspace(min(t) + min(t1) , max(t) + max(t1), length(t) + m -1);
subplot(1, 2, 2);
plot(t_new1, y4);
title("x1*(x2*x3)")













%% Q3 part 1

function output = myconv(x , x_domain, y, y_domain)
   m = length(x_domain);
   n = length(y_domain);
   output = zeros(1, m + n -1);
   
   for k = 1: m + n -1
       for j = max(1,k+1-n):1:min(k,m)
           output(k) = output(k) + x(j)*y(k-j+1);
       end
   end

end

function output = u(input)
output = heaviside(input);
end

