Teil_h = 0.5;
Teil_b = 0.5;
width = 352;
height = 288;
framesize = width * height;
error = zeros(height, width, 150);

for Frame = 1 : 150
    fileId = fopen('football_cif.yuv', 'r');
    factor = 1+(Teil_h*Teil_b)*2;

    fseek(fileId, (Frame-1)*factor*framesize, 'bof');

    YMatrix = fread(fileId, width * height, 'uchar');
    YMatrix = int16(reshape(YMatrix, width, height)');
    YMatrix = uint8(YMatrix);

    fclose(fileId);

    fileId = fopen('football_cif_05_decode.yuv', 'r');

    fseek(fileId, (Frame-1)*factor*framesize, 'bof');

    YMatrix05 = fread(fileId, width * height, 'uchar');
    YMatrix05 = int16(reshape(YMatrix05, width, height)');
    YMatrix05 = uint8(YMatrix05);

    fclose(fileId);

    error(:,:,Frame) = YMatrix - YMatrix05;
end
