function output = my_fft2(varargin)
signal = varargin{1};
L = length(signal);
if(L > 2^16)
    signal = signal(1:2^16);
end
if (nargin == 1)
    %% only 1 argument(signal)
    output=my_fft(signal);
else    
    %% two arguments (signal, N-DFT)
    N = varargin{2};
    if(L>N)
        signal = signal(1:N);
        output = my_fft(signal);
    else
        signal2 = zeros(1,N);
        signal2(1:L) = signal;
        output = my_fft(signal2);
    end
end
end