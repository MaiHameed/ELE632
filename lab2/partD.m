%% D

%output = zero input response + zero state response
n = [0:20];
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
x = @(n) 2*cos((2/6)*pi*n).*(u(n) - u(n-10));

b = [2];         % Numerator Coefficients
a = [1, -0.3, -0.1];          % Denominator Coefficients
Y = [1, 2];                % Initial conditions for output
xic = filtic(b,a,Y);   % Finding initial conditions for the system
yzi = filter(b,a,zeros(1,21),xic);   % Zero Input response
yzs = filter(b,a,x(n));   % Zero State response
yadded = yzs + yzi;
y = filter(b,a,x(n),xic);   

figure;
subplot(2,1,1);
stem(n,y);
title("Total Response using filter command");
subplot(2,1,2);
stem(n,yadded);
title("Total Response by adding Zero Input Response and Zero State Response");

disp('It is clear to see that both graphs are equal.');