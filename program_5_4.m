N=2^12; % 信号長N=4096
n=0:N-1; % サンプル値番号ベクトル
r=10; rng(r); % 乱数の初期値
xn=0.3*randn(1,N); % 白色雑音
xs=0.8*sin(2*pi*0.1*n); % 正弦波
x=xs+xn; % 観測信号
SN=snr(xs,xn); % SN比
disp(['SNR=',num2str(SN),'[dB]']); % SN比表示
[pxx,wp]=periodogram(x,hanning(N),length(x/4)); % ペリオドグラム
[a,b]=lpc(x,27); % 線形予測（ARモデル係数）
[Hm,wm]=freqz(b,a); % モデルの周波数スペクトル
figure(1) % 図5.18
plot(wm,20*log10(abs(Hm)))
axis([0,pi,-30,20]); xlabel('Normalized angular frequency [rad/sec]'); ylabel('|X[k]|^2 [dB]')
figure(2) % 図5.19
plot(wp,10*log10(pxx))
axis([0,pi,-40,30]); xlabel('Normalized angular frequency [rad/sec]'); ylabel('|X[k]|^2 [dB]')