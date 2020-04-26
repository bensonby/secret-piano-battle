import argparse

parser = argparse.ArgumentParser()
parser.add_argument('filename', metavar='N', type=str)
args = parser.parse_args()

prev_start_time = 0
last_image = ""
with open(args.filename) as open_file_object:
    for (index, line) in enumerate(open_file_object):
        (image, start_time) = line.split(" ")
        start_time = float(start_time)
        duration = start_time - prev_start_time
        prev_start_time = start_time
        if index == 0:
            print("file '{}'".format(image))
        else:
            print("duration {}".format(duration))
            if image != '-':
                print("file '{}'".format(image))
                last_image = image
            else:
                print("file '{}'".format(last_image))
