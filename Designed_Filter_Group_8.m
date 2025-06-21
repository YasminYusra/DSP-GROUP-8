% Step 1: Read audio file
[audio_data, Fs] = audioread('audioDSP.wav');
sound(audio_data, Fs);
pause(3);

% (human voice frequency range from 80 - 4000 Hz)
f_low = 780;       % Hz
f_high = 820;      % Hz
% Normalize the cutoff frequencies (MUST be between 0 and 1)
cutoff = [f_low f_high] / (Fs / 2);

% Safety check: if upper cutoff is >= 1, reduce slightly (can't be 1 exactly)
% Step 4: Design the FIR bandpass filter
filter_order = 4;  % sharper filter
[b, a]= butter(filter_order, cutoff, 'stop'); % Filter coefficients
% Step 5: Apply the filter
filtered_audio = filter(b, a, audio_data);
% Step 6: Play and save the filtered result
sound(filtered_audio, Fs);
pause(3);
cutoff_lp = [500 2000] /(Fs / 2);
filter_order_2 = 5;
[e, d] = butter(filter_order_2, cutoff_lp, 'bandpass');
filtered_audio_2 = filter(e, d, filtered_audio);

sound(filtered_audio_2, Fs);
pause(3);
audiowrite('filtered_audio.wav', filtered_audio, Fs);