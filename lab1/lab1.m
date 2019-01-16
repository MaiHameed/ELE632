%% A.1-1
n = (-10:10)';

impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0);
a1 = impulse(n-3);
stem(n, a1)

%% A.1-3
n = [-10:10];
u = @(n) (n >= 0) * 1.0 .* (mod(n, 1) == 0)
x = u(n) .* cos((n .* pi) / 5);
stem(n, x)

%% A.1-5
n = [-10:10];
u = @(n) (n >= 0) * 1.0 .* (mod(n, 1) == 0)
x = @(n) u(n) .* cos((n .* pi) / 5);
x2 = x(-1.0 * n);
stem(n, x2)
