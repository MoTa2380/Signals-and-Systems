%% Q2-1

clc; clear;
syms x(n) X(z)
oldparam = sympref('HeavisideAtOrigin',1);
x(n) = (1/2j)*(exp(1j*n*pi/4) - exp(-1j*n*pi/4))*heaviside(n);

X(z) = ztrans(x(n));
[numerator, denominator] = numden(X(z));
roots_of_numerator = roots(double(flip(coeffs(numerator))));
roots_of_denominator = roots(double(flip(coeffs(denominator))));
zplane(roots_of_numerator, roots_of_denominator)



%% Q2-2
clc; clear;
syms h1(n)
b = [0 1];
a = [1 -2 0.5];
[r,p,k] = residuez(b,a);
h1(n) = 0;
for i = 1:length(r)
    h1(n) = h1(n) + r(i)*(p(i)^n);
end

d = 0:0.4:6;
stem(d, h1(d))



%% Q2-3
clc; clear;
syms H1(z) h1(n)

H1(z) = (z)/(z^2 - 2*z + 0.5);

h1(n) = iztrans(H1(z));

d = 0:0.4:6;
stem(d, abs(h1(d)))




