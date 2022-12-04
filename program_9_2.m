N=2^16; % 信号長65536
fs=20000; % サンプリング周波数20[kHz]
tmax=(N-1)/fs; % 時間区間端3.27675[sec]
t=0:1/fs:tmax; % サンプリング時間軸ベクトル生成
tp1=0.48; tp2=0.5; tp3=2.5; % 変化点時刻
p=2.0*exp(-1.0*10^6*(t-tp2).*(t-tp2))+1.0*exp(-1.0*10^6*(t-tp1).*(t-tp1))-3.0*exp(-1.0*10^6*(t-tp3).*(t-tp3)); % パルス状信号
ta=1.5; % 変化点時刻
z1=0.01*sin(2*pi*2000*t(t<ta));
z2=0.01*sin(2*pi*7000*t(ta<=t))+0.02*cos(2*pi*6800*t(ta<=t));
z=[z1 z2]; % 正弦波状信号
x=p+z; % テスト信号
L=2^9; % 窓長512
figure(1) % 図9.12
subplot(2,1,1); plot(t,x); % テスト信号表示
axis([0,tmax,-3.5,2.5]); xlabel('Time [sec]'); ylabel('x(t)')
subplot(2,1,2); plot(t,x); % テスト信号表示（拡大）
axis([1.495,1.505,-0.04,0.04]); xlabel('Time [sec]'); ylabel('x(t)')
figure(2) % 図9.13
[X,fre,tim]=spectrogram(x,hann(L),floor(L/2),L,fs,'yaxis'); % スペクトログラム計算
subplot(2,1,1)
imagesc(tim,fre,10*log10((X.*conj(X)))); axis xy; % スペクトログラム2次元表示
xlabel('Time [sec]'); ylabel('Frequency [Hz]')
subplot(2,1,2)
mesh(tim,fre,10*log10((X.*conj(X)))); % スペクトログラム3次元表示
xlabel('Time [sec]'); ylabel('Frequency [Hz]'); zlabel('|X(k,m)|^2 [dB]')