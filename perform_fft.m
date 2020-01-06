function output = perform_fft(sig,N)

L = size(sig,2);  % Get the actual length if the signal entered
%N = 2^ceil(log2(L)); % Get the log2 integer near this N
signal = zeros(1,N);
signal(1,1:L)=sig; %Create new signal 2^n with zero baading

output = my_fft(signal);

end