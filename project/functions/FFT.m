function single_sided_power_spectrum = FFT(X)
    %%% single_sided_power_spectrum

    fft_signal =  ((abs(fft(X))/length(X)).^2);
    fft_signal = fft_signal(1:floor(length(X)/2) + 1);
    fft_signal(2: end -1)=fft_signal(2:end -1) * 2;
    single_sided_power_spectrum = fft_signal;
    
end

