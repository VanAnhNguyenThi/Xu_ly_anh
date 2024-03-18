function filteredImage = Loc_TB(noisyImage, windowSize)
    % Khởi tạo ma trận kết quả với kích thước bằng với ảnh gốc
    filteredImage = zeros(size(noisyImage));

    % Lấy kích thước của ảnh
    [rows, cols] = size(noisyImage);

    % Padding ảnh với zeros
    padAmount = floor(windowSize / 2);
    paddedImage = padarray(noisyImage, [padAmount, padAmount]);

    % Áp dụng lọc trung bình
    for i = 1:rows
        for j = 1:cols
            % Trích xuất phần cửa sổ 3x3 tại vị trí (i,j)
            window = paddedImage(i:i+windowSize-1, j:j+windowSize-1);
            
            % Tính giá trị trung bình của phần cửa sổ
            meanValue = mean(window(:));
            
            % Gán giá trị trung bình cho pixel tương ứng trong ảnh kết quả
            filteredImage(i, j) = meanValue;
        end
    end
end