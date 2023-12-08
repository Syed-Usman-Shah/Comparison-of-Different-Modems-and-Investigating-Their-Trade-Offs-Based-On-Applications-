% SSB Demodulation 

% Load the modulated signal
[modulatedSignal, Fs] = audioread('modulated_signal.wav');

% Set the carrier frequency and time vector
fc = 10000;    % Carrier frequency in Hz
t = (0:length(modulatedSignal)-1)'/Fs;

% Set block size
blockSize = 10000;

% Initialize the demodulated signal
demodulatedSignal = zeros(size(modulatedSignal));

% Demodulate the signal block by block
for i = 1:blockSize:length(modulatedSignal)
    % Get the current block of samples
    block = modulatedSignal(i:min(i+blockSize-1, length(modulatedSignal)));
    
    % Demodulate the block using SSB demodulation
    demodulatedSignal(i:min(i+blockSize-1, length(modulatedSignal))) = block .* exp(-1i * 2 * pi * fc * t(i:min(i+blockSize-1, length(modulatedSignal))));
end

% Estimate the bandwidth based on the modulation scheme
bandwidth = max(abs(t));

% Calculate the SNR
signal_power = mean(abs(demodulatedSignal).^2);
noise_power = mean(abs(modulatedSignal - demodulatedSignal).^2);
snr = signal_power / noise_power;

% Calculate the data rate
data_rate = bandwidth * log2(1 + snr);

% Plot the demodulated signal in the time domain
figure;
subplot(2, 1, 1);
plot(t, real(demodulatedSignal));
xlabel('Time (s)');
ylabel('Amplitude');
title('SSB Demodulated Signal (Time Domain)');

% Plot the demodulated signal in the frequency domain
subplot(2, 1, 2);
f = linspace(-Fs/2, Fs/2, length(demodulatedSignal));
demodulated_fft = abs(fftshift(fft(demodulatedSignal)));
plot(f, demodulated_fft);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('SSB Demodulated Signal (Frequency Domain)');

% Save the demodulated signal to a file
filename = 'demodulated_signal.wav';
audiowrite(filename, real(demodulatedSignal), Fs);
disp(['Demodulated signal saved to file: ', filename]);

% Play the demodulated signal
disp('Playing the demodulated signal...');
soundsc(real(demodulatedSignal), Fs);

% Display the calculated parameters
disp(['Bandwidth of the demodulated signal: ', num2str(bandwidth), ' Hz']);
disp(['SNR of the demodulated signal: ', num2str(snr), ]);
disp(['Estimated data rate of the demodulated signal: ', num2str(data_rate), ' bits per second']);