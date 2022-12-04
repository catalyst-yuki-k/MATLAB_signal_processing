N=80; % フィルタ次数（インパルス応答長81）
Wcr=1/4; % 遮断周波数の比率
md=N/4; % 遅延量20
m=0:1:N; % サンプル値番号
h=Wcr*sinc(Wcr*(m-md)); % インパルス応答
figure(1) % 図6.13(a)
plot(h,'k-'); % インパルス応答表示
axis([1,N,-0.1,0.3]); xlabel('Number of samples'); ylabel('h(n)');
figure(2) % 図6.13(b)(c)
freqz(h) % 周波数特性表示