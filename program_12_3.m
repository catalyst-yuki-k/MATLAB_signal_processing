load obsig.mat x;
yhard=wdenoise(x,'Wavelet','db8','DenoisingMethod','Bayes','ThresholdRule','hard'); % ウェーブレットデノイジング（ハードスレッシュホールド）
ysoft=wdenoise(x,'Wavelet','db8','DenoisingMethod','Bayes','ThresholdRule','soft'); % ウェーブレットデノイジング（ソフトスレッシュホールド）