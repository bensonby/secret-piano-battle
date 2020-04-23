import argparse
from mido import MidiFile

parser = argparse.ArgumentParser()
parser.add_argument('filename', metavar='N', type=str)
args = parser.parse_args()

default_volume = 99
mid = MidiFile(args.filename)

for i, track in enumerate(mid.tracks):
    print('Track {}: {}'.format(i, track.name))
    volume = default_volume
    for msg in track:
        print(msg)
        if msg.type == 'control_change':
            # print(msg)
            pass
        if msg.type == 'note_on':
            pass
# mid.save(args.filename + '.velocity.midi')
