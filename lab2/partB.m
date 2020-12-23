%% B

%zero input response is the output of the system when input is set to zero
%and only initial conditions

b = [2];         % Numerator Coefficients
a = [1, -0.3, -0.1];          % Denominator Coefficients
Y = [1, 2];                % Initial conditions for output
xic = filtic(b,a,Y);   % Finding initial conditions for the system
yzi = filter(b,a,zeros(1,20),xic);   % Zero Input response
stem(yzi)
title('Zero-Input Response');