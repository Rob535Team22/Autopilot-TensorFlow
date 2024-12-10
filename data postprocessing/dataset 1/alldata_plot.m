% Clear workspace and close all figures
close all;
clear;
clc;

lw = 1.5;

% Load the data from the files
data1 = readtable('data.txt', 'Format', '%s%f', 'ReadVariableNames', false);
data2 = readtable('untrained_predicted_degrees.txt', 'Format', '%f%s', 'ReadVariableNames', false);
data3 = readtable('trained_predicted_degrees.txt', 'Format', '%f%s', 'ReadVariableNames', false);

% Extract the numeric data
values1 = data1.Var2;
values2 = str2double(erase(data2.Var2, ' degrees'));
values3 = str2double(erase(data3.Var2, ' degrees'));

% Define the start and end indices for the range to plot
start_idx = 20000; % Start index
end_idx = 22000;   % End index

% Ensure the selected range does not exceed the data lengths
values1_limited = values1(start_idx:min(end_idx, length(values1)));
values2_limited = values2(start_idx:min(end_idx, length(values2)));
values3_limited = values3(start_idx:min(end_idx, length(values3)));

% Generate an x-axis for the selected range
x = start_idx:min(end_idx, min([length(values1), length(values2), length(values3)]));

% Plot the data
figure;
plot(x, values1_limited, '-', 'DisplayName', 'Actual Data', 'LineWidth', lw); % Plot the first dataset
hold on;
plot(x, values2_limited, '-', 'DisplayName', 'Untrained Predicted Data', 'LineWidth', lw); % Plot the second dataset
plot(x, values3_limited, '-', 'DisplayName', 'Trained Predicted Data', 'LineWidth', lw); % Plot the third dataset
hold off;

% Customize the plot
xlabel('Frame Index');
ylabel('Steering Degrees [deg]');
title(sprintf('Comparison of Steering Degrees (Indices %d-%d)', start_idx, end_idx));
legend('Actual Data', 'Untrained Predicted Data', 'Trained Predicted Data');
grid on;

% Save the plot if needed
saveas(gcf, sprintf('comparison_plot_%d_to_%d_three_datasets.png', start_idx, end_idx));