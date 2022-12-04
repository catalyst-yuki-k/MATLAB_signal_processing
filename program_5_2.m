L=2^7; % 窓長
n=0:L-1; % サンプル値番号軸ベクトル
F1=0.30; F2=0.28; % 正規化周波数値
r=7; rng(r); w=randn(1,L); % 白色雑音
x=cos(2*pi*F1*n)+sin(2*pi*F2*n)+0.5*w; % 観測信号
wd=hann(L); % ハニング窓関数
xw=wd'.*x; % 窓関数の適用
[acxw,lagxw]=xcorr(xw,xw); % 自己相関関数
Xwa=fft(acxw); % パワースペクトル（ウィナー-ヒンチンの定理）
Xwaa=abs(Xwa); % 振幅と位相補正
Nacxw=length(acxw); % 自己相関信号長
ka=-pi:2*pi/(Nacxw-1):pi; % 正規化角周波数軸ベクトル生成
Xwad=10*log10(Xwaa/max(Xwaa)); % 周波数スペクトル（dB表示）
figure(1) % 図5.8
subplot(2,1,1)
plot(ka,Xwaa,'k-'); hold on % 正規化角周波数軸状のパワースペクトル（線形表示）
axis([0,pi,0,max(Xwaa)]); xlabel('Normalized angular frequency [rad/sec]');ylabel('|X_w[k]|^2')
subplot(2,1,2)
plot(ka, Xwad,'k-'); % パワースペクトル（dB表示）
axis([0,pi,min(Xwad),0]); xlabel('Normalized angular frequency [rad/sec]');ylabel('|X_w[k]|^2 [dB]')