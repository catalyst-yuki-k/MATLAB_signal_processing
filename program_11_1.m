Fs=20000; % サンプリング周波数
recspch=audiorecorder(Fs,16,1); % サンプリング周波数Fsで16(または8,24)bitのモノラル(1)またはステレオ(2)音声データを取得
disp('Start Speaking.'); % 録音開始表示
recordblocking(recspch,3.0); % recspchオブジェクトに3秒間音声録音
disp('End of Recording.'); % 録音終了表示
s=getaudiodata(recspch,'single'); % recspchのデータを単精度配列として変数sに格納
N=length(s); t=(0:1:N-1)/Fs; % 時間軸ベクトル生成
play(recspch); % 取得音声のスピーカ再生（再生時間区間の指定はオプションで可能）
audiowrite('spch.wav',s,Fs); % 音声の数値データsをwaveファイル（spch.wav）として保存
[s_rec,Fs]=audioread('spch.wav'); % waveファイル（spchy.wav）を変数s_recへ再読み込み
pause(5); % 5秒間の間隔
cn = dsp.ColoredNoise('white','SamplesPerFrame',N,'NumChannels',1); ns=cn();% 雑音生成
audiowrite('nis.wav',ns,Fs); % 雑音の数値データnsをwaveファイル（nis.wav）として保存
x=s_rec+ns; % 観測音声
L=512; % 窓長
snr1=snr(s_rec,ns); % SNR算出
disp(['観測音声のSNRは',num2str(snr1),'[dB]です．']) % SNR値のディスプレイ表示
figure(1) % 図11.2,図11.3
subplot(2,1,1)
plot(t,s_rec); % 音声波形の表示
axis([0,3,-0.8,0.8]); xlabel('Time [sec]'); ylabel('s(t)')
subplot(2,1,2)
[xs,fres,tims]=spectrogram(s_rec,hann(L),floor(L/2),L,Fs,'yaxis'); % スペクトログラム算出
imagesc(tims,fres,10*log10(xs.*conj(xs))); % 対数スペクトログラム表示
axis xy; xlabel('Time [sec]'); ylabel('Frequency [Hz]');