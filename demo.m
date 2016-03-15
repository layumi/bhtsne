%filename = websave('mnist_train.mat', 'https://github.com/awni/cs224n-pa4/blob/master/Simple_tSNE/mnist_train.mat?raw=true');
%DOWNLOAD FILE
load('../mnist_train.mat');
digits = digits(:,1:5000);
labels = labels(:,1:5000);
numDims = 2; pcaDims = 50; perplexity = 50; theta = .5;
map = fast_tsne(digits', numDims, pcaDims, perplexity, theta);
figure(2);
gscatter(map(:,1), map(:,2), labels');
figure(3);
im = 255 - reshape(digits,28,28,[]); % black to white
for i=1:size(im,3)
    imagesc(map(i,1)*38,map(i,2)*38,uint8(im(:,:,i)));  % to view better
    axis([-1400 1400 -1400 1400]);
    colormap(gray);
    hold on;
end