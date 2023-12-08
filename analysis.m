%ANALYSIS FOR ALL

% Load the demodulated audio signal
[demodulatedSignal, fs] = audioread('demodulated_signal.wav');

% Calculate the bandwidth
bandwidth = (length(demodulatedSignal) / fs);

% Calculate the noise power
noiseSignal = demodulatedSignal - mean(demodulatedSignal);
noisePower = mean(noiseSignal.^2);

% Calculate the signal power
signalPower = mean(demodulatedSignal.^2);

% Calculate the SNR
SNR = 10 * log10(signalPower / noisePower);

% Estimate the number of transmitted bits
numBits = round(bandwidth * length(demodulatedSignal) / fs); % Estimate based on bandwidth and signal duration

% Time duration in seconds
duration = length(demodulatedSignal) / fs;

% Calculate the data rate
dataRate = numBits / duration;

% Display the bandwidth, SNR, and data rate
disp(['Bandwidth of the demodulated signal: ', num2str(bandwidth), ' Hz']);
disp(['SNR of the demodulated signal: ', num2str(SNR), 'dB']);
disp(['Data Rate: ', num2str(dataRate), ' bits per second']);