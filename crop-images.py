import os

output_width = 1920
output_height = 1080
append_mode = False

with open('crop-images-data.txt') as open_file_object:
    for index, line in enumerate(open_file_object):
        if index == 0:
            width = int(line.split(" ")[0])
        else:
            elements = line.strip().split(" ")
            if elements[0] =="append":
                filenames = []
                final_filename = elements[1]
                num_files_to_merge = int(elements[2])
                append_mode = True
            elif append_mode:
                # create intermediate file for further merging
                (input_file, y_start, y_end, output_file) = elements
                command = "convert {} -crop {}x{}+{}+{} {}".format(
                    input_file,
                    width,
                    int(y_end)-int(y_start),
                    0,
                    int(y_start),
                    output_file
                )
                os.system(command)
                filenames.append(output_file)
                if len(filenames) == num_files_to_merge:
                    command1 = "convert -append {} {}".format(
                        " ".join(filenames),
                        "tmp.png",
                    )
                    command2 = "convert tmp.png -gravity center -resize {}x{} -extent {}x{} {}".format(
                        output_width,
                        output_height,
                        output_width,
                        output_height,
                        final_filename,
                    )
                    os.system(command1)
                    os.system(command2)
                    os.system("rm tmp.png")

                    # reset
                    num_files_to_merge = -1
                    filenames = []
                    append_mode = False
            else:
                (input_file, y_start, y_end, output_file) = elements
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
