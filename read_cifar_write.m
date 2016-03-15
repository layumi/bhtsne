load('data_batch_1.mat');
data = reshape(data,[],32,32,3);
data = permute(data,[3 2 4 1]);
for i = 1:size(data,4)
   imwrite(data(:,:,:,i),strcat('pic/cifar_',num2str(i),'.jpg'));
end