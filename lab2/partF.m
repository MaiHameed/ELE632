%% Part F: Moving average filter

% #1
disp('For Q.1:');
disp('A is equal to 1');
disp('B is equal to the N numbered sum of 1/N');

% #3
impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0);
x = @(n) cos(pi*n/5)+impulse(n-30)-impulse(n-35);

n = [0:45];

[a,b] = params(4);
[a2,b2] = params(8);
[a3,b3] = params(12);

figure;
subplot(3,1,1);
stem(n,filter(b,a,x(n)));
title("Filter with N = 4");

subplot(3,1,2);
stem(n,filter(b2,a2,x(n)));
title("Filter with N = 8");

subplot(3,1,3);
stem(n,filter(b3,a3,x(n)));
title("Filter with N = 12");

disp('The average value for a cosine signal is 0, so as N increases, the');
disp('resulting filtered signal approaches 0, and the effect of the impulse');
disp('on the size of the output signal decreases.');