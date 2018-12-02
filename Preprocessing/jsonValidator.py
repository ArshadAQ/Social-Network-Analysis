import json
import glob

def parse(filename):
    try:
        with open(filename) as f:
            return json.load(f)
    except ValueError as e:
        print('invalid json: %s' % e)
        return None # or: raise
invalidFiles = []
#files = glob.glob('recorded-tweets/chunk*.json')
files = glob.glob('recorded-tweets-minify/*.json')
for file in files:
    result = parse(file)
    if result == None:
        invalidFiles.append(file)
print invalidFiles
