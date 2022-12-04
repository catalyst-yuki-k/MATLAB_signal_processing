t=0:10^(-3):2; % 時間軸用等間隔ベクトルの生成
xca=9.5*cos(2*pi*t)+9.5; % アナログ信号の生成
Ts=0.1; % サンプリング間隔
tn=0:Ts:2; % サンプル時刻を与える等間隔ベクトルの生成
xcd=9.5*cos(2*pi*tn)+9.5; % サンプル値信号の生成
n=tn/Ts; % サンプル値番号（整数）ベクトルの生成
subplot(3,1,1) % 図の表示位置の指定
plot(t,xca); % アナログ信号のプロット
axis([0,2,0,20]); xlabel('Time [sec]'); ylabel('x(t)')
subplot(3,1,2) % 図の表示位置の指定
stem(tn,xcd,'fil',':'); % サンプル値信号のプロット（プロット点の塗りつぶし）
hold on; plot(t,xca,'r:'); % もとのアナログ信号（グラフを保持し，重ねて表示）
axis([0,2,0,20]); xlabel('Time [sec]'); ylabel('x(nT_s)')
subplot(3,1,3) % 図の表示位置の指定
stem(n,xcd,'fil'); % ディジタル信号の表示
axis([0,2/Ts,0,20]); xlabel('Number of samples'); ylabel('x(n)')