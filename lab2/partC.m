%% C

%zero state response is the response of system to an input x[n] when all
%the initial conditions are zero
%we can find this response by using the impulse response of the system
clear;
n = [0:20];
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
x = @(n) 2*cos((2/6)*pi*n).*(u(n) - u(n-10));

b = [2];         % Numerator Coefficients
a = [1, -0.3, -0.1];          % Denominator Coefficients

yzs = filter(b,a,x(n));   % Zero State response
stem(yzs)
title('Zero-State Response');
