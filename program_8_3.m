comf=fdesign.comb('peak','N,BW',10,0.01); % くし形ピークフィルタの設計
comc=design(comf,'SystemObject',true); % IIRフィルタ係数
fvtool(comc) % フィルタ特性表示
notchf=fdesign.comb('notch','N,BW',10,0.01); % くし形ノッチフィルタの設計
notchc=design(notchf,'SystemObject',true); % IIRフィルタ係数
fvtool(notchc) % フィルタ特性表示