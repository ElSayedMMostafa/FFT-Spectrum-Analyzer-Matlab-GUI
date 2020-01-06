%% Zero padding
function output=MyZeroPadding(signal,kernelRows,kernelCols)
[signalRows,signalCols]=size(signal);
output=zeros(signalRows+2*kernelRows-2,signalCols+2*kernelCols-2);
for i=1:signalRows
    for j=1:signalCols
        output(i+kernelRows-1,j+kernelCols-1)=signal(i,j);
    end
end
end