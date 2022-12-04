t=-3:0.001:3; % 有限範囲の時間軸ベクトルの生成
sigma=0.5;
x=exp(-(t.*t)/(2*sigma^2))/(sqrt(2*pi)*sigma); % 式(1.4)
z=cos(20*t).*x; % 式(1.4)と式(1.5)の乗算（各要素の積）
plot(t,z); % アナログ信号の表示
axis([-3,3,-1.0,1.0]); xlabel('Time [sec]'); ylabel('z(t)')