te=40.0; % 時間軸端te
dt=0.01; % 時間刻み幅
t=-te/2:dt:te/2; % 時間軸ベクトル
N=length(t)-1; % 時間刻み数
n=-N/2:1:N/2; % サンプル値間隔ベクトル
tu=5.0; % パラメータ
y1a=0*t(t<0);
y2a=1-exp(-t(t>=0&t<=tu));
y3a=(exp(tu)-1)*exp(-t(t>tu));
ya=[y1a y2a y3a]; % アナログ出力信号
Nu=5; % パラメータ
y1d=0*n(n<0);
y2d=(exp(1)-exp(-n(n>=0&n<=Nu)))/(exp(1)-1);
y3d=(1-exp(Nu+1))*exp(-n(n>Nu))/(1-exp(1));
yd=[y1d y2d y3d]; % ディジタル出力信号
figure(1) % 図6.3
plot(t,ya); hold on; % アナログ出力信号
stem(n,max(ya)*yd/max(yd),'fil',':'); % ピークを一致させたディジタル出力信号の表示
axis([-te/2,te/2,-0.1,1.2]); xlabel('Time [sec]'); ylabel('y(t)')