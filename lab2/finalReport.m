%% ELE632 Lab 2 Report
% Authors: Mai Abdelhameed & Omar Ahmad
%% Part A: Unit Impulse Response

n = [-20:20];

u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
h1_calculated = @(n) ((2/15).*(1/3).^n + 0.2.*(-0.5).^n).*u(n);

% Calculating it using the filter command
impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0); 
B = 1/3;
A = [1 1/6 -1/6];
h1_filter = filter(B,A,impulse(n));

figure;
subplot(2,1,1);
stem(n,h1_calculated(n));
title("Hand calculated h[n] equation");
subplot(2,1,2);
stem(n,h1_filter);
title("h[n] equation using the filter command");