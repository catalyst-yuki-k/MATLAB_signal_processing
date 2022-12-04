f0=5.0; % (1)の場合は0.0
te=10.0; % 時間範囲端（-te～te[sec]）
dt=0.01; % 時間刻み幅
ta=-te:dt:te; % 等間隔時間軸ベクトルの生成
x1=0*ta(ta<0); x2=exp(-ta(0<=ta)).*cos(2*pi*f0*ta(0<=ta));
xa=[x1 x2]; % アナログ信号
figure(1) % 図2.5
plot(ta,xa);
axis([-te,te,-1.1,1.1]); xlabel('Time [sec]'); ylabel('x(t)');
N=length(xa); % 信号点数
fs=1/dt; % サンプリング周波数に相当
m=linspace(-fs/2,fs/2,N); % 角周波数軸の生成
omega0=2*pi*f0; % 角周波数パラメータ
figure(2) % 図2.6または図2.7
subplot(3,1,1)
FX=sqrt(1+m.*m)./sqrt((1+omega0*omega0-m.*m).^2+4*(m.*m)); % 振幅スペクトル
plot(m,FX); % 振幅スペクトル表示
axis([-fs/2,fs/2,0.0,0.6]); xlabel('Angular frequency [rad/sec]'); ylabel('$\mid F(\omega) \mid$','Interpreter','latex')
subplot(3,1,2)
PX=atan((-m.*(m.*m-omega0*omega0+1))./(1+omega0*omega0+m.*m)); % 位相スペクトル
plot(m,PX); % 位相スペクトル表示
axis([-fs/2,fs/2,-pi/2,pi/2]); xlabel('Angular frequency [rad/sec]'); ylabel('$\theta(\omega)$ [rad]','Interpreter','latex')
subplot(3,1,3)
PX=(1+m.*m)./((1+omega0*omega0-m.*m).^2+4*(m.*m)); % パワースペクトル
plot(m,PX); % パワースペクトル表示
axis([-fs/2,fs/2,0.0,0.3]); xlabel('Angular frequency [rad/sec]'); ylabel('$\mid F(\omega) \mid^2$','Interpreter','latex')