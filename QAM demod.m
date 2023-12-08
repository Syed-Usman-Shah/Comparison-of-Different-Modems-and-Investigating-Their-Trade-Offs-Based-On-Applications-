clc;
clear all
clear all
[y,Fs] = audioread('qam.m4a') %the audio signal is stored in the array y and thwe sampled at a sample
max_value = max(y);%medium value of the audio sample
min_value = min(y);%medium value of the audio sample
l = 12;
x = [] %array to store step values
step_size = (max_value - min_value)/(12);%calculating the step \size
i = min_value;
while ((i>=min_value)&(i<=max_value)) %calculating the step vlaues 
x = [x,i];
i = i +step_size;
end
for i = 1:length(y) %Quantization
for j = 1:(length(x)-1) 
if((y(i)>=x(j))&&(y(i)<=x(j+1)))
y1(i) = x(j+1);
end
end
end
figure(2)
plot(y);
title('Original audio signal');
figure(3);
plot(y1);
title('Quantized audio signal');
demodulated = qamdemod(qam,256)
figure(6)
plot(demodulated)