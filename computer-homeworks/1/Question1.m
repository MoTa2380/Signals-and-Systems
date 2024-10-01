%% 1.1
clc; clear;

subplot(2,2,1)
n = -100:100;
S1 = ((0.98).^n).*sin((0.2*pi*n) + (0.05*pi));
stem(n, S1);
title("S1[n]");


subplot(2,2,2)
n = -100:100;
S2 = formula(n);
stem(n, S2)
title("S2[n]");


subplot(2, 2, 3)
n = 1:100;
S3 = log10(sqrt(n));
stem(n, S3)
title("S3[n]");


syms k;
n = -100:100;
S4 = zeros(201,1);
for i = -100:100
S4(i+101) = symsum(formula2(k),k,-100,i);
end
subplot(2,2,4)
stem(n, S4)
title("S4[n]");


%% 1.2

clc; clear;

subplot(2,1,1)
n = linspace(-100,100, 201000);
S1 = ((0.98).^n).*sin((0.2*pi*n) + (0.05*pi));
plot(n, S1);
title("S1(t)");




subplot(2, 1, 2)
n = linspace(1,100, 100000);
S3 = log10(sqrt(n));
plot(n, S3)
title("S3(t)");


%% 1.3

% 
% t = linspace(-10, 10, 21000);
% f1 = exp(1j*0.5*pi*t);
% 
% subplot(2,2,1)
% plot(t, real(f1))
% title("Real");
% 
% subplot(2,2,2)
% plot(t, imag(f1))
% title("Imaginary");
% 
% subplot(2,2,3)
% plot(t, abs(f1))
% title("absolute value");
% 
% subplot(2,2,4)
% plot(t, angle(f1))
% title("Phase");
% 
% 





t = linspace(-pi/4, pi/4, pi*1000);
f2 = tanh(1j*pi*t);

subplot(2,2,1)
plot(t, real(f2))
title("Real");

subplot(2,2,2)
plot(t, imag(f2))
title("Imaginary");

subplot(2,2,3)
plot(t, abs(f2))
title("absolute value");

subplot(2,2,4)
plot(t, angle(f2))
title("Phase");


%%  functions


function output = formula(n)
    if mod(n, 2) == 0
        output = sin(0.1*n).*exp(0.02*n);
    else
        output = cos(0.1*n).*exp(-0.02*n);
    end
        
end





function output = formula2(n)
    if mod(n, 2) == 0
        output = sin(0.1*n).*exp(0.02*n)*((0.98).^n).*sin((0.2*pi*n) + (0.05*pi));
    else
        output = cos(0.1*n).*exp(-0.02*n)*((0.98).^n).*sin((0.2*pi*n) + (0.05*pi));
    end
        
end











