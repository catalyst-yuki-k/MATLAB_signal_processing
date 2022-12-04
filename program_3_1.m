te=2.0; % 信号区間端（0～te）
dt=10^(-3); % 連続時間軸の刻み幅（サンプリング周波数1[kHz]）
t=0:dt:te; % 時間軸の等間隔ベクトルの生成
xca=9.5*cos(2*pi*t)+9.5; % アナログ信号
Ts=0.1; % ディジタル信号のサンプリング間隔（fs=10[Hz]）
tn=0:Ts:te; % サンプル時刻を与える等間隔ベクトルの生成
n=tn/Ts; % サンプル番号を与える等間隔ベクトルの生成
xcd=9.5*cos(2*pi*tn)+9.5; % ディジタル信号（サンプル値信号）
rxcd=round(xcd); % 量子化ディジタル信号（整数値への丸め）
brxcd=dec2bin(rxcd,8) % 整数を2進数の文字列に変換（表示）
b=zeros(length(xcd),8); % 2進数（ビット列）の初期化
for k=1:length(xcd)
    for l=1:8
        b(k,l)=str2double(brxcd(k,l)); % 各ビット（文字列）を数値へ型変換
    end
end
b(length(xcd)+1,:)=b(length(xcd),:); % 表示用に同値を追加
c=reshape(b',1,[ ]); % パラレル-シリアル変換
figure(1) % 図3.3
subplot(3,1,1)
plot(t,xca); % アナログ信号の表示
axis([0,te,-2,22]); xlabel('Time [sec]'); ylabel('x(t)')
subplot(3,1,2)
stem(tn,xcd,'fil'); % サンプル値信号の表示
axis([0,te,-2,22]); xlabel('Time [sec]'); ylabel('x(nT_s)')
subplot(3,1,3)
stem(tn,rxcd,'fil'); % 整数量子化ディジタル信号の表示
axis([0,te,-2,22]); xlabel('Time [sec]'); ylabel('$\hat{x}(nT_s)$','Interpreter','latex')
grid on; grid minor
figure(2) % 図3.4
stem(n,rxcd,'fil'); % 整数量子化ディジタル信号の表示（塗りつぶし）
hold on
stem(n,xcd); % ディジタル信号の表示
axis([0,te/Ts,0,20]); xlabel('Number of samples'); ylabel('$x(n),\hat{x}(n)$','Interpreter','latex')
grid on; grid minor
figure(3) % 図3.5
for m=1:1:8
    subplot(8,1,m)
    stairs(b(:,m)); % ビット列の波形表示
    axis([1,length(rxcd)+1,-0.2,1.2])
    axis off
end
figure(4) % 図3.7
stairs(c); % ビット列の表示
axis([1,length(xcd)*8,-0.2,1.2]);
xlabel('Number of bit'); ylabel('$\hat{x}_{b}(nT_s)$','Interpreter','latex')