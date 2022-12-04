N=2^7; % 信号長
dt=0.01; t=0:dt:N; % アナログ信号の時間軸ベクトル生成
xt=sin(0.25*(2*pi/(N-1))*t.*t); % アナログ信号
n=0:1:N-1; % サンプル時間軸ベクトル生成
x=sin(0.25*(2*pi/(N-1))*n.*n); % ディジタル信号
figure(1) % 図10.2
plot(t,xt); % 信号表示
axis([0,N,-1.2,1.2]); xlabel('Time [sec]'); ylabel('x(t)')
figure(2) % 図10.3
cha=cwt(x,1:32,'haar','plot'); imagesc(cha.^2); % haar関数のCWTを計算し表示
xlabel('Time b [sec]'); ylabel('Scale a')
colormap(parula) % カラー指定