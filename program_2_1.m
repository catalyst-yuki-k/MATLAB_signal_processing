t=-pi:0.001:pi;
x1=cos(0*t(-pi<=t & t<=-pi/2));
x2=0.*t(-pi/2<t & t<pi/2);
x3=cos(0*t(pi/2<=t & t<=pi));
x=[x1 x2 x3]; % 1周期分のアナログ信号
K=10; % フーリエ係数の項数
k=1:1:K; % 係数の指定
a(k)=-2*sin(k*pi/2)./(k*pi); % フーリエ係数値(k>0)
ak=[1 a]; % フーリエ係数値(k=0)を追加
figure(1) % 図2.1
plot(t,x); % 式(2.2)のアナログ信号の表示
axis([-pi,pi,-0.2,1.2]); xlabel('Time [sec]'); ylabel('x(t)')
figure(2) % 図2.2
kk=0:1:K; % フーリエ係数軸の生成
stem(kk,ak); % フーリエ係数の表示
axis([0,K,-1.0,1.1]); xlabel('Number of coefficient'); ylabel('a_k')