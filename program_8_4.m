N=21; % フィルタ次数
b=firpm(N,[0 1],[0 pi],'d'); % 微分器インパルス応答
f0=[0 0.45 0.55 1]; % HPFの阻止域端，通過域端
a0=[0 0 1 1]; % HPFの目標振幅特性
h=firpm(N-1,f0,a0); % HPFインパルス応答
fvtool(b,1); % フィルタ特性表示