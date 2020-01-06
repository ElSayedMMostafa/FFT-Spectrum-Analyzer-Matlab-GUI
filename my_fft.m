function F = my_fft(X)
N = size(X,2);
number_stages = log2(N);

for stage=1:number_stages-1
if stage == 1   %Bit reverse happens in only the first stage.
    X = bitrevorder(X);
end
X1 = zeros(N/2^stage,2^stage);
Rs = size(X1,1); Cs = size(X1,2); % Rows and columns of the new formulated 2D Array
%% Formulation of the group
ii=1;   % such as STATIC variable in C++
for i=1:2^stage:Rs*Cs
    X1(ii,:)=X(1,i:i+2^stage-1);
    ii=ii+1;
end  %at the end of this for loop, we have our MATRIX
%% Muliplications
 NewX=zeros(1,N);
  ii=1;
 for r = 1:Rs % loop On number of Rows
     for c = 1:1:Cs/2 %loop on 1/2 number of columns
          NewX(1,ii)            = X1(r,c)+twiddlefactor(c-1,2^stage)*X1(r,c+2^(stage-1));
          NewX(1,ii+2^(stage-1)) = X1(r,c)+twiddlefactor((c-1)+2^(stage-1),2^stage)*X1(r,c+2^(stage-1));
         if stage==1 
            ii=ii+2;
        else ii=ii+1;
        end
     end
    if stage ~=1
        ii=ii+2^(stage-1);
    end
 end
 X = NewX;
end
 NewX = X; %Important only at N=2; as I do no loops
%% last stage
stage = log2(N);
for c=1:N/2 
    F(1,c)             = NewX(1,c)+twiddlefactor(c-1,2^stage)*NewX(1,c+2^(stage-1));
    F(1,c+2^(stage-1)) = NewX(1,c)+twiddlefactor(c-1+2^(stage-1),2^stage)*NewX(1,c+2^(stage-1));
end
end