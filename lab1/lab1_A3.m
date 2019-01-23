%% A.3

u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
y = @(n) 5*exp(-n/8).*(u(n)-u(n-10));
y2 = @(n) y(n/3);

%A.3-I
u1 = @(n) (n >= 0) * 1.0;
z = @(n) 5*exp(-n/8).*(u1(n)-u1(n-10)); 
y3 = @(n) z(n/3) .* (mod(n,1)==0);
n = [-5:1:35];

figure 
subplot(2,1,1);
stem(n,y2(n));
title("y2[n] from A.2-III");

subplot(2,1,2);
stem(n,y3(n));
title("y3[n]=z[n/3]");

%We notice that y3[n] has more data values than y2[n] because of the 
%fact that the signal transformation was applied to the continuous signal
%first, allowing the sampling to sample values that NOW exist in discrete
%integer values, which previously didn't before stretching the continuous
%function. 