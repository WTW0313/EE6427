clear;
clc;

% Different QPs
PSNR_Y = zeros(1, 31);
MSE_Y = zeros(1, 31);

for i = 2 : 31
    if i < 10
        str = ['0', num2str(i)];
    else
        str = num2str(i);
    end
    disp(str);
    [PSNR_Y(i), MSE_Y(i), ~] = yuvpsnr(['football_cif_', str,'_decode.yuv'], 'football_cif.yuv', 352, 288, '420', 'y');
end

bitrate = [5355.12 3784.63 2718.93 2211.47 1763.83 1522.87 1283.76 1147.70 1000.27 913.09 817.12 758.08 689.69 648.08 599.02 567.63 529.91 ... 
506.87 477.66 459.59 436.98 422.14 404.62 392.17 377.48 368.11 355.22 347.15 337.59 330.61];

figure(1);
plot(bitrate, PSNR_Y(2 : end), 'b-*');
xlabel('bitrate(kbit/sec)');
ylabel('PSNR-Y');

figure(2);
plot(bitrate, MSE_Y(2 : end), 'g--o');
xlabel('bitrate(kbit/sec)');
ylabel('MSE-Y');

PSNR_Yt = PSNR_Y';
MSE_Yt = MSE_Y';

% Fixed bitrate
bitrate = [2450 3200 3800 4200 4800 5200];
MSE_Y_PF = zeros(6, 150);
for i = 1 : 6
    str = num2str(bitrate(i));
    disp(str);
    [~, ~, MSE_Y_PF(i, :)] = yuvpsnr(['football_cif_fixedB_', str,'.yuv'], 'football_cif.yuv', 352, 288, '420', 'y');
end

s = 1 : 150;
figure(3);
plot(s, MSE_Y_PF(1, :), s, MSE_Y_PF(2, :), s, MSE_Y_PF(3, :), s, MSE_Y_PF(4, :), s, MSE_Y_PF(5, :), s, MSE_Y_PF(6, :));
xlabel('Frame no');
ylabel('MSE-Y');
legend('2447.63kbit/sec', '3176.61kbit/sec', '3780.11kbit/sec', '4161.79kbit/sec', '4565.25kbit/sec', '4753.75kbit/sec');



        
