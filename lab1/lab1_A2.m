%% A.2

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

%Note that the range was shortened to -5:35 instead of the original
%-10:70 since there was a lot of unnecessary empty space.
n = [-5:35];

figure
for i = 1:length(plots)
	subplot(length(plots),1,i);
	stem(n,plots{i}); %indexing into a cell using {i} to get the i'th element
    title(titles{i});
end

%y1[n] and y2[n] are time scaling transforms, a compression and expansion 
%respectively