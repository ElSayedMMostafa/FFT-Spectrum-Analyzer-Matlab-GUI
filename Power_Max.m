function [power,maxi,i_maxi]=Power_Max(signal)
% This function returns (The power) of the singal,
%and the Maximum point in the specturm (its value and index)

%% The power of the signal
N = size(signal,2);
%signal_FFT = abs(fft(signal));
signal_FFT = signal; %assume that the input is the fft signal.
signal = signal.^2;
power = sum(signal)/N;
%% Get the maximum of the specturum 
maxi = signal_FFT(1);
i_maxi =1;
for i=2:N
    if signal_FFT(i) > maxi
        i_maxi = i;
        maxi = signal_FFT(i);
    end
end
end