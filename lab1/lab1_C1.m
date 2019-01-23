%% C.1

n = [0:45];
impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0);
x = @(n) (cos(pi*n/5)+impulse(n-20)-impulse(n-35))...
    * 1.0 .* (mod(n,1)==0); 

f1 = x(n); %creates an array of output values
f2 = [[0 0 0] f1]; %pads the beginning with 3 zeroes
temp = f2(1:1, 2:5);
output = [];

N = 4;
for i = 1:length(f2)-(N-1)
    temp = f2(1:1, i:i+(N-1));
    m = max(temp);
    output = [output m];
end

figure;
subplot(2,1,1)
stem(n,f1)
subplot(2,1,2)
stem(n,output)

%{  
for i = 1:length(plots)
	subplot(length(plots),1,i);
	stem(n,plots{i}); 
    title(titles{i});
end
%}