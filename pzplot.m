clc;
close all;

[audio_data, Fs] = audioread('audioDSP.wav');
% (human voice frequency range from 80 - 4000 Hz)
f_low = 780;       % Hz
f_high = 820;      % Hz
% Normalize the cutoff frequencies (MUST be between 0 and 1)
cutoff = [f_low f_high] / (Fs / 2);

% Safety check: if upper cutoff is >= 1, reduce slightly (can't be 1 exactly)
% Step 4: Design the FIR bandpass filter
filter_order = 4;  % sharper filter
[b, a]= butter(filter_order, cutoff, 'stop'); % Filter coefficients

cutoff_lp = [500 2000] /(Fs / 2);
filter_order_2 = 5;
[e, d] = butter(filter_order_2, cutoff_lp, 'bandpass');

%end of filter codes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%plot for filter 1
tiledlayout(1,2);
nexttile
zplane(b,a);
[z1, p1] = tf2zp(b,a);

%plot for filter 2
nexttile
zplane(e,d);
[z2, p2] = tf2zp(e,d);
