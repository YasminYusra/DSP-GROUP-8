%continue with previous code

y = filter(b,1,filtered_audio_2);
Y = abs(fft(y));
f = (0:N-1)*(Fs/N);  
plot(f(1:N), Y(1:N));     
title('Frequency After Filtering |Y(\omega)|');
xlabel('Frequency (Hz)'); ylabel('Magnitude');


