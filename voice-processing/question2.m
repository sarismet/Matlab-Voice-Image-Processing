%we define the figures
f1 = figure;
f2 = figure;
f3 = figure;
%calling The first one. This figure shows the undersampling
figure(f1);
F1 = 1; %the first frequency, we will find the second frequency by multipling it by 4.
Fs = 4; % this is the sampling rate's frequencys. Since we expect the Nyquist is 8 then we need to select lower value.
tmin = 0; % In pdf the time interval was 0:20 so I define it here like it.
tmax = 20;
t = tmin:0.01:tmax; % and to have continious signal increase 0.01
x1 = cos(2 * pi * F1 * t) + cos(2 * pi * 4 * F1 * t); % we get the original signal here. f1=1 f2=4 (4.f1)
Ts = 1 / Fs; %To get the period.
ts = tmin:Ts:tmax; %Here we get the sampling rate's time interval by increasing 1/Fs
% or we can increase again 0.01 and as constructin the signal we can divide the inside of cos by Fs.
x1resampled = cos(2 * pi * F1 * ts) + cos(2 * pi * 4 * F1 * ts); % and we create the sample's signal(The signal look like sticks)
x1reconstructed = zeros(1, length(t)); %Here we create the signal we will reconstruct. Initialize it by all zeros with lenght of original one.
samples = length(ts); %then we take the samples of the sampling signal
% here we try to reconstruct the original signal
% first we traverse the first loop with length original one
for index = 1:1:length(t)
    % and we traverse the second loop with length the sample signal.
    for n = 1:1:samples
        % each iteration we add the multiplication of the value of sample signal and sinc function. we substruct 1 to eliminate the zero at the beginning.
        x1reconstructed(index) = x1reconstructed(index) + x1resampled(n) * sinc(((index - 1) * 0.01 - (n - 1) * (1 / Fs)) / (1 / Fs));
    end
end
%after reconstruction we plot the original one then hold on and plot the sample signal then plot the recostrcuted signal.
plot(t, x1)
hold on
stem(ts, x1resampled, 'color', 'r')% The clour of samples are red since orange is not visible a lot.
plot(t, x1reconstructed, '-y')
title("Under-sampling")
%All the logic is the same as above.
figure(f2);
F1 = 1; %the first frequency, we will find the second frequency by multipling it by 4.
Fs = 12; % this is the sampling rate's frequencys. Since we expect the Nyquist is 8 then we need to select higher value.
tmin = 0;
tmax = 20;
t = tmin:0.01:tmax;
x1 = cos(2 * pi * F1 * t) + cos(2 * pi * 4 * F1 * t);
Ts = 1 / Fs;
ts = tmin:Ts:tmax;
x1resampled = cos(2 * pi * F1 * ts) + cos(2 * pi * 4 * F1 * ts);
x1reconstructed = zeros(1, length(t));
samples = length(ts);
for index = 1:1:length(t)
    for n = 1:1:samples
        x1reconstructed(index) = x1reconstructed(index) + x1resampled(n) * sinc(((index - 1) * 0.01 - (n - 1) * (1 / Fs)) / (1 / Fs));
    end
end
plot(t, x1)
hold on
stem(ts, x1resampled, 'color', [0.9100 0.4100 0.1700])
plot(t, x1reconstructed, '-y')
title("Over-sampling")
%All the logic is the same as above.
figure(f3);
F1 = 1;
Fs = 8;
tmin = 0;
tmax = 20;
t = tmin:0.01:tmax;
x1 = cos(2 * pi * F1 * t) + cos(2 * pi * 4 * F1 * t);
Ts = 1 / Fs;
ts = tmin:Ts:tmax;
x1resampled = cos(2 * pi * F1 * ts) + cos(2 * pi * 4 * F1 * ts);
x1reconstructed = zeros(1, length(t));
samples = length(ts);
for index = 1:1:length(t)
    for n = 1:1:samples
        x1reconstructed(index) = x1reconstructed(index) + x1resampled(n) * sinc(((index - 1) * 0.01 - (n - 1) * (1 / Fs)) / (1 / Fs));
    end
end
plot(t, x1)
hold on
stem(ts, x1resampled, 'color', [0.9100 0.4100 0.1700])
plot(t, x1reconstructed, '-y')
title("Average-sampling")
