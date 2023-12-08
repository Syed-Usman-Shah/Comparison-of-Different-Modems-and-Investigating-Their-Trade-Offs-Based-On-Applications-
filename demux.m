%DEMULTIPLEXED 

% Load the demodulated audio signal
[audioMultiplexed, Fs] = audioread('demodulated_signal.wav');

% Split the audio signal into four parts
len = length(audioMultiplexed);
len1 = round(len/4);
len2 = round(len1*2);
len3 = round(len1*3);

audio1 = audioMultiplexed(1:len1);
audio2 = audioMultiplexed(len1+1:len2);
audio3 = audioMultiplexed(len2+1:len3);
audio4 = audioMultiplexed(len3+1:len);

% Specify the file paths for saving the demultiplexed audio files
filename1 = 'C:\Users\icl\Downloads\demultiplexed_audio1.wav';
filename2 = 'C:\Users\icl\Downloads\demultiplexed_audio2.wav';
filename3 = 'C:\Users\icl\Downloads\demultiplexed_audio3.wav';
filename4 = 'C:\Users\icl\Downloads\demultiplexed_audio4.wav';

% Save the demultiplexed audio to files
audiowrite(filename1, audio1, Fs);
audiowrite(filename2, audio2, Fs);
audiowrite(filename3, audio3, Fs);
audiowrite(filename4, audio4, Fs);

disp('Demultiplexed audio saved to files');