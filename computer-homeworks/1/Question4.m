%% 4.1
ak = zeros(1,5);
for k = 1:100
    ak(k) = (1 - (-1)^k)/((k*pi)^2);
end

stem(1:100, ak);
%% 4.2

t = linspace(-1, 1, 1000);
x1 = zeros(1, 1000);
for i = 1:1000
    for k = 1:100
        x1(i) =  x1(i) + ak(k)*exp(1j*k*pi*t(i));
    end
end
subplot(2,1,1)
plot(t, x1)
title("fourier serie")
subplot(2,1,2)
x = 0.25 - abs(t);
plot(t, x)
title("function")

%% 4.3
ak = zeros(1,5);
for k = 1:100
    ak(k) = -1j*(1 - (-1)^k)/((k*pi));
end
stem(1:100, ak)
t = linspace(-1, 1, 1000);
x1 = zeros(1, 1000);
for i = 1:1000
    for k = 1:100
        x1(i) =  x1(i) +2* ak(k)*exp(1j*k*pi*t(i));
    end
end
subplot(2,1,1)
plot(t, x1)
title("fourier serie")

x = zeros(1, 1000);

for k = 1:1000
     r = t(k);
     x(k) = -u(r+1) + 2*u(r);
 end


subplot(2,1,2)
plot(t, x, 'LineWidth',1.2)
title("function")

%% 4.4

err = zeros(1, 6);
ak = zeros(1,5);
for k = 1:2
    ak(k) = -1j*(1 - (-1)^k)/((k*pi));
end

t = linspace(-1, 1, 1000);
x1 = zeros(1, 1000);
for i = 1:1000
    for k = 1:2
        x1(i) =  x1(i) +2* ak(k)*exp(1j*k*pi*t(i));
    end
end
subplot(2,3,1)
plot(t, x1)
title("N = 2")
err(1) = sum((x - x1).^2);

ak = zeros(1,5);
for k = 1:5
    ak(k) = -1j*(1 - (-1)^k)/((k*pi));
end

t = linspace(-1, 1, 1000);
x1 = zeros(1, 1000);
for i = 1:1000
    for k = 1:5
        x1(i) =  x1(i) +2* ak(k)*exp(1j*k*pi*t(i));
    end
end
subplot(2,3,2)
plot(t, x1)
title("N = 5")
err(2) = sum((x - x1).^2);


ak = zeros(1,5);
for k = 1:10
    ak(k) = -1j*(1 - (-1)^k)/((k*pi));
end

t = linspace(-1, 1, 1000);
x1 = zeros(1, 1000);
for i = 1:1000
    for k = 1:10
        x1(i) =  x1(i) +2* ak(k)*exp(1j*k*pi*t(i));
    end
end
subplot(2,3,3)
plot(t, x1)
title("N = 10")
err(3) = sum((x - x1).^2);


ak = zeros(1,5);
for k = 1:20
    ak(k) = -1j*(1 - (-1)^k)/((k*pi));
end

t = linspace(-1, 1, 1000);
x1 = zeros(1, 1000);
for i = 1:1000
    for k = 1:20
        x1(i) =  x1(i) +2* ak(k)*exp(1j*k*pi*t(i));
    end
end
subplot(2,3,4)
plot(t, x1)
title("N = 20")
err(4) = sum((x - x1).^2);

ak = zeros(1,5);
for k = 1:50
    ak(k) = -1j*(1 - (-1)^k)/((k*pi));
end

t = linspace(-1, 1, 1000);
x1 = zeros(1, 1000);
for i = 1:1000
    for k = 1:50
        x1(i) =  x1(i) +2* ak(k)*exp(1j*k*pi*t(i));
    end
end
subplot(2,3,5)
plot(t, x1)
title("N = 50")
err(5) = sum((x - x1).^2);


ak = zeros(1,5);
for k = 1:100
    ak(k) = -1j*(1 - (-1)^k)/((k*pi));
end

t = linspace(-1, 1, 1000);
x1 = zeros(1, 1000);
for i = 1:1000
    for k = 1:100
        x1(i) =  x1(i) +2* ak(k)*exp(1j*k*pi*t(i));
    end
end
subplot(2,3,6)
plot(t, x1)
title("N = 100")

err(6) = sum((x - x1).^2);

%% 4.5
N = [2, 5, 10, 20 ,50, 100];

stem(N, err);
%%  functions

function output = u(input)
output = heaviside(input);
end