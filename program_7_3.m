Fs=8000; % サンプリング周波数
Fp=1900; Fst=2100; % 通過域端，阻止域端周波数
Ap=1; Ast=60; % 通過域リップル（dB），阻止域減衰量（dB）
dbutter=designfilt('lowpassiir','PassbandFrequency',Fp,'StopbandFrequency',Fst,'PassbandRipple',Ap,'StopbandAttenuation',Ast,'SampleRate',Fs,'DesignMethod','butter'); % バターワースフィルタ設計
dcheby1=designfilt('lowpassiir','PassbandFrequency',Fp,'StopbandFrequency',Fst,'PassbandRipple',Ap,'StopbandAttenuation',Ast,'SampleRate',Fs,'DesignMethod','cheby1'); % チェビシェフI型フィルタ設計
dcheby2=designfilt('lowpassiir','PassbandFrequency',Fp,'StopbandFrequency',Fst,'PassbandRipple',Ap,'StopbandAttenuation',Ast,'SampleRate',Fs,'DesignMethod','cheby2'); % チェビシェフII型フィルタ設計
dellip=designfilt('lowpassiir','PassbandFrequency',Fp,'StopbandFrequency',Fst,'PassbandRipple',Ap,'StopbandAttenuation',Ast,'SampleRate',Fs,'DesignMethod','ellip'); % 楕円フィルタ設計
FilterOrders=[filtord(dbutter) filtord(dcheby1) filtord(dcheby2) filtord(dellip)]; % フィルタ次数
hfvt=fvtool(dbutter,dcheby1,dcheby2,dellip); % 特性表示
legend(hfvt,'Butterworth','Chebyshev Type I','Chebyshev Type II','Elliptic')