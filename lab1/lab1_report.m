%% A.1-II

delta = @(n) (n==0) * 1.0
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);    
    %Creates a unit step function that is usable by
    %calling u(n), the (mod(n,1)==0) term forces the function to be a
    %discrete time function by only saving the values of integer values
    %of n  

%{
figure          %Plots the following in the same figure
subplot(2,1,1)  %parameters: stem(total number of rows,
                %                 total number of columns,
                %                 the plot location
%}

%% A.1-IV

%%
a = u(n);
b = u(n+1);         % Applies a time shifting to the step function
c = u(n);
d = u(n);
e = u(n);

plots = {a,b,c,d,e}; % a cell of objects that holds variables
titles = {"delta[n-3]", "u[n+1]", "x[n]=cos(pi*n/5)*u[n]"};


n = [-10:10];   %Creates the range of n, (-10 < n < 10) with steps 
                %of 1 in between  

figure
for i = 1:length(plots)
	subplot(length(plots),1,i)
	stem(n,plots{i}) %indexing into a cell using {i} to get the i'th element
end

%%
% X1[n] is being time shifted. X2[n] is being time reversed.



