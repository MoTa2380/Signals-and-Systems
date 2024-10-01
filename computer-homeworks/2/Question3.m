%% 3.1
clc; clear;

syms f(x) g1(x) g2(x) g3(x) g4(x) g5(x) g6(x)

f(x) = sin(x)/(pi*x);

g1(x) = f(x-2);
g2(x) = exp(1j*x/2)*f(x);
g3(x) = f(2*x);
g4(x) = cos(2*x)*f(x);
g5(x) = diff(f(x), x);
g6(x) = x*f(x);

%% 3.2
clc; clear;
syms f(x) g1(x) g2(x) g3(x) g4(x) g5(x) g6(x) F(w) G1(w) G2(w) G3(w) G4(w) G5(w) G6(w)

f(x) = sin(x)/(pi*x);

g1(x) = f(x-2);
g2(x) = exp(1j*x/2)*f(x);
g3(x) = f(2*x);
g4(x) = cos(2*x)*f(x);
g5(x) = diff(f(x), x);
g6(x) = x*f(x);




F(w) = fourier(f(x));
G1(w) = fourier(g1(x));
G2(w) = fourier(g2(x));
G3(w) = fourier(g3(x));
G4(w) = fourier(g4(x));
G5(w) = fourier(g5(x));
G6(w) = fourier(g6(x));


w = linspace(-10, 10, 200);


% G1------------------------------------------------------------



% subplot(2, 2, 1)
% plot(w, abs(F(w)));
% title("magnitude of F(w)")
% 
% subplot(2, 2, 2)
% plot(w, angle(F(w)));
% title("angle of F(w)")
% 
% subplot(2, 2, 3)
% plot(w, abs(G1(w)));
% title("magnitude of G1(w)")
% 
% subplot(2, 2, 4)
% plot(w, angle(G1(w)));
% title("angle of G1(w)")
% 



% G2------------------------------------------------------------


% subplot(2, 2, 1)
% plot(w, abs(F(w)));
% title("magnitude of F(w)")
% 
% subplot(2, 2, 2)
% plot(w, angle(F(w)));
% title("angle of F(w)")
% 
% subplot(2, 2, 3)
% plot(w, abs(G2(w)));
% title("magnitude of G2(w)")
% 
% subplot(2, 2, 4)
% plot(w, angle(G2(w)));
% title("angle of G2(w)")
% 
% 

% G3------------------------------------------------------------


% subplot(2, 2, 1)
% plot(w, abs(F(w)));
% title("magnitude of F(w)")
% 
% subplot(2, 2, 2)
% plot(w, angle(F(w)));
% title("angle of F(w)")
% 
% subplot(2, 2, 3)
% plot(w, abs(G3(w)));
% title("magnitude of G3(w)")
% 
% subplot(2, 2, 4)
% plot(w, angle(G3(w)));
% title("angle of G3(w)")
% 
% 


% G4------------------------------------------------------------


subplot(2, 2, 1)
plot(w, abs(F(w)));
title("magnitude of F(w)")

subplot(2, 2, 2)
plot(w, angle(F(w)));
title("angle of F(w)")

subplot(2, 2, 3)
plot(w, abs(G4(w)));
title("magnitude of G4(w)")

subplot(2, 2, 4)
plot(w, angle(G4(w)));
title("angle of G4(w)")








