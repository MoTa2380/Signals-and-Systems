% Question 8
clc; clear;
addpath('musics/');
[audio, Fs] = audioread("music2.mp3");
downsampled_Fs = 8000;
resampled_audio = resample(audio, downsampled_Fs, Fs);
leng = 4*Fs; % getting 20s of music 2
test_audio = resampled_audio(1:leng);
std = 0.1;
SNR = 5; % 1: SNR = 20, 2: SNR = 10, SNR = 5, SNR = 2, SNR = 1,
noise = randn(1, leng)*std/db2mag(SNR);
test_audio = test_audio + noise;
sound(test_audio)
audiowrite("music24.wav", test_audio, downsampled_Fs);
