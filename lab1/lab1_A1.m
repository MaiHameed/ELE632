%% Part A: Signal Transformation
%% A.1:

% A.1-I
impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0);
a = impulse(n-3);

%A.1-II
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);    
    %Creates a unit step function that is usable by
    %calling u(n), the (mod(n,1)==0) term forces the function to be a
    %discrete time function by only saving the values of integer values
    %of n  
b = u(n+1);

%A.1-III
x = @(n) u(n) .* cos((n .* pi) / 5);
c = x(n);
 
%A.1-IV
x1 = @(n) x(n-3);
d = x1(n);
 
%A.1-V
x2 = @(n) x(-n);
e = x2(n);

plots = {a,b,c,d,e}; % a cell of objects that holds variables
titles = {"delta[n-3]", "u[n+1]", "x[n]=cos(pi*n/5)*u[n]", ...
            "x1[n]=x[n-3]", "x2[n]=x[-n]"};

n = [-10:10];   %Creates the range of n, (-10 < n < 10) with steps 
                %of 1 in between  

figure
for i = 1:length(plots)
	subplot(length(plots),1,i);
	stem(n,plots{i}); %indexing into a cell using {i} to get the i'th element
    title(titles{i});
end

% X1[n] is being time shifted. X2[n] is being time reversed.



