%In this script we try to design average filter for general cases.
%=== Taking the name of the file that we make clean===
TheNameOFFile = input("Enter The Name Of the sample file : ", 's')
[sample_signalx, Fs] = audioread(TheNameOFFile); % to read the sample noisy audio
sample_signal = sample_signalx(:, 1); % to take the clean audio.
Duration_of_our_signal = length(sample_signal)
arraysize = 225;
sample_TR = ones(1, arraysize) / arraysize;
Cleaned_Signal = cconv(sample_signal, sample_TR, Duration_of_our_signal);
sound(Cleaned_Signal, Fs)% to see the clean audio
taken_clean_ftt = fft(Cleaned_Signal); 
t = linspace(0, Duration_of_our_signal / Fs, Duration_of_our_signal)
f = (0:Duration_of_our_signal - 1) * (Fs / Duration_of_our_signal);
subplot(5, 1, 1)
plot(f, Cleaned_Signal)
title("Clean Signal and Frequency plot ")
xlabel('Frequency')
ylabel('value')
subplot(5, 1, 2)
plot(t, Cleaned_Signal)
title("Clean Signal and Time plot ")
xlabel('Time')
ylabel('value')
taken_noisy_ftt = fft(sample_signal);
subplot(5, 1, 3)
plot(f, sample_signal)
title("Noisy Signal and Frequency plot ")
xlabel('Frequency')
ylabel('value')
subplot(5, 1, 4)
plot(t, sample_signal)
title("Noisy Signal and Time plot ")
xlabel('Time')
ylabel('value')
our_overall_filter_response = taken_clean_ftt ./ taken_noisy_ftt
% to have frequency response of my ideal filter
y0 = fftshift(our_overall_filter_response);
power0 = abs(y0).^2 / Duration_of_our_signal;
subplot(5, 1, 5)
plot(f, power0)
title("Power and Frequency plot of filter ")
xlabel('Frequency')
ylabel('value')
