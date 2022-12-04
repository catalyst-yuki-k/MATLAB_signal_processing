L=3.0; % 解析区間長
dt=0.005; % サンプリング間隔（時間刻み幅）
L0=0.0; % 開始位置
t=L0:dt:L0+L; % 解析区間の等間隔時間ベクトル生成
fs=1/dt; % サンプリング周波数（最大周波数の2倍）
x=cos(2*pi*t); % 1[Hz]の余弦波信号
N=length(x); % サンプル値数
df=fs/(N-1); % 周波数点の間隔（周波数の刻み幅）
k=0:df:fs; % 周波数区間の等間隔周波数ベクトル生成
X=fft(x); % DFT
Xp=X.*conj(X)./N./N; % パワースペクトルの振幅正規化
dXp=10*log10(Xp/max(Xp)); % デシベルの計算
figure(1) % 図4.4
subplot(2,1,1)
plot(k,dXp,'k-'); % 振幅正規化パワースペクトルのデシベル表示
axis([0,fs/2,min(dXp),0]); % 最大周波数までの範囲
grid on
xlabel('Frequency [Hz]'); ylabel('|X[k]|^2/N^2 [dB]')
subplot(2,1,2)
stem(k,Xp,'fil','b:','Marker','.','MarkerSize',14); hold on
plot(k,Xp,'k-'); % 振幅正規化パワースペクトルの表示
axis([0,10,0,0.3]); % パワースペクトルの拡大線形表示
grid minor
xlabel('Frequency [Hz]'); ylabel('|X[k]|^2/N^2')