close all; clc % プログラム3.1の変数はクリアしない
rrxcd=bin2dec(brxcd); % 2進数の文字列を10進数の整数に変換
Nn=te/Ts; % 時間区間での信号値間隔の数（サンプル値信号数-1）
TN=Ts/dt; % 1サンプリング間隔あたりの信号刻みの数（刻み数-1）
rxch=zeros(1,length(xca)); % 量子化後振幅値のホールド信号の初期化
for k=1:Nn
    rxch((k-1)*TN+1:k*TN)=rrxcd(k); % 量子化ホールド信号の生成
end
figure(1) % 図3.8
plot(t,rxch); % ホールド信号の表示
hold on
stem(tn,rrxcd,'fil','--r'); % 量子化サンプル値の表示
axis([0,te,-2,22]);
xlabel('Time [sec]'); ylabel('$\hat{x}(nT_s), \hat{x}(t)$','Interpreter','latex');
N=length(rxch); % 信号区間の信号長（周波数域長）
X=fft(rxch); % 離散フーリエ変換
fa=1/dt; % アナログ信号の刻み幅に対するサンプリング周波数
fl=1.5; % LPFの遮断周波数1.5[Hz]
Nl=round((N-1)*fl/fa); % 遮断周波数の周波数サンプル値
H=zeros(1,N); % フィルタの初期化全0（阻止域）
H(1:Nl)=1;H(N-Nl+2:N)=1; % fl=1.5[Hz]まで1（通過域）
Xr=X.*H; % LPF処理
fcr=ifft(Xr); % 逆離散フーリエ変換
figure(2) % 図3.9
plot(t,fcr,t,xca,'--'); % 再構成アナログ信号ともとのアナログ信号の表示
axis([0,te,-2,22]); xlabel('Time [sec]'); ylabel('x(t)')