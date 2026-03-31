z=readGPSNew_Nancy('chuc', 2015, 05, 25, 20);
fc=10e9;
fprn1= abs((z.L1_doppler(3000:3600,11))); meanfreq= mean(fprn1 + fc);
fprn2= abs((z.L1_doppler(3000:3600,4))); meanfreq2= mean(fprn1 + fc);
reldop= fprn1-fprn2;
result = mean(reldop);
elesat1 = z.Z.sat_el(4, 50:60);
elesat2 = z.Z.sat_el(2, 50:60);
meanel1= mean(elesat1(~isnan(elesat1))); meanel2= mean(elesat2(~isnan(elesat2)));
azisat1= z.Z.sat_az(4, 50:60);
azisat2= z.Z.sat_az(2, 50:60);
meanaz1= mean(azisat1(~isnan(azisat1))); meanaz2= mean(azisat2(~isnan(azisat2)));

lat_sta = 58.759279; % Latitude of the IPP (in degrees)
lon_sta = 265.913402; % Longitude of the IPP (in degrees)
elesat = meanel1; % Satellite elevation angle (in degrees)
azisat = meanaz1; % Satellite azimuth angle (in degrees)
elesat2 = meanel2; % Satellite elevation angle (in degrees)
azisat2 = meanaz2; % Satellite azimuth angle (in degrees)



j= Ipp(lat_sta, lon_sta, elesat2, azisat2);

i= Ipp(lat_sta, lon_sta, elesat, azisat);

CA1=generateCAcode(4);
CA2=generateCAcode(11);


% Convert binary code to decimal values
decimalValues = (char(CA1));

% Define parameters for the signal
Fs = 1000; % Sampling frequency (Hz)
T = 1/Fs;  % Sampling period
t = 0:T:(length(decimalValues)-1)*T;  % Time vector

% Generate a simple signal using the decimal values
CA1sig = CA1.*sin(2*pi*1000*t); 
CA2sig = CA2.*sin(2*pi*1000*t);


start_time = 0;       
end_time = 20;
time_step = 0.0166;      % Time step
amplitude = 1;         % Amplitude of the cosine wave

time = start_time:time_step:end_time; % Time vector 
t= time(1:1023);
% for i = 1:length(fprn1)
signal1 = CA1sig.* cos(2*pi*meanfreq*t);


signal2 = CA2sig.* cos(2*pi*meanfreq2*t);



composite= signal1 + signal2;
plot(t, composite);