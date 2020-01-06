function window = generate_window(window_index,N)
%% Window Index
 % 0 --> Rectangle
 % 1 --> Triangle
 % 2 --> Hanning
 % 3 --> Hamming

%N = 50; %Window leength
if window_index ==0
%% Rect
window = ones(1,N);
end
if window_index ==1
%% Triangle
if rem(N,2) ~= 0
    N=N+1;
end
window = zeros(1,N);
for i=1:N/2
    window(1,i)=i-1;
end
for i=N/2+1:N
    window(1,i)=N-i;
end
end

if window_index ==2
%% Hanning
x = 0:0.1:N;
window = 0.5-0.5*cos(2*pi*x/N);
end
if window_index ==3
 %% Hamming
 x = 0:0.1:N;
 window = 0.54-0.46*cos(2*pi*x/N);
end
    %plot(window);
end