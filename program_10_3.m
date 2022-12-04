N=2^8; % 信号長
n=0:1:N-1; % サンプル軸生成
n1=0:1:N/4-1; n2=0:1:N/2-1; n3=N/4-1:-1:0; % 三角波
x1=n1/(N/4); x2=-n2/(N/4-0.5)+1; x3=-n3/(N/4); x=[x1 x2 x3];
wdw='db4'; % マザーウェーブレット関数
figure(1) % 図10.14
plot(n,x); % 三角波表示
axis([0,N-1,-1.2,1.2]); xlabel('Number of samples'); ylabel('Amplitude')
NS=3; % 最大分割レベル数
[c,l]=wavedec(x,NS,wdw); % フィルタバンクによる分解処理
for k=1:NS % 各分解レベルでの出力
    d=detcoef(c,l,k); % ウェーブレット係数
    a=appcoef(c,l,wdw,k); % スケーリング係数
    figure(k+1); m=0:1:length(d)-1; % ウェーブレット係数表示（図10.15下図）
    plot(m,d); % 詳細成分表示
    axis([0,length(d)-1,min(d),max(d)]); xlabel('Number of samples'); ylabel(['g_',num2str(k),'(n)'])
    figure(NS+1+k); % スケーリング係数表示（図10.15上図）
    plot(m,a); % 近似成分表示
    axis([0,length(a)-1,min(a),max(a)]); xlabel('Number of samples'); ylabel(['x_',num2str(k),'(n)'])
end
