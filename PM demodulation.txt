[PM_audio, Fs] = audioread('recorded_audio10.wav');

% Set the carrier frequency and modulation index
fc = 20000; % Carrier frequency
beta = 5; % Modulation index

% Calculate the time axis
t = (0:length(PM_audio)-1)/Fs;

% Generate the reference carrier signal
carrier_ref = cos(2*pi*fc*t);

% Multiply the modulated signal with the reference carrier signal
mult = PM_audio.*carrier_ref';

% LPF the multiplied signal
[b,a] = butter(10,0.2);
LPF = filter(b,a,mult);

% Differentiate the LPF output
diff_LPF = diff([0; LPF]);

% Perform phase demodulation
phi_hat = zeros(size(LPF));
epsilon = 1e-1; % A small constant to add to the denominator
for i=2:length(LPF)
    phi_hat(i) = phi_hat(i-1) + diff_LPF(i-1)/(LPF(i-1) + epsilon);
end

% Play the demodulated voice signal
soundsc(phi_hat, Fs);