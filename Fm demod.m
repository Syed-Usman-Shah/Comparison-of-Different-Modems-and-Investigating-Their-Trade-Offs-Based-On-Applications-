% FM demodulation
demod_signal = fmdemod(mod_signal, fc, Fs, kf);

% Time vector
t = linspace(0, length(demod_signal)/Fs, length(demod_signal));

% Plot the waveform of the demodulated signal
figure;
plot(t, demod_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Demodulated audio waveform');

% Play the demodulated audio signal
sound(demod_signal, Fs);