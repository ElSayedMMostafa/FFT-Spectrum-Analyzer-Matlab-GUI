%% RMS Averaging 
function output = RMS_Average(signal,n_blocks)
Len = size(signal,2); %Signal length
N = ceil(Len/n_blocks);  %Size of each block
N = 2^nextpow2(N);
signal2 = zeros(1,n_blocks*N);
signal2(1,1:Len) = signal;
out=zeros(n_blocks,N);
  %% Formulating the signals
for i=1:n_blocks
   out(i,:) = signal2(1,1+(i-1)*N:i*N);
end
   %% Calculating the FFT
for i=1:n_blocks
    out(i,:) = abs(my_fft2(out(i,:),N));
    %out(i,:) = fft(out(i,:),N);
end
output = (1/n_blocks)*sum(out,1); %% THIS IS THE LAST RESULT WE NEED TO PLOT
end

