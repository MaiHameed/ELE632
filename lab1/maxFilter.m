function output = maxFilter(N)

%This function filters a function
%with steps equalling N

n = [0:45];
impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0);
x = @(n) (cos(pi*n/5)+impulse(n-20)-impulse(n-35))...
    * 1.0 .* (mod(n,1)==0); 

f = x(n); %creates an array of output values
f1 = [zeros(1,(N-1)) f]; %pads the beginning with the appropriate
                         %number of zeroes
output = [];
for i = 1:length(f1)-(N-1)
    temp = f1(1:1, i:i+(N-1));
    m = max(temp);
    output = [output m];
end