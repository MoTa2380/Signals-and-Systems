%% Q2, a

x = linspace(-15, 15, 1000);
y1 = zeros(1, 5);
y2 = zeros(1, 5);
y3 = zeros(1, 5); 
y4 = zeros(1, 5);
y5 = zeros(1, 5);

for i = 1:1000
    t = x(i);
    r = x(i)-2.5;
    s = 2*x(i);
    p = 0.5*x(i)+3;
    z = -(x(i) - 2);
    
    y1(i) = (t+3)*u(t+3)-(t+2)*u(t+2)-((t-2)/2)*u(t-2)+((t-4)/2)*u(t-4);
    y2(i) = (r+3)*u(r+3)-(r+2)*u(r+2)-((r-2)/2)*u(r-2)+((r-4)/2)*u(r-4);
    y3(i) = (s+3)*u(s+3)-(s+2)*u(s+2)-((s-2)/2)*u(s-2)+((s-4)/2)*u(s-4);
    y4(i) = (p+3)*u(p+3)-(p+2)*u(p+2)-((p-2)/2)*u(p-2)+((p-4)/2)*u(p-4);
    y5(i) = (z+3)*u(z+3)-(z+2)*u(z+2)-((z-2)/2)*u(z-2)+((z-4)/2)*u(z-4);
    
    
end
subplot(3,2,1)
plot(x,y1,'LineWidth',1.5);
ylim([0 1.4])
title("x(t)");

subplot(3,2,2)
plot(x,y2,'LineWidth',1.5);
ylim([0 1.4])
title("x(t-5/2)");

subplot(3,2,3)
plot(x,y3,'LineWidth',1.5);
ylim([0 1.4])
title("x(2t)");

subplot(3,2,4)
plot(x,y4,'LineWidth',1.5);
ylim([0 1.4])
title("x(1/2t + 3)");

subplot(3,2,5)
plot(x,y5,'LineWidth',1.5);
ylim([0 1.4])
title("x(2 -t)");

%% Q2, b


x = linspace(-15, 15, 1000);
y1 = zeros(1, 5);
y2 = zeros(1, 5);


for i = 1:1000
    t = x(i);
    r = -x(i);
    
    y1(i) = (t+3)*u(t+3)-(t+2)*u(t+2)-((t-2)/2)*u(t-2)+((t-4)/2)*u(t-4);
    y2(i) = (r+3)*u(r+3)-(r+2)*u(r+2)-((r-2)/2)*u(r-2)+((r-4)/2)*u(r-4);
      
end
even = (y1+y2)/2;
odd = (y1-y2)/2;
subplot(2,1,1);
plot(x,even,'LineWidth',1.5)


subplot(2,1,2);
plot(x,odd,'LineWidth',1.5)


%% 

function output = u(input)
output = heaviside(input);
end
