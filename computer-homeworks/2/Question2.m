%% 2.1
clc; clear;

syms f(x) g(x)

t = linspace(-10, 10, 400);
f(x) = 1/(1-x^3);
g(x) = x^2*exp(-x)*heaviside(x);


subplot(1, 2, 1)
plot(t, f(t))
title("f(x)")


subplot(1, 2, 2)
plot(t, g(t))
title("g(x)")



%% 2.2
clc; clear;

syms F(w) G(w) f(x) g(x)

f(x) = 1/(1-x^3);
g(x) = x^2*exp(-x)*heaviside(x);
F(w) = fourier(f(x));
G(w) = fourier(g(x));

w = linspace(-10, 10, 200);


%  Fourier transform of f(t)
subplot(2, 2, 1)
plot(w, abs(F(w)))
title("magnitude of F(w)")


subplot(2, 2, 2)
plot(w, angle(F(w)))
title("angle of F(w)")


%  Fourier transform of g(t)
subplot(2, 2, 3)
plot(w, abs(G(w)))
title("magnitude of G(w)")


subplot(2, 2, 4)
plot(w, angle(G(w)))
title("angle of G(w)")











