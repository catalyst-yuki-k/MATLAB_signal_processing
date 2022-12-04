L=2^9; % 窓長（=信号長）
te=1; % 時間区間端
Ts=te/(L-1); % サンプリング間隔
fs=1/Ts; % サンプリング周波数L-1[Hz]
df=fs/(L-1); % 周波数刻み幅1[Hz]
t=0:Ts:te; % 切り出し時間軸ベクトル
n=(L-1)*t; % サンプル値番号ベクトル
nf=0:df:L-1; % 周波数軸ベクトル
for p=-7*pi/16:pi/4:5*pi/16 % 初期位相
    x=cos(2*pi*22*t+p); % 余弦波
    wd=hann(L); xw=wd'.*x; % ハニング窓切り出し
    Xw=fft(xw); Xwa=abs(Xw); % 振幅スペクトル（線形表示）
    Ph=atan(imag(Xw)./real(Xw)); % 位相スペクトル
    figure(1) % 図5.10
    subplot(2,1,1)
    plot(n,xw); hold on; % 信号表示
    axis([0,L-1,-1.2,1.2]); xlabel('Number of samples'); ylabel('x_w(n)');
    subplot(2,1,2)
    plot(nf,Xwa); hold on; % 振幅スペクトル表示
    axis([0,(L-1)/2,0,150]); xlabel('Frequency [Hz]'); ylabel('|X_w[k]|')
    figure(2) % 図5.11
    subplot(2,1,1)
    plot(nf,Ph); hold on; % 位相スペクトル表示
    axis([0,(L-1)/2,-pi,pi]); xlabel('Frequency [Hz]'); ylabel('$\theta[k]$ [rad]','Interpreter','latex')
    subplot(2,1,2)
    plot(nf,Ph); hold on; % 位相スペクトル表示（拡大）
    axis([17,27,-pi,pi]); xlabel('Frequency [Hz]'); ylabel('$\theta[k]$ [rad]','Interpreter','latex')
end