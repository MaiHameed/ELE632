%% ELE632 Lab 1 Report
% Authors: Mai Abdelhameed & Omar Ahmad
%% Part A: Signal Transformation
%% A.1:

n = [-10:10];   %Creates the range of n, (-10 < n < 10) with steps 
                %of 1 in between  

% A.1-I
impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0);
a = impulse(n-3);

%A.1-II
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);    
    %Creates a unit step function that is usable by
    %calling u(n), the (mod(n,1)==0) term forces the function to be a
    %discrete time function by only saving the values of integer values
    %of n  
b = u(n+1);

%A.1-III
x = @(n) u(n) .* cos((n .* pi) / 5);
c = x(n);
 
%A.1-IV
x1 = @(n) x(n-3);
d = x1(n);
 
%A.1-V
x2 = @(n) x(-n);
e = x2(n);

plots = {a,b,c,d,e}; % a cell of objects that holds variables
titles = {"delta[n-3]", "u[n+1]", "x[n]=cos(pi*n/5)*u[n]", ...
            "x1[n]=x[n-3]", "x2[n]=x[-n]"};

figure
for i = 1:length(plots)
	subplot(length(plots),1,i);
	stem(n,plots{i}); %indexing into a cell using {i} to get 
                      %the i'th element
    title(titles{i});
end

disp('X1[n] is being time shifted. X2[n] is being time reversed.')

%% A.2

clear;

%Note that the range was shortened to -5:35 instead of the original
%-10:70 since there was a lot of unnecessary empty space.
n = [-10:70];

%A.2-I
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
y = @(n) 5*exp(-n/8).*(u(n)-u(n-10));
a = y(n);

%A.2-II
y1 = @(n) y(3*n);
b = y1(n);

%A.2-III
y2 = @(n) y(n/3);
c = y2(n);

plots = {a,b,c};
titles = {"y[n]=5*exp(-n/8)*(u(n)-u(n-10))","y[3n]","y[n/3]"};

figure
for i = 1:length(plots)
	subplot(length(plots),1,i);
	stem(n,plots{i}); 
    title(titles{i});
end

disp('y1[n] and y2[n] are time scaling transforms, a compression and expansion respectively');

%% A.3

clear;

u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
y = @(n) 5*exp(-n/8).*(u(n)-u(n-10));
y2 = @(n) y(n/3);

%A.3-I
u1 = @(n) (n >= 0) * 1.0;
z = @(n) 5*exp(-n/8).*(u1(n)-u1(n-10)); 
y3 = @(n) z(n/3) .* (mod(n,1)==0);
n = [-10:1:70];

figure 
subplot(2,1,1);
stem(n,y2(n));
title("y2[n] from A.2-III");

subplot(2,1,2);
stem(n,y3(n));
title("y3[n]=z[n/3]");

disp('We notice that y3[n] has more data values than y2[n] because of the');
disp('fact that the signal transformation was applied to the continuous'); 
disp('signal first, allowing the sampling to sample values that NOW exist');
disp('in discrete integer values, which previously didnt before stretching' );
disp('the continuous function.');

%% Part B: Recursive Solution of difference equation
%% B.1

disp('y[n] = y[n - 1] + 0.02 * y[n - 1] + x[n]');

%% B.2

clear;

y = zeros(1, 12);
y(1) = 1.02 * 2000;

for i = 2:12
    y(i) = y(i - 1) + 0.02 * y(i - 1);
end

figure;
stem(y);
grid;
title('Zero-Input Response: y[n]');
xlabel('Month');
ylabel('Balance');

%% B.3

clear;

y = zeros(1, 12);
y(1) = 1.02 * 2000 + 100 * 1;

for i = 2:12
    y(i) = y(i - 1) + 0.02 * y(i - 1) + 100 * i;
end

figure;
stem(y);
grid
title('Zero-Input Response: y[n]');
xlabel('Month');
ylabel('Balance');

%% Part C: Design a Filter: N-point maximum filter
%% C.1
% The code below is the contents of the function written inside maxFilter.m
%
% <include>maxFilter.m</include> 
% 

%% C.2
clear; 

n = [0:45];

figure;
subplot(3,1,1);
stem(n,maxFilter(4));
title("Max Filtering with N = 4");
xlabel("N")
ylabel("maxFilter(4)");
subplot(3,1,2);
stem(n,maxFilter(8));
title("Max Filtering with N = 8");
xlabel("N");
ylabel("maxFilter(8)");
subplot(3,1,3);
stem(n,maxFilter(12));
title("Max Filtering with N = 12");
xlabel("N");
ylabel("maxFilter(12)");

%% C.3
disp('As N approaches infinity, the signal approaches a unit step function')
disp('multiplied by the max value of the signal u[n]*max of x[n] ')

%% Part D: Energy and power of a discrete signal
%% D.1
% The code below is the contents of the function written inside D1.m
%
% <include>D_1.m</include> 
% 

%% D.2

[power, energy] = D_1([-9 -6 -3 0 3 6 9], 3)