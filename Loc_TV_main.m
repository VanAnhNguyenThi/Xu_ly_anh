% Đọc ảnh gốc
originalImage = imread('anh1.jpg'); % Thay 'lena.jpg' bằng tên ảnh của bạn

% Tạo ảnh nhiễu muối tiêu và nhiễu đốm
noisyImage_saltPepper = imnoise(originalImage, 'salt & pepper', 0.05);
noisyImage_speckle = imnoise(originalImage, 'speckle');

% Kích thước cửa sổ lọc
windowSize = 3;

% Áp dụng lọc trung vị cho ảnh nhiễu muối tiêu và nhiễu đốm
filteredImage_median_saltPepper = customMedianFilter(noisyImage_saltPepper, windowSize);
filteredImage_median_speckle = customMedianFilter(noisyImage_speckle, windowSize);

% Hiển thị kết quả
figure;
% 
% subplot(2, 2, 1);
% imshow(originalImage);
% title('Ảnh gốc');

subplot(2, 2, 1);
imshow(noisyImage_saltPepper);
title('Nhiễu muối tiêu');

subplot(2, 2, 2);
imshow(uint8(filteredImage_median_saltPepper), []);
title('Lọc trung vị (muối tiêu)');

subplot(2, 2, 3);
imshow(noisyImage_speckle);
title('Nhiễu đốm');

subplot(2, 2, 4);
imshow(uint8(filteredImage_median_saltPepper), []);
title('Lọc trung vị (đốm)');  