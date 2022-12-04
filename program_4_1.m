tn=0:0.2:2; % 切り出し区間のサンプリングの時間軸ベクトル
xd=cos(2*pi*tn); % 切り出しサンプル値信号
Xf=fft(xd); % ディジタル信号のDFT
Xp=Xf.*conj(Xf); % DFT値の2乗
N=length(xd); % 信号値およびDFTペクトルの長さ
k=0:1:N-1; % 時間番号およびDFT番号の軸ベクトル
figure(1) % 図4.2
subplot(2,1,1)
stem(k,xd,'fil','Marker','.','MarkerSize',16); % 切り出しディジタル信号の表示
axis([0,N-1,-1.2,1.2]); xlabel('Number of samples'); ylabel('x(n)')
subplot(2,1,2)
stem(k,Xp,'fil','Marker','.','MarkerSize',16); % DFTの表示
axis([0,N-1,0.0,0.4*10^2]); xlabel('Number of frequency samples'); ylabel('|X[k]|^2')