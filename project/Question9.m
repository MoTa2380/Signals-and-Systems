%% adding the path of subfolders
clc;
addpath('functions/');
addpath('database/');
addpath('musics/');
addpath('test_musics/');

%% loading the created database
clear; close all; clc;


database = load('database/database.mat').database;

%% calculate the hash tags for the given song

% importing an audio

path = ''; % test musics path
song_num = 9; % music i
format = '.mp3';
[downsampled_Fs, audioMono] = import_audio(path, song_num, format);

% adding noise to the audio
std = 0.1;
SNR = 1:0.5:10;
SNR = fliplr(SNR);
temp = audioMono;
probb = zeros(1, 19);
leng = 20*downsampled_Fs;

for i = 1:length(SNR)
   
    noise = randn(length(temp), 1)*std/db2mag(SNR(i));
    audioMono = awgn(temp, SNR(i));
    temp4 = audioMono;
    for j = 1:100
    audioMono = random_part_music(temp4, downsampled_Fs);
    

%%%

% creating the time-freq matrix of the audio using fft and an overlapping sliding window with the length of "window_time"
window_time = 0.1;
[time, freq, time_freq_mat] = STFT(audioMono, downsampled_Fs, window_time);


% finding the anchor points from time_freq_mat using a sliding window with the size of 2dt*2df
df = floor(0.1*size(time_freq_mat, 1)/4);
dt = 2/window_time;
% finding anchor points
anchor_points = find_anchor_points(time_freq_mat, dt, df);

% creating the hash tags using a window with the size of dt*2df for each anchor point
df_hash = floor(0.1*size(time_freq_mat,1));
dt_hash = 20/window_time;
% creating hash-keys and hash-values for each pair of anchor points
% Key format: (f1*f2*(t2-t1)) 
% Value format: (song_name*time_from_start)
[hash_key, hash_value] = create_hash_tags(anchor_points, df_hash, dt_hash, 0);

clc; close all;

list = []; 

% searching for found hash-keys in the database
for k = 1:length(hash_key)
    key_tag = [num2str(hash_key(k, 1)), '*', num2str(hash_key(k, 2)), '*', num2str(hash_key(k, 3))];
    if (isKey(database, key_tag))
        temp1 = split(database(key_tag),'+');
        for p = 1:length(temp1)
            temp2 = split(temp1{p},'*');
            list = [list; [str2num(temp2{1}),str2num(temp2{2}),hash_value(k,2)]];
        end
    end
end


clc; close all;
[ss, pp] = average_probablity(list, song_num);
probb(i) = probb(i) + pp;
    end
    probb(i) = probb(i) / 100;

end
plot(SNR, probb)
%% 

function result = random_part_music(music, Fs)
    leng = 20*Fs;
    End = length(music) - leng - 10;
    begin = randi([1 End],1);
    result = music(begin:begin+leng - 1);
end


function [score, probability] = average_probablity(list, song_num)
    if ~isempty(list) % similarity length != 0
        matched_musics = unique(list(:,1)); % musics which for similarity is found
        score = zeros(length(matched_musics),2); % music name - repetition num
        eps = 0.1;
        for i = 1:length(matched_musics)
            temp = list(list(:,1) == matched_musics(i),:); 
            num = length(temp); % number of repeats for music i
            standard_dev = std(temp(:,2)-temp(:,3))/max(temp(:,2)-temp(:,3));
            score(i, 1) = matched_musics(i); % music name
            % score formula (using repetition num and std of delta ts)
            score(i, 2) = log10(num)*(1-exp((1-num)/10))*(1/(standard_dev+eps)); 
        end
        % applying softmax function to get probability distribution
        score(:, 2) = exp(score(:,2))./sum(exp(score(:,2)));
        % sorting based on scores
        [~, permutation] = sort(score(:, 2),'descend');
        score = score(permutation, :);
        prob = 0;
        for i = 1:length(score)
           
            if (score(i,1)) == song_num
            
                prob = prob +(score(i,2));
            end
        end
        probability = prob;
    else
        fprintf('list cannot be empty');
    end
end