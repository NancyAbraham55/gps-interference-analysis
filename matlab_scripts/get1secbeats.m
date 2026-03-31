
% known variables
z=readGPSNew_Nancy('chuc', 2015, 05, 11, 6);
phaseprn1= z.Z.l1_Phase(2,:);
phaseprn2= z.Z.l1_Phase(9,:);


% fprn1= abs((z.L1_doppler(1350:1500,5))); 
% fprn2= abs((z.L1_doppler(1350:1500,20)));  

st_pt=50;
data1=phaseprn1(50:end); %phase data shifted by 50 pts
result1 = zeros(size(data1)-1);

%next phase value subtracted from the first one for PRN1
for i = 2:length(data1)
    result1(i-1) = data1(i) - data1(i-1);
end

data2=phaseprn2(50:end); %phase data shifted by 50 pts
result2 = zeros(size(data2)-1);

%next phase value subtracted from the first one for PRN1
for i = 2:length(data2)
    result2(i-1) = data2(i) - data2(i-1);
end

% Doppler frequencies
frprn1 = result1(120000:180000); % Doppler from PRN 1
frprn2 = result2(120000:180000); % Doppler from PRN 2
Rba = (frprn1 - frprn2); % Relative Doppler frequency (Hz)

% Time Parameters
f_s = 100; % Sampling rate (Hz)
T_s = 1 / f_s; % Sampling interval (s)
T_c = 1e-3; % Code period (1 ms)
N = T_c / T_s; % Number of samples per code period

% Relative angular frequency
Delta_omega_BA = 2 * pi * Rba; % Convert Hz to rad/s

% Compute Sinc-Like Ratio
sin1 = sin((Delta_omega_BA * T_c) / 2);
sin2 = 0.1 * sin((Delta_omega_BA * T_s) / 2);
Ratio = sin1./ sin2; 

% Phase Accumulation and Cosine Part
%n = 1000; % Number of correlation periods
phase_accumulation = cumsum(Delta_omega_BA*T_c); % Accumulated phase
cos_part = cos(0.0081 + phase_accumulation); % Example FB = 1

% Compute Power
Cba = 0.06; % Cross-correlation coefficient
P = 0.5 + (Cba * Ratio .* cos_part); % Power computation
time_series = bandpass(P, [14, 23], 100);
Amp= realsqrt(abs(P));
detrend_amp= detrend_power(transpose(P), 100,1);
filtered_amp = bandpass(transpose(detrend_amp(12001:end)), [5, 15], 100);

e = Amp(34100:34200);
time=datetime(z.Z.time_signal(2, 120000:180000),'Convertfrom','datenum');
t=transpose(time(34100:34200));
figure;
plot(t,e);
filtere= bandpass(e, [5, 15], 100);
plot(t,filtere);
xlabel('Time (UTC)');
ylabel('Observed signal amplitude');

s = returnFFT(filtere);
figure;
plot(s.F, s.P1);
xlabel('Frequency (Hz)');
ylabel('Amplitude Power');


[pxx,w]=periodogram(filtere,rectwin(length(filtere)),length(filtere));
f = w * 100 / (2 * pi);
figure
plot(f,10*log10(pxx));
xlabel('Frequency (Hz)');
ylabel('Amplitude Power');