%% C.1
% This example includes the file contents of sine_wave.m into published 
% output. 
% 
% <include>maxFilter.m</include> 
% 
% The file content above is properly syntax highlighted

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