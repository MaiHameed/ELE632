%% E

%system from B
impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0); 
b = [2];         % Numerator Coefficients
a = [1, -0.3, -0.1];          % Denominator Coefficients
h = filter(b,a,impulse(n));   % Zero Input response

%input from C
n = [0:20];
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
x = @(n) 2*cos((2/6)*pi*n).*(u(n) - u(n-10));
%yzs = filter(b,a,x(n));   % Zero State response

S = conv(x(n), h);
stem(S);
title("Zero-State response using conv command");

disp('Matches part C');
disp('It asymptotically stable as the bended input converges to 0.');