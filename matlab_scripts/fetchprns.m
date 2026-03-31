% Define the arrays
array1 = [5, 20, 29, 4, 11, 23, 31, 26, 10, 25, 19, 28]; % Numbers in Array 1

% Calculate the sizes
size1 = length(array1);

% Remaining numbers not in the array
total_numbers = 32;
others = total_numbers - size1;

% Data for the pie chart
data = [size1, others];

% Labels for the pie chart
labels = {
    ['PRNS involved: [' num2str(array1) ']'];   % Label for Array 1
    ['Remaining PRNs'] % Label for Others
};
% Define custom colors for pie sections
colors = [0.1 0.6 0.8;  % Color for Array 1 (light blue)
          0.9 0.9 0.9]; % Color for Others (light red)

% Plot the 3D pie chart
figure;
h = pie(data); % h contains handles to chart elements

% Change the color of pie slices
for k = 1:length(data)
    h(2*k-1).FaceColor = colors(k, :); % Apply custom colors to the slices
end

% Add labels to the pie chart
for k = 1:length(data)
    h(2*k).String = labels{k}; % Apply custom labels
    h(2*k).FontSize = 10;      % Optional: Adjust font size for better readability
end


