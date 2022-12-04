fs=16000; % サンプリング周波数
Ts=1/fs; % サンプリング間隔
N=80; % サンプル点数
t=0:Ts:Ts*(N-1); % サンプリング時間ベクトル
xc=cos(2*pi*1200*t); % 1200[Hz]余弦波
s=7;rng(s); xn=0.4*randn(1,N); % 雑音レベル0.4の白色雑音
x=xc+xn; % 観測信号
n=0:1:N-1; % サンプル値番号
X=fft(x); Xf=X.*conj(X); % 観測信号のDFTとパワースペクトル
df=2*pi/(N-1); % 正規化角周波数刻み
nf=0:df:df*(N-1); % 正規化角周波数ベクトル
fc=2000; Wc=round((N-1)*fc/fs); % 遮断周波数番号
H=zeros(1,N); % LPF初期値ゼロ
H(1,1:Wc+1)=1; % LPF通過域
H(1,N-Wc+1:N)=1; % LPF通過域（対称成分）
Y=H.*X; % DFT/IDFTフィルタ処理
y=ifft(Y); % IDFT
e=y-xc; % 誤差信号
SNRin=snr(xc,xn); SNRout=snr(xc,e); % 入出力SN比
NF=SNRout/SNRin; % NF値
figure(1) % 図6.8
subplot(2,1,1)
plot(n,x,'k-'); hold on; plot(n,xc,'r--'); % 信号表示
axis([0,N-1,-2,2]); xlabel('Number of samples'); ylabel('x(n)');
legend('Observed signal','Original signal')
subplot(2,1,2)
plot(nf,Xf./N./N,'k-'); % パワースペクトル表示
axis([0,pi,0,0.3]); xlabel('Normalized angular frequency [rad/sec]'); ylabel('|X[k]|^2/N^2')
figure(2) % 図6.9
subplot(2,1,1)
stem(nf,H,'fil','r:','MarkerSize',3); hold on; plot(nf,H,'b-'); % 振幅スペクトル表示
axis([0,2*pi,0,1.2]); xlabel('Normalized angular frequency [rad/sec]');ylabel('|H[k]|')
subplot(2,1,2)
plot(n,y,'k-'); % 出力信号表示
axis([0,N-1,-2,2]); xlabel('Number of samples'); ylabel('y(n)')