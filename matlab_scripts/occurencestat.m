filename = 'colormap.xlsx';

% Read the entire data
col = readmatrix(filename);

% Extract the 5th column
data = col(1:274, 4);

% Step 1: Count occurrences of each number from 1 to 12
edges = 0.5:1:12.5;         % Define bin edges to include integers 1–12
counts = histcounts(data, edges);  % Count the occurrences for each bin (1–12)

% Step 2: Create a heatmap
figure;                     % Open a new figure window
heatmap(1:12, {'Count'}, counts, 'Colormap', parula);
h.GridVisible = 'on';                % Turn on grid lines
h.ColorScaling = 'scaledrows';       % Adjust color scaling per row (optional)
h.FontSize = 12;                     % Increase font size for better visibility
h.XLabel = 'Months (1-12)';          % Label for X-axis
h.YLabel = '';                       % Remove or leave Y-axis empty (optional)
h.Title = 'Occurrences of Numbers (1–12)'; % Add a custom title

% Step 4: Adjust cell and grid spacing (optional)
h.CellLabelFormat = '%0.0f';         % Format labels to display as integers

% Step 3: Customize the heatmap
%title('Occurrences of Numbers (1-12)');
xlabel('Months');
ylabel('Occurrences');
