function[Nbar] = rscale(a,b,c,d,k) 

if (nargin==2), % System form 
    
    [A,B,C,D] = ssdata(a); K=b;

elseif (nargin==5), % A,B,C,D matrices A=a;
    A = a;
    B = b;
    C = c;
    D = d;
    K = k;
else
    error('Input must be of the form (sys,K) or (A,B,C,D,K)')
end;

% compute Nbar s = size(A,1);
s = size(A,1);
Z = [zeros([1,s]) 1];
N = inv([A,B;C,D])*Z';
Nx = N(1:s);
Nu = N(1+s);
Nbar = Nu + K*Nx; 