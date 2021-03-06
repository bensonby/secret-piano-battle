# Piano Duel Medley from movie 'Secret'

## A. Generating music

### Creating midi

`midiPan = #0` for first movt 1, 2 and 3 (except 3B)
`midiPan = #0.2` for movt 3B (two piano)

In GarageBand, set reverb = max, and ambiance = 40% for movt 3B

### Merging the movements:

Step 1:
```
ffmpeg -ss 0 -to 00:01:51.8 -i v001-20200425-pan0-reverb0.wav -ss 00:01:51.8 -i v001-20200425-pan20-reverb100-ambience40.wav -filter_complex '[0:0][1:0]concat=n=2:v=0:a=1[out]' -map '[out]' v001.wav
```

Step 2:
Use audacity to apply Reverb (Large Hall preset), then insert 3-second silence at the beginning

## B. Creating score images for video

### Convert pdf to png

Use imagemagick's `convert` command:

```
convert -density 300 -alpha remove score.pdf score.png
```

### Extract sections from png

```
python3 crop-images.py crop-images-data.txt # for youtube video
```

or

```
python3 crop-images.py crop-images-data-igtv.txt # for ig video
```

## C. Creating final video

```
python3 video-image-info-for-ffmpeg.py video-image-info.txt > ffmpeg-image-info.txt
ffmpeg -i v001.wav -f concat -i ffmpeg-image-info.txt -ss 0 -t 154 piano-duel-v001.mp4 # ending time necessary otherwise it will be trimmed
```

Create video with proper format/codec (valid for IGTV):

```
python3 video-image-info-for-ffmpeg.py video-image-info-igtv.txt > ffmpeg-image-info-igtv.txt
ffmpeg -i v001.wav -f concat -i ffmpeg-image-info-igtv.txt -ss 0 -t 154 -loop 1 -c:a aac -b:a 256k -ar 44100 -c:v libx264 -pix_fmt yuv420p -preset faster -tune stillimage -shortest piano-duel-igtv-v001.mp4
```
