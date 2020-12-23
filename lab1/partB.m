%% Question B.1

disp('y[n] = y[n - 1] + 0.02 * y[n - 1] + x[n]');

%% Question B.2

clear;

y = zeros(1, 12);
y(1) = 1.02 * 2000;
fprintf('y[1]: %f\n', y(1));

for i = 2:12
    y(i) = y(i - 1) + 0.02 * y(i - 1);
    fprintf('y[%u]: %f\n', i, y(i));
end

stem(y);
grid
title('Zero-Input Response: y[n]');
xlabel('Month');
ylabel('Balance');

%% Question B.3

clear;

y = zeros(1, 12);
y(1) = 1.02 * 2000 + 100 * 1;
fprintf('y[1]: %f\n', y(1));

for i = 2:12
    y(i) = y(i - 1) + 0.02 * y(i - 1) + 100 * i;
    fprintf('y[%u]: %f\n', i, y(i));
end

stem(y);
grid
title('Zero-Input Response: y[n]');
xlabel('Month');
ylabel('Balance');