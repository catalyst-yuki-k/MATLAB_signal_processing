[s,Fs]=audioread('spch.wav'); % 保存音声（wavファイル）読み込み
[ns,~]=audioread('nis.wav'); % 保存雑音（wavファイル）読み込み
x=s+ns; % 観測音声
L=512; % 窓長
PX=stft(x,'Window',hann(L),'OverlapLength',floor(L/2),'FFTLength',L); % 観測信号のSTFT
PN=stft(ns,'Window',hann(L),'OverlapLength',floor(L/2),'FFTLength',L); % 雑音のSTFT
absPX=abs(PX); % 観測信号の振幅スペクトログラム
absPN=abs(PN); % 雑音の振幅スペクトログラム
PY=zeros(size(PX)); % スペクトルサブトラクション(SS)出力のSTFTの初期化
for m=1:length(PX(1,:)) % フレーム（番号）指定のループ
    for k=1:length(PX(:,1)) % 周波数成分指定のループ
        PY(k,m)=(1-(absPN(k,m)/absPX(k,m)))*PX(k,m); % フレームごとのSS実行
    end
end
y=istft(PY,'Window',hann(L),'OverlapLength',floor(L/2),'FFTLength',L); %ISTFTによる出力信号
Nl=length(y); ty=(0:1:Nl-1)/Fs; % 出力信号の座標軸
[sy,frey,timy]=spectrogram(y,hann(L),floor(L/2),L,Fs,'yaxis'); % SS出力信号のSTFT
figure(1) % 図11.10
subplot(2,1,1)
plot(ty,y); % 処理後音声表示
axis([0,(Nl-1)/Fs,-1,1]); xlabel('Time [sec]'); ylabel('y(t)');
subplot(2,1,2)
imagesc(timy,frey,10*log10(sy.*conj(sy))); % 対数スペクトログラム表示
axis xy; xlabel('Time [sec]'); ylabel('Frequency [Hz]');