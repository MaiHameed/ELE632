%% B. Inverse DTFS and time shifting property

%% B.1

N0 = 32; 
n = (0:31); 
w0 = pi/16;
Xr = [ones(1,5) zeros(1,23) ones(1,4)]; 

for r = 0:31
    xn(r+1) = sum(Xr.*exp(j*n*(pi/16)*r));
end
r=n;
figure;
stem(n,xn)
xlabel('n'); 
title('x[n]');

%% B.2

N0 = 32; 
n = (0:31); 
w0 = pi/16;
Xr = [ones(1,5) zeros(1,23) ones(1,4)].*exp(-j*5*(pi/16)*n); 


for r = 0:31
    xn(r+1) = sum(Xr.*exp(j*n*(pi/16)*r));
end
r = n;
figure;
stem(r, xn);
xlabel('n');
title('x[n]');

disp('x[n] of B.2 is a shifted version of the x[n] of B.1 by 5.');