%% 1.1 
clc; clear;
syms s

% %  H1(s)
% H1(s) = (s-1)/(s^3 + 20*s^2 + 10*s + 100);
% [numerator, denominator] = numden(H1(s));
% roots_of_numerator = double(roots(double(flip(coeffs(numerator)))));
% 
% roots_of_denominator = roots(double(flip(coeffs(denominator))));
% zplane(roots_of_numerator, roots_of_denominator)


%H2(s)
H2(s) = 1/(s^4 + 20*s^2 + 10*s + 100);
roots_of_numerator = roots(1);
roots_of_denominator = roots([1 0 20 10 100]);

zplane(roots_of_numerator, roots_of_denominator)





%% 1.2
clc; clear;
syms s
num = (s^2 + 3*s + 5.5)*(s^2 + 4*s + 6)*(s^2 + 0.2*s + 0.01);
denom = (s^2 + 3*s + 5)*(s^2 + 4*s + 3.1)*(s^2 + 0.2*s + 1);

numerator = double(fliplr(coeffs(num)));
denominator = double(fliplr(coeffs(denom)));
sys = tf(numerator, denominator);
h = pzplot(sys);
grid on



%% 1.3
clc; clear;
syms s t
H1(s) = (s-1)/(s^3 + 20*s^2 + 10*s + 100);
H2(s) = 1/(s^4 + 20*s^2 + 10*s + 100);


% unit step response

s1(t) = ilaplace(H1*1/s);
s2(t) = ilaplace(H2*1/s);
domain = linspace(0, 10, 400);
subplot(2,1,1)
plot(domain, s1(domain))
title("unit step response of H1(s)");
subplot(2,1,2)
plot(domain, s2(domain))
title("unit step response of H2(s)");


%% 1.4
clc; clear;
syms s t
G1(s) = (2*s+4.5)/(3*s^2 + 2*s + 7);
G2(s) = (2*s+4.5)/(3*s^2 + 4*s + 7);
G3(s) = (2*s+4.5)/(3*s^2 + 6*s + 7);
% unit impluse response
% h1(t) = ilaplace(G1);
% h2(t) = ilaplace(G2);
% h3(t) = ilaplace(G3);
% domain = linspace(0, 10,700);
% plot(domain, h1(domain))
% 
% hold on
% plot(domain, h2(domain))
% 
% hold on
% plot(domain, h3(domain))
% hold off
%  title("unit impluse response")

% unit step response

s1(t) = ilaplace(G1*1/s);
s2(t) = ilaplace(G2*1/s);
s3(t) = ilaplace(G3*1/s);
domain = linspace(0, 10,700);
plot(domain, s1(domain))

hold on
plot(domain, s2(domain))

hold on
plot(domain, s3(domain))
hold off
title("unit step response")


