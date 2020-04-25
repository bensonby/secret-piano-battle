prev_start_time = 0
with open('video-image-info.txt') as open_file_object:
    for (index, line) in enumerate(open_file_object):
        (image, start_time) = line.split(" ")
        start_time = float(start_time)
        duration = start_time - prev_start_time
        prev_start_time = start_time
        if index == 0:
            print("file '{}'".format(image))
        else:
            print("duration {}".format(duration))
            print("file '{}'".format(image))
