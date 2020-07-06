%In tthis code we complete the 1/3 part of question3.
[our_clean_sample_signal, fs_clean] = audioread('c_p232_090.wav'); % to read the our clean audio
our_clean_signal = our_clean_sample_signal(:, 1); % to take the clean audio.
taken_clean_ftt = fft(our_clean_signal); %
Duration_of_our_clean_signal = length(our_clean_signal)
t = linspace(0, Duration_of_our_clean_signal / fs_clean, Duration_of_our_clean_signal)
f = (0:Duration_of_our_clean_signal - 1) * (fs_clean / Duration_of_our_clean_signal);
subplot(5, 1, 1)
plot(f, our_clean_signal)
title("Clean Signal and Frequency plot ")
xlabel('Frequency')
ylabel('value')
subplot(5, 1, 2)
plot(t, our_clean_signal)
title("Clean Signal and Time plot ")
xlabel('Time')
ylabel('value')
[our_noisy_sample_signal, fs_noisy] = audioread('n_p232_090.wav'); % to read the nosiy music
our_noisy_signal = our_noisy_sample_signal(:, 1); % to take the clean audio.
Duration_of_our_noisy_signal = length(our_noisy_signal)
% it is important to specify the duration of output signal
taken_noisy_ftt = fft(our_noisy_signal);
t2 = linspace(0, Duration_of_our_noisy_signal / fs_noisy, Duration_of_our_noisy_signal)
f2 = (0:Duration_of_our_noisy_signal - 1) * (fs_noisy / Duration_of_our_noisy_signal);
subplot(5, 1, 3)
plot(f2, our_noisy_signal)
title("Noisy Signal and Frequency plot ")
xlabel('Frequency')
ylabel('value')
subplot(5, 1, 4)
plot(t2, our_noisy_signal)
title("Noisy Signal and Time plot ")
xlabel('Time')
ylabel('value')
our_overall_filter_response = taken_clean_ftt ./ taken_noisy_ftt% to have frequency response of my filter 
y0 = fftshift(our_overall_filter_response);
power0 = abs(y0).^2 / Duration_of_our_noisy_signal;
subplot(5, 1, 5)
plot(f, power0)
title("Power and Frequency plot of filter ")
xlabel('Frequency')
ylabel('value')
In_Time_Domain_Response = ifft(our_overall_filter_response)% take the inverve fft to chance the domain
output = cconv(our_noisy_signal, In_Time_Domain_Response, Duration_of_our_noisy_signal)
% and take convolution to have clean audio
audiowrite("newCleanaudio.wav", output, fs_clean)
