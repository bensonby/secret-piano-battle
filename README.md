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
python3 crop-images-py
# And then manually modify p3-4 and p4-1 to look better
```

## C. Creating final video

```
python3 video-image-info-for-ffmpeg.py > ffmpeg-image-info.txt
ffmpeg -i v001.wav -f concat -i ffmpeg-image-info.txt piano-duel-v001.mp4
```
