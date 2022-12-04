load obsig.mat x;
xsg=sgolayfilt(x,3,21); % SGフィルタ（次数3, ブロック長21）