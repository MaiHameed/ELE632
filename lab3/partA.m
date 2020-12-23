%% ELE632 Lab 3 Report
% Authors: Mai Abdelhameed & Omar Ahmad
%% A. Discrete-Time Fourier Series
%% A.1

%x[n] = 4cos((12/5) pi n) + 2sin((16/5) pi n)
disp('fundamental frequency w0 = 0.4pi')
disp('fundamental period N0 = 5')

%% A.2

N0 = 5; 
w0= 0.4*pi;

n =(0:4);   %0:N0-1 

x = @(n) (4.*cos(2.4.*pi.*n) + 2.*sin(3.2.*pi.*n));

for r = 0:4
    xr(r+1) = sum(x(n).*exp(-j*r*(0.4*pi)*n))/5;
end

r = n;

subplot(3,1,1);
a = (0:4);
b = x(a);
stem(a, b);
title('x[n]');

subplot (3,1,2);
stem(r, abs(xr));
title ('Dr');

subplot  (3,1,3);
stem(r, angle(xr));
title ('angle Dr');

%% A.3

N0 = 6; 
w0= pi/3;

n =(0:5);   %0:N0-1 
yn = [3 2 1 0 1 2];

for r = 0:5
    yr(r+1) = sum(yn.*exp(-j*r*(pi/3)*n))/6;
end

r = n;

subplot(3,1,1);
a = (0:5);
stem(a, yn);
title('y[n]');

subplot (3,1,2);
stem(r, abs(yr));
title ('|Y(r)|');

subplot  (3,1,3);
stem(r, angle(yr));
title ('angle Y(r)');
