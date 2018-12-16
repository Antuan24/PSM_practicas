function gray = rgb2gray(image)

% complete desde este punto

m_in = double(image);

Y = 0.299.*m_in(:,:,1) + 0.587.*m_in(:,:,2) + 0.114.*m_in(:,:,3);

gray = uint8(Y);

end