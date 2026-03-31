filename = 'cleanevents.xlsx';

% Read the entire data
data = readmatrix(filename);

%variables to plot
events = data(1:37, 7);
ampdur = data(1:37, 8);
phasedur = data(1:37, 9);

% % Get unique values and their counts for ampdur
% [unique_ampdur, ~, idx_ampdur] = unique(ampdur);
% count_ampdur = accumarray(idx_ampdur, 1);
% 
% % Get unique values and their counts for phasedur
% [unique_phasedur, ~, idx_phasedur] = unique(phasedur);
% count_phasedur = accumarray(idx_phasedur, 1);


unique_phasedur= [1,1.5,2,2.25,2.5,3,3.5,4,5,6,8,9];
unique_ampdur= [1,1.5,2,2.25,2.5,3,3.5,4,5,6,8,9];

count_phasedur = [2,3,6,1,2,9,1,6,1,2,2,2];
count_ampdur =  [2,3,6,1,2,9,1,6,1,2,2,2];
% Display the distributions
disp('Distribution of ampdur:');
disp(table(unique_ampdur, count_ampdur, 'VariableNames', {'Value', 'Count'}));

disp('Distribution of phasedur:');
disp(table(unique_phasedur, count_phasedur, 'VariableNames', {'Value', 'Count'}));


% Plotting for ampdur
figure;
bar(unique_ampdur, count_ampdur);
xlabel('Duration Value (in min) ');
ylabel('Count');
title('Distribution of amplitude duration');
grid on;
% 
% Plotting for phasedur
figure;
bar(unique_phasedur, count_phasedur);
xlabel('Duration Value (in min)');
ylabel('Count');
title('Distribution of phase duration');
grid on;

% figure;
% scatter(ampdur, events, 60, 'x', 'MarkerFaceColor', 'b'); % 60 is marker size
% xlabel('Duration of an event (in min)');        % Label for x-axis
% ylabel('Total no.of events');        % Label for y-axis
% title('For amplitude of the signal');
% grid on;                       % Turn on grid
% legend('single event');  

% figure;
% scatter(phasedur, events, 60, 'x', 'MarkerFaceColor', 'b'); % 60 is marker size
% xlabel('Duration of an event (in min)');        % Label for x-axis
% ylabel('Total no.of events');        % Label for y-axis
% title('For phase of the signal');
% grid on;                       % Turn on grid
% legend('single event');  