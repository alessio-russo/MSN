clc;
close all;
clear;

addpath("utils/");

attempts = 10000;
stats = zeros(1, 3);

for i=1:attempts
    stats = stats + play();
end

stats = stats ./ attempts;
disp(stats);
bar(["keep" "change" "rand"], stats);