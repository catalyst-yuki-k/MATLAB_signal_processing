N=2^9; % 信号長
k=0:1:N-1; % サンプル時間ベクトル
x0=zeros(1,N/8); x1=8*ones(1,N/8); x2=-0.5*x1; % 平坦部の信号
K=N/8;x3=zeros(1,K);
for m=1:K
    x3(m)=16*(K-m+1)/K; % 三角波信号
end
xo=[x0 x1 x0 x2 x0 x3 x0 x0]; % 原信号
rng(10); xn=1.0*randn(1,N); % 白色雑音
xp=zeros(1,N); xp(1,150)=10; % インパルス性雑音
x=xo+xn+xp; % 観測信号
save obsig.mat x; % 観測信号を保存
xmed=medfilt1(x,11); % メディアンフィルタ処理