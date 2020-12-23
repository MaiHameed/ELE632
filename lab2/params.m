function [a,b] = params(N)
%This function will return the generated parameters a and b which
%correspond to the coefficients of the y[n] and x[n] sides respectively
a = [1 zeros(1,(N-1))]; %Creates an N sized array, but only the first 
                        %index has a value of 1
b = [];
for i = 1:N
    b = [b 1/N];
end
