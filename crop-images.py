import os

output_width = 1920
output_height = 1080

with open('crop-images-data.txt') as open_file_object:
    for index, line in enumerate(open_file_object):
        if index == 0:
            width = int(line.split(" ")[0])
        else:
            (input_file, y_start, y_end, output_file) = line.split(" ")
            command = "convert {} -crop {}x{}+{}+{} -gravity center -resize {}x{} -extent {}x{} {}".format(
                input_file,
                width,
                int(y_end)-int(y_start),
                0,
                int(y_start),
                output_width,
                output_height,
                output_width,
                output_height,
                output_file
            )
            os.system(command)
