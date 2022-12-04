[h0,h1,g0,g1] = wfilters('db8'); % db8のインパルス応答
n=1:1:length(h0); % インパルス番号
figure(1) % 図10.5
subplot(2,2,1)
stem(h0,'fil'); xticks(n); % 分析側LPF
xlabel('Number of samples'); ylabel('h_0(n)')
subplot(2,2,2)
stem(h1,'fil'); xticks(n); % 分析側HPF
xlabel('Number of samples'); ylabel('h_1(n)')
subplot(2,2,3)
stem(g0,'fil'); xticks(n); % 合成側LPF
xlabel('Number of samples'); ylabel('g_0(n)')
subplot(2,2,4)
stem(g1,'fil'); xticks(n); % 合成側HPF
xlabel('Number of samples'); ylabel('g_1(n)')
figure(2) % 図10.6(a)(b)
freqz(h0,1); hold on; freqz(h1,1) % 分析フィルタ周波数特性表示
figure(3) % 図10.6(c)(d)
freqz(g0,1); hold on; freqz(g1,1) % 合成フィルタ周波数特性表示
figure(4) % 図10.7
[phi,psi,xval] = wavefun('db8',0); % db8のスケーリング関数,ウェーブレット関数
subplot(1,2,1)
plot(xval,phi,'b'); % スケーリング関数表示
axis([0,max(xval),-0.6,1.2]); xlabel('Time [sec]'); ylabel('$\phi(t)$','Interpreter','latex')
subplot(1,2,2)
plot(xval,psi,'r'); % ウェーブレット関数表示
axis([0,max(xval),-1.5,1.2]); xlabel('Time [sec]'); ylabel('$\psi(t)$','Interpreter','latex')