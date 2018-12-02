import glob
import json
import ujson
import time

def mangle(s):
    return s.strip()[1:-1]

def cat_json(output_filename, input_filenames):
    count = 0
    # count = 654
    with file(output_filename, "a") as outfile:
        first = True
        for infile_name in input_filenames:
            with file(infile_name) as infile:
                if first:
                    outfile.write('[')
                    first = False
                else:
                    outfile.write(',')
                outfile.write(mangle(infile.read()))
                # ujson.dump(mangle(infile.read()), outfile)
                count += 1
                print "Files concatenated = ", count
                infile.seek(0,2)
        outfile.write(']')

def getFileNames():
    files = glob.glob('recorded-tweets-minify/*.json')
    for i in range(14):
        a = i*100
        b = a + 100
        filesToConcat = files[a:b]
        t1 = time.time()
        cat_json("recorded-tweets_minify/" + str(i) + ".json", filesToConcat)
        t2 = time.time()
        print t2-t1

getFileNames()
