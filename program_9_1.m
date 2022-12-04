N=128; L=32; % 信号長（=解析区間）と窓長
dt=0.01; t=0:dt:N-dt; % 時間刻みと時間軸ベクトル生成
xt=sin(0.25*(2*pi/(N-1))*t.*t); % アナログ信号
n=0:1:N-1; fs=1; % サンプル軸ベクトル生成，サンプリング周波数
x=sin(0.25*(2*pi/(N-1))*n.*n); % ディジタル信号
figure(1) % 図9.4
subplot(2,1,1)
plot(t,xt); % アナログ信号の表示
axis([0,N,-1.2,1.2]); xlabel('Time [sec]'); ylabel('x(t)')
subplot(2,1,2)
[xm,frem,timm]=stft(x,fs,'Window',hann(L),'Overlaplength',floor(L/2),'FFTlength',L); % STFT計算
imagesc(timm,frem,10*log10(xm.*conj(xm))); colorbar; % スペクトログラム表示
xlabel('Time [sec]'); ylabel('Normalized frequency [Hz]')
figure(2) % 図9.5
waterfall(frem,timm,(xm.*conj(xm))'); % スペクトログラムの3次元表示
axis([-0.5,0.5,0,127,0,55]); ylabel('Time [sec]'); xlabel('Normalized frequency [Hz]'); zlabel('|X(k,m)|^2')