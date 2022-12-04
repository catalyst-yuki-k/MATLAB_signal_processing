N=2^10; % 信号長
n=0:N-1; % 時間軸ベクトルの生成
nf=n/N; % 正規化周波数軸ベクトルの生成
r=10; rng(r); % 乱数の初期値
x=randn(1,N); % 信号長Nの正規擬似乱数の生成（白色雑音）
X=fft(x); Xp=X.*conj(X)./N./N; % 振幅正規化パワースペクトル
figure(1) % 図5.1
subplot(2,1,1)
plot(n,x); % 波形表示
axis([0,N-1,-4,4]); xlabel('Number of samples'); ylabel('x(n)')
subplot(2,1,2)
plot(nf,Xp); % 振幅正規化パワースペクトルの表示
axis([0,1,0,8.0*10^(-3)]); xlabel('Normalized frequency [Hz]'); ylabel('|X[k]|^2/N^2')