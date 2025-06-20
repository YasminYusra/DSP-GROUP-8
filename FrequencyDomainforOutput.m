%continue with previous code

y = filter(b,1,audio_data);
Y = abs(fft(y));

plot(freq_vector(1:N), Y(1:N));     
title('Frequency After Filtering |Y(\omega)|');
xlabel('Frequency (Hz)'); ylabel('Magnitude');

