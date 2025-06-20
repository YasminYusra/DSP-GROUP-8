clc;
close all;
clear;
[audio_data, audio_freq] = audioread('audioDSP.wav');

N = length(audio_data);
freq_vector = (0:N-1)*(audio_freq/N);
audio_fd = fft(audio_data);
audio_fdmag = abs(audio_fd);

plot(freq_vector(1:N), audio_fdmag(1:N)); 
title('Frequency Components of Input |S(\omega)|');
xlabel('Frequency (Hz)'); ylabel('Magnitude');