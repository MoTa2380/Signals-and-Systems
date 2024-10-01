
### **Project: Music Recognition using Audio Fingerprints**

In today’s world, there are moments when we hear a beautiful song at a party, restaurant, or elsewhere and wish to know the name of the song or the artist to listen to it again later. Thanks to modern technology, smartphones can assist in this task. By recording just 10 to 20 seconds of the song, there are many apps that can identify it with impressive accuracy, providing details about the track.

This project explores how such music recognition applications work, specifically how they can accurately identify a song from millions of tracks with just a short, noisy, and low-quality audio sample recorded in a non-ideal environment. The key challenge here is developing features that are resistant to noise and minor variations in the audio signal's amplitude. 

The concept of creating a set of unique features for each song, known as an "audio fingerprint," has been debated for a long time, and various algorithms have been proposed to achieve this. One of the most well-known algorithms for this purpose is Shazam. In this project, we aim to thoroughly understand this algorithm and its mechanisms for identifying songs using audio fingerprints.

The goal of the project is to implement key aspects of the Shazam algorithm, specifically how to:
1. Reduce the sampling rate of the audio to optimize computational efficiency.
2. Apply the Short-Time Fourier Transform (STFT) to extract meaningful audio features.
3. Identify "anchor points" in the frequency-time representation of the audio.
4. Generate a song fingerprint based on these anchor points.

By following these steps, we will construct a database of song fingerprints, which can later be used to identify new, short audio clips by matching their fingerprints with those in the database.
