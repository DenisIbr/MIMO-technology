clear all
clc
close  
M = 4;    % QPSK signal constellation
no_of_data_points = 64;        
block_size = 8;                 
cp_len = ceil(0.1*block_size);  
no_of_ifft_points = block_size;          
no_of_fft_points = block_size;
data_source = randsrc(1, no_of_data_points, 0:M-1);
qpsk_modulated_data = pskmod(data_source, M);
num_cols=length(qpsk_modulated_data)/block_size;
data_matrix = reshape(qpsk_modulated_data, block_size, num_cols);
cp_start = block_size-cp_len;
cp_end = block_size;
for i=1:num_cols,
    ifft_data_matrix(:,i) = ifft((data_matrix(:,i)),no_of_ifft_points);
    for j=1:cp_len,
       actual_cp(j,i) = ifft_data_matrix(j+cp_start,i);
    end
    ifft_data(:,i) = vertcat(actual_cp(:,i),ifft_data_matrix(:,i));
end
[rows_ifft_data cols_ifft_data]=size(ifft_data);
len_ofdm_data = rows_ifft_data*cols_ifft_data;
ofdm_signal = reshape(ifft_data, 1, len_ofdm_data);
plot(real(ofdm_signal),'linewidth',2); xlabel('Time'); ylabel('Amplitude');
title('OFDM Signal');grid on;

