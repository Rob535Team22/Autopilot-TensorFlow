% Clear workspace and close all figures
close all;
clear;
clc;

% Load the CSV file
loss_data = readtable('loss.csv');

% Extract Step and Loss values
steps = loss_data.Step;
loss_values = loss_data.Value;

% Plot the training loss
figure;
plot(steps, loss_values, 'k', 'LineWidth', 1);
xlabel('Training Step');
ylabel('Loss');
title('Training Loss vs. Step');
grid on;

% Save the plot if needed
saveas(gcf, 'training_loss_plot.png');
