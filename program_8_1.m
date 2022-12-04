Fs=8000; Ts=1/Fs; % サンプリング周波数と間隔
t=0:Ts:0.1; % サンプリング間隔の時間軸（表示範囲）
n=0:1:length(t)-1; % サンプル番号の時間軸
x=cos(2*pi*800*t)+cos(2*pi*3100*t); % アナログ混合信号
figure(1) % 図8.1(a)
plot(t,x); % 混合アナログ信号
axis([0,0.02,-2.2,2.2]); xlabel('Time [sec]'); ylabel('x(t)')
figure(2) % 図8.1(b)
h=fir1(42,0.5); % FIRフィルタの設計
yfir=filter(h,1,x); % FIRフィルタリング
plot(n,yfir,'k-'); % FIR処理後信号
axis([0,160,-1.5,1.5]); xlabel('Number of samples'); ylabel('y(n)')
figure(3) % 図8.2
[b,a]=butter(20,0.5); % IIRフィルタ設計
yiir=filter(b,a,x); % IIRフィルタリング
plot(n,yiir,'k-'); % IIR処理後信号
axis([0,160,-1.5,1.5]); xlabel('Number of samples'); ylabel('y(n)')