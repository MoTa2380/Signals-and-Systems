function [downsampled_Fs, resampled_audio] = import_audio(path, song_num, format)
    % import the audio 
  
    %[audio, Fs] = audioread([path, 'music', num2str(song_num), format]);
    [audio, Fs] = audioread( strcat(path,"music", num2str(song_num), format));
    
    % getting mean over right and left channels
    audio = (audio(:,1) + audio(:,2))/2;
    %%% audioMono
    % downsample the audio to 8 KHz
    
    downsampled_Fs = 8000;
    %%% resampled_audio
    resampled_audio = resample(audio, downsampled_Fs, Fs);
   
    
end

