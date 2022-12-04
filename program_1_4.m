Ne=80; % 時間軸範囲（信号数の最大値）
n=0:1:Ne; % 0～Neまでの時間軸ベクトル生成
z=exp(1j*0.05*pi*n); % 式(1.8)の複素ディジタル正弦波
zr=real(z); % 複素正弦波の実部信号
zi=imag(z); % 複素正弦波の虚部信号
figure(1) % 図1.5
subplot(2,1,1)
stem(n,zr,'fil',':','MarkerSize',4); % 実部信号の表示
axis([0,Ne,-1.0,1.0]); xlabel('Number of samples'); ylabel('z_r(n)')
subplot(2,1,2)
stem(n,zi,'fil',':','MarkerSize',4); % 虚部信号の表示
axis([0,Ne,-1.0,1.0]); xlabel('Number of samples'); ylabel('z_i(n)')
figure(2) % 図1.6
subplot(3,1,1)
stem(n,abs(zi),'filled',':','MarkerSize',4); % 虚部の絶対値信号の表示
axis([0,Ne,0.0,1.0]); xlabel('Number of samples'); ylabel('|z_i(n)|')
subplot(3,1,2)
stem(n,zi.*conj(zi),'filled',':','MarkerSize',4); % 虚部の絶対値2乗信号の表示
axis([0,Ne,0.0,1.0]); xlabel('Number of samples'); ylabel('|z_i(n)|^2')
subplot(3,1,3)
stem(n,atan2(zi,zr),'fil',':','MarkerSize',4); % 逆正接信号の表示
axis([0,Ne,-pi,pi]); xlabel('Number of samples'); ylabel('tan^{-1}(z_i/z_r) [rad]')
figure(3) % 図1.7
for k=1:Ne
    plot(zr(k),zi(k),'bo'); hold on % 信号点の表示
end
axis([-1.2,1.2,-1.2,1.2],'equal'); % 軸長が等しい座標軸範囲指定
xlabel('Real Part'); ylabel('Imaginary Part')
figure(4) % 図1.8
plot3(n,zr,zi,'-o'); % 信号点の表示
axis([0,Ne,-1.0,1.0,-1.0,1.0]); grid on % 表示範囲とグリッド線表示の指定
xlabel('Number of samples'); ylabel('Real Part'); zlabel('Imaginary Part')