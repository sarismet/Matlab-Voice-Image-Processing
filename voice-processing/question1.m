%Here we are defining our figures
f1 = figure;
f2 = figure;
f3 = figure;
f4 = figure;
%call the first figure
figure(f1);
%we define the time interval according to the one in the pdf
t = 0:0.001:.12;
T0 = 0.04; %Period
fs = 1 / T0; %this is frequency
y1 = (sawtooth(fs * 2 * pi * t, 0.5) + 1) / 2; % this return us the function we want.
plot(t, y1); % and plot it
%call second figure
figure(f2);
y = normalize(fft(y1)); %discrete fourier transform and normalize as you mentioned
shift_y = fftshift(y);
n = length(y1); % to take number of samples
f0 = (-n / 2:n / 2 - 1) * (fs / n); % 0-centered frequency range
plot(f0, abs(shift_y).^2 / n); % here we get the magnitude.
%call third figure
figure(f3);
%the same process
t = 0:0.001:.12;
T0 = 0.04;
fs = 1 / T0;
%Here we find the first and third harmonic series.
x1 = (-2 / (pi * pi)) * cos(2 * pi * fs * t);
x3 = (-2 / (25 * pi * pi)) * cos(5 * 2 * pi * fs * t);
%By adding them up we get the new signal which resamples the original one a little.
z = x1 + x3 + 1/2; % we add 1/2 since a0 is 1/2.
plot(t, z);
%calling the last figure
figure(f4);
%Here we found the all harmonic series through x1 to x11
x1 = (-2 / (pi * pi)) * cos(2 * pi * fs * t);
x2 = (-2 / (9 * pi * pi)) * cos(3 * 2 * pi * fs * t);
x3 = (-2 / (25 * pi * pi)) * cos(5 * 2 * pi * fs * t);
x4 = (-2 / (49 * pi * pi)) * cos(7 * 2 * pi * fs * t);
x5 = (-2 / (81 * pi * pi)) * cos(9 * 2 * pi * fs * t);
x6 = (-2 / (121 * pi * pi)) * cos(11 * 2 * pi * fs * t);
x7 = (-2 / (169 * pi * pi)) * cos(13 * 2 * pi * fs * t);
x8 = (-2 / (225 * pi * pi)) * cos(15 * 2 * pi * fs * t);
x9 = (-2 / (17 * 17 * pi * pi)) * cos(17 * 2 * pi * fs * t);
x10 = (-2 / (19 * 19 * pi * pi)) * cos(19 * 2 * pi * fs * t);
x11 = (-2 / (21 * 21 * pi * pi)) * cos(21 * 2 * pi * fs * t);
% and summing them up to get the new signal that resamples thhe original one a lot.
z = x1 + x2 +x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + 1/2;
plot(t, z);
