function Ac=myconv2(A,kernel)
%function Ac=myconv2(A,kernel)
%2d convolution returing 'same' dimensions but the portion that's affected by 0 padding is replaced by endpoints

%I'm currently assuming kernel is 1xn since my only use case is fluorescent traces. 
% I could extend it to work with mxn kernels if needed...

n=(length(kernel)-1)/2;
n=round(n); %just in case I'm using evenly sized kernel which I shouldn't...

Ac=conv2(A,kernel,'same');

Ac(:,1:n)=repmat(Ac(:,n+1),[1,n]); %replace first n columns by (n+1)th column
Ac(:,end-n+1:end)=repmat(Ac(:,end-n),[1,n]); %replace last (n+1)th to last column
