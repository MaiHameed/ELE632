%% Question D.1

function [power,energy] = D_1(x,N)
n = length(x);

thingy = (2 * N) + 1;
power = (1 / thingy) .* sum(abs(x .^ 2));
energy = sum(abs(x .^ 2));
end 