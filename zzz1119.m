data=load('C:\Users\Regent\Desktop\生物医学光子学实验\1119.mp4');
plot(data);

Fs=sampleRate;N=32;Fc1=20;Fc2=30;
flag='scale';
win=hamming(N+1);
b=fir1(N,[Fc1 Fc2]/(Fs/2),'bandpass',win,flag);
filteredA=filtfilt(b,1,data);

time_watch=26;
RSF=filteredA(time_watch*60*500:(time_watch+1)*60*500);
Threshold=(max(RSF)-min(RSF))*0.7+min(RSF);
[R_pks,R_locs]=findpeaks(RSF,500,'MinPeakDistance',0.5,'MinPeakHeight',Threshold);

plot(RSF);
title('第',num2str(time_watch),'分钟EEG')
hold on
plot(R_locs*500,R_pks,'x');