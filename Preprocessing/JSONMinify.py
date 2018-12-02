import sys
import ujson
import json
import glob
def minify(output_filename, input_filename):
    # print 'output_filename'
    with file(output_filename, 'w') as outfile:
        # a = json.load(infile)
        with file(input_filename, 'r') as infile:
            a = json.load(infile)
            ujson.dump(a, outfile)

files = glob.glob('recorded-tweets/chunk*.json')
# files = ['recorded-tweets/chunk-00dfb3ed-4655-4ea9-8223-731ea9eb97a6.json','recorded-tweets/chunk-0a1f5cfe-0002-4dc5-ba6d-f54f24e2a5d8.json'][::-1]
#files = files[1144:]
count = 0
#count = 1144
for file1 in files:
    count += 1
    opFile = "recorded-tweets-minify/"+ str(count) + ".json"
    # print opFile, file1
    minify(opFile, file1)
    print "Files processed = ", count
    # print("Files processed = ", count)
